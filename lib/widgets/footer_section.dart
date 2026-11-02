import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class FooterSection extends StatefulWidget {
  final VoidCallback onOpenResume;
  final Function(String key) onNavigate;

  const FooterSection({
    super.key,
    required this.onOpenResume,
    required this.onNavigate,
  });

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  late String _timeString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) _updateTime();
    });
  }

  void _updateTime() {
    // Current Indian Standard Time (UTC + 5:30)
    final now = DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
    final format = DateFormat('hh:mm:ss a');
    setState(() {
      _timeString = format.format(now);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    final currentYear = DateTime.now().year;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF07080C),
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 16,
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBrandCol(),
                        _buildNavCol(),
                        _buildCandidateCol(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandCol(),
                        const SizedBox(height: 28),
                        _buildNavCol(),
                        const SizedBox(height: 28),
                        _buildCandidateCol(),
                      ],
                    ),
              const Divider(color: AppColors.borderSubtle, height: 48),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 10,
                children: [
                  Text(
                    "© $currentYear Maniananth M. All rights reserved.",
                    style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11),
                  ),
                  Text(
                    "Engineered with Flutter Web & Firebase",
                    style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.accentPrimary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.accentPrimary),
              ),
              alignment: Alignment.center,
              child: Text(
                PortfolioData.personal.initials,
                style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              PortfolioData.personal.name,
              style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Text(
            "Production Software Engineer specializing in Python & FastAPI backends, Generative AI workflows, PostgreSQL, and Flutter clients.",
            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 12.5, height: 1.5),
          ),
        ),
        const SizedBox(height: 16),

        // Live Clock Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.accentPrimary, shape: BoxShape.circle)),
              const SizedBox(width: 8),
              const Icon(Icons.access_time_rounded, color: AppColors.accentPrimary, size: 13),
              const SizedBox(width: 6),
              Text(
                "Coimbatore, IN: $_timeString (IST)",
                style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 11.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PORTFOLIO SECTIONS",
          style: GoogleFonts.jetBrainsMono(color: AppColors.textPrimary, fontSize: 11.5, fontWeight: FontWeight.bold, letterSpacing: 0.4),
        ),
        const SizedBox(height: 12),
        _footerLink("Featured Projects", () => widget.onNavigate('projects')),
        _footerLink("System Capabilities", () => widget.onNavigate('capabilities')),
        _footerLink("SPI Equipments Experience", () => widget.onNavigate('experience')),
        _footerLink("Competency Matrix", () => widget.onNavigate('skills')),
        _footerLink("Engineering Principles", () => widget.onNavigate('principles')),
        _footerLink("About & Education", () => widget.onNavigate('about')),
      ],
    );
  }

  Widget _buildCandidateCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CANDIDATE VERIFICATION",
          style: GoogleFonts.jetBrainsMono(color: AppColors.textPrimary, fontSize: 11.5, fontWeight: FontWeight.bold, letterSpacing: 0.4),
        ),
        const SizedBox(height: 12),
        _footerLink("→ View & Print ATS Résumé", widget.onOpenResume, isAccent: true),
        _footerLink("LinkedIn • maniananth23", () => launchUrl(Uri.parse(PortfolioData.personal.linkedin))),
        _footerLink("GitHub • Maniananthgit", () => launchUrl(Uri.parse(PortfolioData.personal.github))),
        _footerLink("Email • maniananth93@gmail.com", () => launchUrl(Uri.parse("mailto:${PortfolioData.personal.email}"))),
      ],
    );
  }

  Widget _footerLink(String title, VoidCallback onTap, {bool isAccent = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: isAccent ? AppColors.accentPrimary : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: isAccent ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
