import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class PrinciplesSection extends StatelessWidget {
  const PrinciplesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final principles = PortfolioData.engineeringPrinciples;

    final icons = [
      Icons.description_outlined,
      Icons.bolt_rounded,
      Icons.lock_clock_outlined,
      Icons.storage_rounded,
      Icons.fact_check_outlined,
    ];

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
                stepNumber: "06",
                label: "ENGINEERING PRINCIPLES",
                icon: Icons.psychology_outlined,
              ),
              const SizedBox(height: 14),
              Text(
                "Engineering Principles",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "How I approach backend systems design, fault tolerance, and API reliability when building software meant to run without intervention.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              // Principles Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = isDesktop ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth;
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: principles.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final p = entry.value;
                      final icon = icons[idx % icons.length];

                      return SizedBox(
                        width: cardWidth,
                        child: HoverLiftCard(
                          liftOffset: -6.0,
                          glowColor: AppColors.accentPrimary,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.accentPrimary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColors.borderAccent),
                                    ),
                                    child: Icon(icon, color: AppColors.accentPrimary, size: 20),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          p.title,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: AppColors.textPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          p.subtitle,
                                          style: GoogleFonts.jetBrainsMono(
                                            color: AppColors.accentPrimary,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                p.description,
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                  height: 1.55,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
