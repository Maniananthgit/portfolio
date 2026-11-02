import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'case_study_modal.dart';
import 'interactive_animations.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final projects = PortfolioData.projects;

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
              // Section Header
              const StepSectionBadge(
                stepNumber: "02",
                label: "FEATURED CASE STUDIES",
                icon: Icons.layers_rounded,
              ),
              const SizedBox(height: 14),
              Text(
                "Production Engineering Work",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Deep-dive into production systems built at SPI Equipments India. Each case study details real technical trade-offs, architecture diagrams, and concurrency solutions.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 36),

              // Project 1: Service Management App
              _buildProjectCard(
                context: context,
                project: projects[0],
                category: "Enterprise Industrial Service",
                tagline: "Flutter &bull; FastAPI &bull; PostgreSQL",
                accentColor: AppColors.accentPrimary,
                mockup: _buildServiceAppMockup(),
              ),
              const SizedBox(height: 48),

              // Project 2: Restaurant KDS
              _buildProjectCard(
                context: context,
                project: projects[1],
                category: "Real-Time Concurrency System",
                tagline: "FastAPI &bull; WebSockets &bull; MySQL/Postgres",
                accentColor: AppColors.accentSky,
                mockup: _buildKdsMockup(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required ProjectItem project,
    required String category,
    required String tagline,
    required Color accentColor,
    required Widget mockup,
  }) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return HoverLiftCard(
      liftOffset: -8.0,
      glowColor: accentColor,
      borderColor: accentColor,
      borderRadius: BorderRadius.circular(20),
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: isDesktop
            ? IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(36),
                        child: _buildProjectDetails(context, project, category, accentColor),
                      ),
                    ),
                    Container(width: 1, color: AppColors.borderSubtle),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: const Color(0xFF0C0E14),
                        padding: const EdgeInsets.all(32),
                        alignment: Alignment.center,
                        child: mockup,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: _buildProjectDetails(context, project, category, accentColor),
                  ),
                  Container(
                    color: const Color(0xFF0C0E14),
                    padding: const EdgeInsets.all(20),
                    child: mockup,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildProjectDetails(BuildContext context, ProjectItem project, String category, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 6,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: accentColor.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.jetBrainsMono(
                      color: accentColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Production Deployed",
                  style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              project.title,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              project.subtitle,
              style: GoogleFonts.plusJakartaSans(
                color: accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              project.summary,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textSecondary,
                fontSize: 14.5,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),

            // Bullet Highlights
            _highlightBullet("Role-Based Access Control (RBAC)", "JWT gates separating Admin, Service Manager & Field Techs.", accentColor),
            const SizedBox(height: 8),
            _highlightBullet("Real-Time Dispatch Pipeline", "WebSocket events pushing new tickets directly to field engineers.", accentColor),
            const SizedBox(height: 8),
            _highlightBullet("Optimized Relational Schema", "PostgreSQL schema with connection pooling & composite indexing.", accentColor),
            const SizedBox(height: 24),

            // Tech Stack Chips
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: project.tags
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.04),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.borderSubtle),
                        ),
                        child: Text(
                          t,
                          style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 11.5),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Case Study Modal Trigger
        ElevatedButton.icon(
          onPressed: () => CaseStudyModal.show(context, project),
          icon: const Icon(Icons.menu_book_rounded, size: 16),
          label: const Text("Read Architectural Case Study"),
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: const Color(0xFF042F2E),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13.5),
          ),
        ),
      ],
    );
  }

  Widget _highlightBullet(String title, String desc, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle_rounded, color: color, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13, height: 1.45),
              children: [
                TextSpan(text: "$title: ", style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                TextSpan(text: desc),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceAppMockup() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF131722),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderMedium),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.6), blurRadius: 20),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            color: const Color(0xFF1A202D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.build_circle_rounded, color: AppColors.accentPrimary, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      "SPI Service Dispatch Console",
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "WS: CONNECTED",
                  style: GoogleFonts.jetBrainsMono(color: AppColors.accentEmerald, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _ticketItem("TKT-8942", "High Pressure Pump Overhaul", "Technician Assigned: Ramesh K.", "IN PROGRESS", AppColors.accentAmber),
                const SizedBox(height: 10),
                _ticketItem("TKT-8943", "Valve Seal Replacement & Testing", "Awaiting Field Verification", "QUEUED", AppColors.accentSky),
                const SizedBox(height: 10),
                _ticketItem("TKT-8940", "PLC Controller Firmware Audit", "Signed Off by Plant Manager", "COMPLETED", AppColors.accentEmerald),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKdsMockup() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF131722),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderMedium),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.6), blurRadius: 20),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            color: const Color(0xFF181F2D),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "STATION: GRILL & HOT PREP",
                  style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontWeight: FontWeight.bold, fontSize: 11),
                ),
                Row(
                  children: [
                    Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.accentEmerald, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(
                      "ACTIVE QUEUE: 3",
                      style: GoogleFonts.jetBrainsMono(color: AppColors.accentEmerald, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.accentSky.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.accentSky.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ORDER #1042 [KIOSK-02]",
                            style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            "COOKING [02:45]",
                            style: GoogleFonts.jetBrainsMono(color: AppColors.accentAmber, fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text("• 2x Double Artisan Patty (Medium Rare)", style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 12)),
                      Text("• 1x Rosemary Garlic Fries (Crispy)", style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 12)),
                      const Divider(color: AppColors.borderSubtle, height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("IDEMPOTENCY: 9e2a...c01f", style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 9.5)),
                          Text("TAP TO PLATE →", style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontWeight: FontWeight.bold, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.02),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ORDER #1043 [MOBILE-WEB]", style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11)),
                      Text("QUEUED [00:30]", style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 10.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ticketItem(String id, String title, String subtitle, String status, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(id, style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 11, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Expanded(child: Text(title, overflow: TextOverflow.ellipsis, style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.bold))),
                  ],
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: GoogleFonts.plusJakartaSans(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: statusColor.withValues(alpha: 0.3)),
            ),
            child: Text(
              status,
              style: GoogleFonts.jetBrainsMono(color: statusColor, fontSize: 9.5, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
