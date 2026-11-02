import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class ContactSection extends StatefulWidget {
  final VoidCallback onOpenResume;

  const ContactSection({super.key, required this.onOpenResume});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _copiedEmail = false;
  bool _copiedPhone = false;

  void _copyEmail() {
    Clipboard.setData(ClipboardData(text: PortfolioData.personal.email));
    setState(() => _copiedEmail = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copiedEmail = false);
    });
  }

  void _copyPhone() {
    Clipboard.setData(ClipboardData(text: PortfolioData.personal.phone));
    setState(() => _copiedPhone = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copiedPhone = false);
    });
  }

  void _sendMail() {
    final uri = Uri(
      scheme: 'mailto',
      path: PortfolioData.personal.email,
      queryParameters: {
        'subject': 'Hiring Inquiry: Python Backend / Full-Stack Engineer — Maniananth M',
        'body': 'Hello Maniananth,\n\nI reviewed your engineering portfolio and case studies at SPI Equipments India. We have an open role that aligns with your background.\n\nLet us connect for an exploratory discussion.',
      },
    );
    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final p = PortfolioData.personal;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 32 : 16,
            vertical: 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accentMuted,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.borderAccent),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline, color: AppColors.accentPrimary, size: 14),
                    const SizedBox(width: 8),
                    Text(
                      "RECRUITER DIRECT CHANNEL",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.accentPrimary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Text(
                "Get in Touch",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Currently based in Coimbatore and actively interviewing for Python Backend Engineer, FastAPI Developer, and Full-Stack Software Engineering roles.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: _buildCommunicationCard(p)),
                        const SizedBox(width: 28),
                        Expanded(flex: 5, child: _buildProfilesCard(p)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildCommunicationCard(p),
                        const SizedBox(height: 28),
                        _buildProfilesCard(p),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunicationCard(PersonalInfo p) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderAccent),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.35), blurRadius: 20),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Direct Communication",
            style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "Fastest response via direct phone call, email, and LinkedIn message. Available for technical discussions and code walkthroughs.",
            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.5),
          ),
          const SizedBox(height: 20),

          // Email Tile
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PRIMARY EMAIL", style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 10)),
                      const SizedBox(height: 4),
                      Text(p.email, style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 13.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _copyEmail,
                  icon: Icon(_copiedEmail ? Icons.check_circle_rounded : Icons.copy_rounded, color: _copiedEmail ? AppColors.accentPrimary : AppColors.textSecondary, size: 18),
                  tooltip: "Copy Email",
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Phone Tile
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DIRECT PHONE / WHATSAPP", style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 10)),
                      const SizedBox(height: 4),
                      Text(p.phone, style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontSize: 13.5, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _copyPhone,
                  icon: Icon(_copiedPhone ? Icons.check_circle_rounded : Icons.copy_rounded, color: _copiedPhone ? AppColors.accentPrimary : AppColors.textSecondary, size: 18),
                  tooltip: "Copy Phone",
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Send Inquiry CTA
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _sendMail,
              icon: const Icon(Icons.send_rounded, size: 16),
              label: const Text("Send Hiring Inquiry Email"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                foregroundColor: const Color(0xFF042F2E),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilesCard(PersonalInfo p) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profiles & Credentials",
            style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "Review verified commercial history, GitHub code repositories, and view/print the official single-column ATS résumé.",
            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.5),
          ),
          const SizedBox(height: 20),

          // LinkedIn Card
          _linkTile(
            title: "LinkedIn Profile",
            subtitle: "linkedin.com/in/maniananth23",
            icon: Icons.link_rounded,
            color: const Color(0xFF0A66C2),
            url: p.linkedin,
          ),
          const SizedBox(height: 12),

          // GitHub Card
          _linkTile(
            title: "GitHub Repositories",
            subtitle: "github.com/Maniananthgit",
            icon: Icons.code_rounded,
            color: AppColors.accentLight,
            url: p.github,
          ),
          const SizedBox(height: 24),

          // ATS Résumé Trigger
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: widget.onOpenResume,
              icon: const Icon(Icons.description_outlined, size: 16),
              label: const Text("View & Print ATS Résumé"),
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF0F1218),
                foregroundColor: AppColors.textPrimary,
                side: const BorderSide(color: AppColors.borderMedium),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.02),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.textMuted,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.open_in_new_rounded, color: AppColors.textMuted, size: 16),
          ],
        ),
      ),
    );
  }
}
