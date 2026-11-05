import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class Navbar extends StatelessWidget {
  final VoidCallback onOpenResume;
  final Function(String sectionKey) onNavigate;
  final String activeSectionKey;

  const Navbar({
    super.key,
    required this.onOpenResume,
    required this.onNavigate,
    this.activeSectionKey = 'hero',
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
                              "Python Backend & Flutter Apps",
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
                        _NavItem(
                          label: "Projects",
                          isActive: activeSectionKey == 'projects',
                          onTap: () => onNavigate('projects'),
                        ),
                        _NavItem(
                          label: "Capabilities",
                          isActive: activeSectionKey == 'capabilities',
                          onTap: () => onNavigate('capabilities'),
                        ),
                        _NavItem(
                          label: "Experience",
                          isActive: activeSectionKey == 'experience',
                          onTap: () => onNavigate('experience'),
                        ),
                        _NavItem(
                          label: "Competencies",
                          isActive: activeSectionKey == 'skills',
                          onTap: () => onNavigate('skills'),
                        ),
                        _NavItem(
                          label: "Principles",
                          isActive: activeSectionKey == 'principles',
                          onTap: () => onNavigate('principles'),
                        ),
                        _NavItem(
                          label: "About",
                          isActive: activeSectionKey == 'about',
                          onTap: () => onNavigate('about'),
                        ),
                        _NavItem(
                          label: "Contact",
                          isActive: activeSectionKey == 'contact',
                          onTap: () => onNavigate('contact'),
                        ),
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
                  label: const Text("View & Copy ATS Résumé"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentPrimary,
                    foregroundColor: const Color(0xFF042F2E),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    launchUrl(
                      Uri.base.resolve(PortfolioData.personal.resumePdfUrl),
                      mode: LaunchMode.externalApplication,
                      webOnlyWindowName: '_blank',
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf_rounded, size: 16),
                  label: const Text("Download Resume (PDF)"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.accentSky,
                    side: const BorderSide(color: AppColors.accentSky, width: 1.2),
                    padding: const EdgeInsets.symmetric(vertical: 13),
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
    final isCurrent = activeSectionKey == key;
    return ListTile(
      leading: Icon(icon, color: isCurrent ? AppColors.accentPrimary : AppColors.textSecondary, size: 20),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          color: isCurrent ? AppColors.accentPrimary : AppColors.textPrimary,
          fontSize: 14.5,
          fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600,
        ),
      ),
      trailing: isCurrent ? const Icon(Icons.circle, color: AppColors.accentPrimary, size: 8) : null,
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
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = widget.isActive || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.accentPrimary.withValues(alpha: 0.14)
                : (_isHovered ? AppColors.accentPrimary.withValues(alpha: 0.08) : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            border: widget.isActive
                ? Border.all(color: AppColors.accentPrimary.withValues(alpha: 0.4), width: 1)
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.plusJakartaSans(
                  color: highlighted ? AppColors.accentPrimary : AppColors.textSecondary,
                  fontSize: 13.5,
                  fontWeight: widget.isActive ? FontWeight.w700 : (_isHovered ? FontWeight.w600 : FontWeight.w500),
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: highlighted ? (widget.isActive ? 20 : 14) : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.accentPrimary,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: highlighted
                      ? [
                          BoxShadow(
                            color: AppColors.accentPrimary.withValues(alpha: 0.8),
                            blurRadius: 5,
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
