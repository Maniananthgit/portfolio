import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onOpenResume;
  final Function(String sectionKey) onNavigate;

  const Navbar({
    super.key,
    required this.onOpenResume,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1120;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bgPrimary.withValues(alpha: 0.82),
            border: const Border(
              bottom: BorderSide(color: AppColors.borderSubtle, width: 1),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 32 : 16,
            vertical: 12,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Wordmark & Monogram
                  InkWell(
                    onTap: () => onNavigate('hero'),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppColors.accentPrimary.withValues(alpha: 0.15),
                            border: Border.all(color: AppColors.accentPrimary, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accentPrimary.withValues(alpha: 0.25),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            PortfolioData.personal.initials,
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.accentPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              PortfolioData.personal.name,
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                letterSpacing: -0.2,
                              ),
                            ),
                            Text(
                              "Backend & Full-Stack Architect",
                              style: GoogleFonts.jetBrainsMono(
                                color: AppColors.textSecondary,
                                fontSize: 10.5,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Navigation Links (Desktop)
                  if (isDesktop)
                    Row(
                      children: [
                        _NavItem(label: "Projects", onTap: () => onNavigate('projects')),
                        _NavItem(label: "Capabilities", onTap: () => onNavigate('capabilities')),
                        _NavItem(label: "Experience", onTap: () => onNavigate('experience')),
                        _NavItem(label: "Competencies", onTap: () => onNavigate('skills')),
                        _NavItem(label: "Principles", onTap: () => onNavigate('principles')),
                        _NavItem(label: "About", onTap: () => onNavigate('about')),
                        _NavItem(label: "Contact", onTap: () => onNavigate('contact')),
                        const SizedBox(width: 16),
                        _ResumeNavButton(onPressed: onOpenResume),
                      ],
                    )
                  else
                    // Mobile Menu Button
                    IconButton(
                      icon: const Icon(Icons.menu_rounded, color: AppColors.accentPrimary),
                      onPressed: () => _openMobileMenu(context),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        side: BorderSide(color: AppColors.borderSubtle),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _drawerItem(ctx, "Featured Projects", Icons.layers_outlined, 'projects'),
              _drawerItem(ctx, "Architecture Capabilities", Icons.memory, 'capabilities'),
              _drawerItem(ctx, "Commercial Experience", Icons.business_center_outlined, 'experience'),
              _drawerItem(ctx, "Competency Matrix", Icons.code_rounded, 'skills'),
              _drawerItem(ctx, "Engineering Principles", Icons.auto_graph_rounded, 'principles'),
              _drawerItem(ctx, "About & Education", Icons.person_outline, 'about'),
              _drawerItem(ctx, "Direct Contact", Icons.mail_outline, 'contact'),
              const Divider(color: AppColors.borderSubtle, height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    onOpenResume();
                  },
                  icon: const Icon(Icons.description_outlined, size: 16),
                  label: const Text("View & Print ATS Résumé"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPrimary,
                    foregroundColor: const Color(0xFF042F2E),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, IconData icon, String key) {
    return ListTile(
      leading: Icon(icon, color: AppColors.accentPrimary, size: 20),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14.5, fontWeight: FontWeight.w600),
      ),
      onTap: () {
        Navigator.pop(context);
        onNavigate(key);
      },
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accentPrimary.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.plusJakartaSans(
                  color: _isHovered ? AppColors.accentPrimary : AppColors.textSecondary,
                  fontSize: 13.5,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: _isHovered ? 16 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.accentPrimary.withValues(alpha: 0.8),
                            blurRadius: 4,
                          ),
                        ]
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResumeNavButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _ResumeNavButton({required this.onPressed});

  @override
  State<_ResumeNavButton> createState() => _ResumeNavButtonState();
}

class _ResumeNavButtonState extends State<_ResumeNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0.0, _isHovered ? -2.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.3),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          icon: const Icon(Icons.description_outlined, size: 16),
          label: Text(
            "ATS Résumé",
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered ? AppColors.accentPrimary.withValues(alpha: 0.2) : AppColors.bgCard,
            foregroundColor: AppColors.accentPrimary,
            side: BorderSide(
              color: _isHovered ? AppColors.accentPrimary : AppColors.borderAccent,
              width: 1.2,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }
}
