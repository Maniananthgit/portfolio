import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onOpenResume;
  final VoidCallback onExploreProjects;

  const HeroSection({
    super.key,
    required this.onOpenResume,
    required this.onExploreProjects,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  bool _copied = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _copyEmail() {
    Clipboard.setData(ClipboardData(text: PortfolioData.personal.email));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 32 : 16,
            vertical: isDesktop ? 64 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExecutiveSummary(isDesktop),
              const SizedBox(height: 48),
              _buildMetricsGrid(width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExecutiveSummary(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Availability & Verification Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.accentMuted,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.borderAccent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.accentPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentPrimary.withValues(alpha: 0.3 + (_pulseController.value * 0.5)),
                          blurRadius: 6 + (_pulseController.value * 6),
                          spreadRadius: _pulseController.value * 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "AVAILABLE FOR SENIOR BACKEND & FULL-STACK ROLES",
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.accentPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Role Designation
        Text(
          "Python Backend Engineer • FastAPI Specialist • Full-Stack Architect",
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.accentPrimary,
            fontSize: isDesktop ? 14 : 12.5,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 14),

        // Main Headline
        RichText(
          text: TextSpan(
            style: GoogleFonts.plusJakartaSans(
              fontSize: isDesktop ? 44 : 30,
              fontWeight: FontWeight.w800,
              height: 1.16,
              letterSpacing: -1.0,
              color: AppColors.textPrimary,
            ),
            children: const [
              TextSpan(text: "Engineering high-concurrency "),
              TextSpan(
                text: "FastAPI microservices",
                style: TextStyle(
                  color: AppColors.accentPrimary,
                ),
              ),
              TextSpan(text: " & real-time operational systems."),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Executive Bio
        Text(
          "Software Engineer with ~3 years of verified production experience at SPI Equipments India. Specialized in asynchronous Python backends, real-time WebSocket pipelines, PostgreSQL query optimization, and production Flutter client applications.",
          style: GoogleFonts.plusJakartaSans(
            fontSize: isDesktop ? 17 : 15,
            height: 1.65,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),

        // Skills Pill Strip
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _skillBadge("SPI Equipments (~3 Yrs)", isAccent: true),
            _skillBadge("FastAPI & Python 3.11+"),
            _skillBadge("WebSockets & AsyncIO"),
            _skillBadge("PostgreSQL & MySQL"),
            _skillBadge("Flutter & Dart Clients"),
            _skillBadge("GenAI & RAG (pgvector)"),
            _skillBadge("Docker & Pytest"),
          ],
        ),
        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: widget.onExploreProjects,
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: const Text("Explore Featured Projects"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                foregroundColor: const Color(0xFF042F2E),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            OutlinedButton.icon(
              onPressed: widget.onOpenResume,
              icon: const Icon(Icons.file_copy_outlined, size: 16),
              label: const Text("ATS-Friendly Résumé"),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.bgCard,
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(color: AppColors.borderMedium),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            OutlinedButton.icon(
              onPressed: _copyEmail,
              icon: Icon(
                _copied ? Icons.check_circle_rounded : Icons.copy_rounded,
                size: 16,
                color: _copied ? AppColors.accentPrimary : AppColors.textSecondary,
              ),
              label: Text(_copied ? "Email Copied!" : "Copy Email"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                side: const BorderSide(color: AppColors.borderSubtle),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Meta Strip (Wrap prevents mobile overflow)
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 8,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on_outlined, color: AppColors.textMuted, size: 16),
                const SizedBox(width: 6),
                Text(
                  "Coimbatore, Tamil Nadu, India",
                  style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5),
                ),
              ],
            ),
            Text("•", style: GoogleFonts.plusJakartaSans(color: AppColors.textMuted)),
            InkWell(
              onTap: () => launchUrl(Uri.parse(PortfolioData.personal.linkedin)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LinkedIn Verified Profile",
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.accentPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.open_in_new_rounded, size: 13, color: AppColors.accentPrimary),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricsGrid(double screenWidth) {
    final metrics = PortfolioData.metrics;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 540
                ? 2
                : 1;

        final itemWidth = (constraints.maxWidth - ((crossAxisCount - 1) * 16)) / crossAxisCount;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: metrics.map((m) {
            return SizedBox(
              width: itemWidth,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.bgCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderSubtle),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      m.value,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.accentPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      m.label,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textPrimary,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      m.detail,
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.textMuted,
                        fontSize: 11,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _skillBadge(String label, {bool isAccent = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isAccent ? AppColors.accentMuted : const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: isAccent ? AppColors.borderAccent : AppColors.borderSubtle),
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          color: isAccent ? AppColors.accentPrimary : AppColors.textSecondary,
          fontSize: 12,
          fontWeight: isAccent ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}
