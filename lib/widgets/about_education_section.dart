import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class AboutEducationSection extends StatelessWidget {
  const AboutEducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final edu = PortfolioData.education[0];
    final cert = PortfolioData.certifications[0];

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
              const StepSectionBadge(
                stepNumber: "07",
                label: "ABOUT & EDUCATION",
                icon: Icons.school_outlined,
              ),
              const SizedBox(height: 14),
              Text(
                "About & Education",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Rigorous engineering background combined with specialized full-stack and backend software development credentials.",
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
                        Expanded(flex: 5, child: _buildProfileCard()),
                        const SizedBox(width: 28),
                        Expanded(flex: 5, child: _buildEducationCertCol(edu, cert)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildProfileCard(),
                        const SizedBox(height: 28),
                        _buildEducationCertCol(edu, cert),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderAccent),
                ),
                child: const Icon(Icons.person_outline_rounded, color: AppColors.accentPrimary, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                "Professional Profile",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            PortfolioData.personal.summary,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textSecondary,
              fontSize: 14.5,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 20),
          _bulletHighlight("Direct commercial production tenure at SPI Equipments India."),
          const SizedBox(height: 8),
          _bulletHighlight("Architectural focus on non-blocking ASGI FastAPI web services."),
          const SizedBox(height: 8),
          _bulletHighlight("Full-stack client delivery using Flutter & Provider state management."),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1218),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, color: AppColors.accentPrimary, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Coimbatore, Tamil Nadu, India • Open to Remote & Relocation",
                    style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 11.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletHighlight(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.accentPrimary, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 13.5, height: 1.4),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCertCol(EducationItem edu, CertificationItem cert) {
    return Column(
      children: [
        // Education Degree Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.school_rounded, color: AppColors.accentSky, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "ACADEMIC DEGREE",
                        style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.accentSky.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      edu.grade,
                      style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                edu.degree,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "${edu.institution} • ${edu.duration}",
                style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 12),
              ),
              const SizedBox(height: 10),
              Text(
                edu.description,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.55),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Certification Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.workspace_premium_rounded, color: AppColors.accentAmber, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "OFFICIAL CERTIFICATION",
                        style: GoogleFonts.jetBrainsMono(color: AppColors.accentAmber, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    cert.year,
                    style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                cert.title,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                cert.issuer,
                style: GoogleFonts.jetBrainsMono(color: AppColors.accentAmber, fontSize: 12),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: cert.skills
                    .map((s) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.04),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Text(s, style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 11)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
