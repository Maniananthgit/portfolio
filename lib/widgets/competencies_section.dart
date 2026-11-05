import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class CompetenciesSection extends StatefulWidget {
  const CompetenciesSection({super.key});

  @override
  State<CompetenciesSection> createState() => _CompetenciesSectionState();
}

class _CompetenciesSectionState extends State<CompetenciesSection> {
  String _activeFilter = 'all';

  final List<Map<String, dynamic>> _categories = [
    {'key': 'all', 'label': 'All Domains', 'icon': Icons.grid_view_rounded},
    {'key': 'backend', 'label': 'Backend Development', 'icon': Icons.dns_rounded},
    {'key': 'database', 'label': 'Databases & Data', 'icon': Icons.storage_rounded},
    {'key': 'architectureSecurity', 'label': 'Architecture & Security', 'icon': Icons.security_rounded},
    {'key': 'cloudDevops', 'label': 'Cloud & DevOps', 'icon': Icons.cloud_outlined},
    {'key': 'frontendApp', 'label': 'Flutter & Desktop HMI', 'icon': Icons.desktop_windows_rounded},
  ];

  Map<String, List<SkillItem>> _getFilteredGroups() {
    if (_activeFilter == 'all') {
      return PortfolioData.competencies;
    }
    return {_activeFilter: PortfolioData.competencies[_activeFilter] ?? []};
  }

  String _getCategoryTitle(String key) {
    switch (key) {
      case 'backend':
        return 'Backend Development';
      case 'database':
        return 'Databases & Storage';
      case 'architectureSecurity':
        return 'Architecture, Fundamentals & Security';
      case 'cloudDevops':
        return 'DevOps & Cloud Infrastructure';
      case 'frontendApp':
        return 'Flutter, Dart & Industrial Desktop HMI';
      default:
        return 'Technical Competencies';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final groups = _getFilteredGroups();

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
                stepNumber: "05",
                label: "TECHNICAL COMPETENCY MATRIX",
                icon: Icons.code_rounded,
              ),
              const SizedBox(height: 14),
              Text(
                "Structured Stack Breakdown",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Comprehensive breakdown of backend architecture, database optimization, Generative AI & vector search, DevOps, automated testing, and Flutter clients.",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 28),

              // Filter Pills
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _categories.map((cat) {
                  final isSelected = _activeFilter == cat['key'];
                  return InkWell(
                    onTap: () => setState(() => _activeFilter = cat['key']!),
                    borderRadius: BorderRadius.circular(30),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.accentPrimary : AppColors.bgCard,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isSelected ? AppColors.accentPrimary : AppColors.borderSubtle,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            cat['icon'] as IconData,
                            size: 14,
                            color: isSelected ? const Color(0xFF042F2E) : AppColors.textSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            cat['label'] as String,
                            style: GoogleFonts.plusJakartaSans(
                              color: isSelected ? const Color(0xFF042F2E) : AppColors.textSecondary,
                              fontSize: 12.5,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 36),

              // Categories Display
              ...groups.entries.map((entry) {
                final categoryTitle = _getCategoryTitle(entry.key);
                final skills = entry.value;

                return Container(
                  margin: const EdgeInsets.only(bottom: 28),
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
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.accentPrimary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            categoryTitle,
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Grid of skills
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final itemWidth = isDesktop ? (constraints.maxWidth - 24) / 2 : constraints.maxWidth;
                          return Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: skills
                                .map((s) => SizedBox(
                                      width: itemWidth,
                                      child: _SkillTile(s: s),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillTile extends StatefulWidget {
  final SkillItem s;
  const _SkillTile({required this.s});

  @override
  State<_SkillTile> createState() => _SkillTileState();
}

class _SkillTileState extends State<_SkillTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0.0, _isHovered ? -2.0 : 0.0, 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.accentPrimary.withValues(alpha: 0.06) : Colors.white.withValues(alpha: 0.02),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isHovered ? AppColors.accentPrimary.withValues(alpha: 0.6) : AppColors.borderSubtle,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.s.name,
                style: GoogleFonts.plusJakartaSans(
                  color: _isHovered ? AppColors.accentPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.accentMuted,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.borderAccent),
                  ),
                  child: Text(
                    widget.s.level,
                    style: GoogleFonts.jetBrainsMono(
                      color: AppColors.accentPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.s.years,
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
