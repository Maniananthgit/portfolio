import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final exp = PortfolioData.experience[0];

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
                    const Icon(Icons.business_center_outlined, color: AppColors.accentPrimary, size: 14),
                    const SizedBox(width: 8),
                    Text(
                      "PROFESSIONAL EXPERIENCE",
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
                "Verified Engineering History",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Direct commercial software development experience designing, deploying, and maintaining high-throughput backend services and enterprise client applications.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              // Experience Card
              HoverLiftCard(
                liftOffset: -6.0,
                glowColor: AppColors.accentPrimary,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(isDesktop ? 36 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: AppColors.accentPrimary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColors.borderAccent),
                                    ),
                                    child: const Icon(Icons.apartment_rounded, color: AppColors.accentPrimary, size: 22),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exp.company,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: AppColors.textPrimary,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          exp.role,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: AppColors.accentPrimary,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (isDesktop)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.accentMuted,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.borderAccent),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today_rounded, color: AppColors.accentPrimary, size: 12),
                                const SizedBox(width: 6),
                                Text(
                                  exp.period,
                                  style: GoogleFonts.jetBrainsMono(
                                    color: AppColors.accentPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    if (!isDesktop) ...[
                      const SizedBox(height: 12),
                      Text(
                        "${exp.period} • ${exp.location}",
                        style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 12),
                      ),
                    ],
                    const Divider(color: AppColors.borderSubtle, height: 32),

                    Text(
                      exp.description,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      "Key Architectural Contributions & Responsibilities:",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Contributions
                    ...exp.contributions.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(Icons.check_circle_rounded, color: AppColors.accentPrimary, size: 16),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  c,
                                  style: GoogleFonts.plusJakartaSans(
                                    color: AppColors.textSecondary,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
