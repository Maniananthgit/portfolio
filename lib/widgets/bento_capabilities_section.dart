import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class BentoCapabilitiesSection extends StatelessWidget {
  const BentoCapabilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 960;
    final capabilities = PortfolioData.engineeringCapabilities;

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
              // Section Badge
              const StepSectionBadge(
                stepNumber: "03",
                label: "ARCHITECTURE & COMPETENCIES",
                icon: Icons.account_tree_outlined,
              ),
              const SizedBox(height: 14),
              Text(
                "Engineering Capabilities & Systems Mastery",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Not just technology buzzwords, but concrete architectural competencies developed across production deployments at SPI Equipments India.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              // Bento Cards Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = isDesktop ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth;
                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: capabilities
                        .map((c) => SizedBox(
                              width: cardWidth,
                              child: _buildCapabilityCard(c),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCapabilityCard(CapabilityItem c) {
    IconData icon;
    Color color;
    switch (c.id) {
      case 'async-apis':
        icon = Icons.terminal_rounded;
        color = AppColors.accentPrimary;
        break;
      case 'ai-genai':
        icon = Icons.auto_awesome_rounded;
        color = const Color(0xFFC084FC);
        break;
      case 'realtime-websockets':
        icon = Icons.sensors_rounded;
        color = AppColors.accentSky;
        break;
      case 'database-engineering':
        icon = Icons.storage_rounded;
        color = AppColors.accentEmerald;
        break;
      case 'mobile-frontend':
        icon = Icons.smartphone_rounded;
        color = AppColors.accentLight;
        break;
      case 'devops-testing':
        icon = Icons.security_rounded;
        color = AppColors.accentAmber;
        break;
      default:
        icon = Icons.code_rounded;
        color = AppColors.accentPrimary;
    }

    return HoverLiftCard(
      liftOffset: -8.0,
      glowColor: color,
      borderColor: color,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.withValues(alpha: 0.3)),
                    ),
                    child: Icon(icon, color: color, size: 22),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      c.category.toUpperCase(),
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.textMuted,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                c.title,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                c.description,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 16),

              // Tags
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: c.tags
                    .map((t) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.03),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Text(
                            t,
                            style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 11),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Highlight Metric Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Icon(Icons.insights_rounded, color: color, size: 14),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    c.highlight,
                    style: GoogleFonts.jetBrainsMono(color: color, fontSize: 11.5, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
