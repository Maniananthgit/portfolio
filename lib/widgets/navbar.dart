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

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgPrimary.withValues(alpha: 0.92),
        border: const Border(
          bottom: BorderSide(color: AppColors.borderSubtle, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 16,
        vertical: 14,
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
                            color: AppColors.accentPrimary.withValues(alpha: 0.2),
                            blurRadius: 10,
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
                    _navItem("Projects", 'projects'),
                    _navItem("Capabilities", 'capabilities'),
                    _navItem("Experience", 'experience'),
                    _navItem("Competencies", 'skills'),
                    _navItem("Principles", 'principles'),
                    _navItem("About", 'about'),
                    _navItem("Contact", 'contact'),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: onOpenResume,
                      icon: const Icon(Icons.description_outlined, size: 16),
                      label: Text(
                        "ATS Résumé",
                        style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bgCard,
                        foregroundColor: AppColors.accentPrimary,
                        side: const BorderSide(color: AppColors.borderAccent),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ],
                )
              else
                // Mobile Menu Button
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.accentPrimary),
                  onPressed: () => _openMobileMenu(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String label, String key) {
    return TextButton(
      onPressed: () => onNavigate(key),
      child: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.textSecondary,
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
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
