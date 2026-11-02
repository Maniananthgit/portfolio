import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';
import 'interactive_animations.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onOpenResume;
  final VoidCallback onExploreProjects;

  const HeroSection({
    super.key,
    required this.onOpenResume,
    required this.onExploreProjects,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  bool _copied = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _copyEmail() {
    Clipboard.setData(ClipboardData(text: PortfolioData.personal.email));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 32 : 16,
            vertical: isDesktop ? 56 : 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _buildExecutiveSummary(isDesktop),
                    ),
                    const SizedBox(width: 36),
                    Expanded(
                      flex: 5,
                      child: StaggeredEntrance(
                        delay: const Duration(milliseconds: 250),
                        child: const ProfileHighlightCard(),
                      ),
                    ),
                  ],
                )
              else ...[
                _buildExecutiveSummary(isDesktop),
                const SizedBox(height: 32),
                const ProfileHighlightCard(),
              ],
              const SizedBox(height: 48),
              StaggeredEntrance(
                delay: const Duration(milliseconds: 450),
                child: _buildMetricsGrid(width),
              ),
              const SizedBox(height: 40),
              StaggeredEntrance(
                delay: const Duration(milliseconds: 550),
                child: NextStepTransitionPrompt(
                  currentStep: "STEP 01",
                  currentTitle: "System Overview & Core Stack",
                  nextStep: "STEP 02",
                  nextTitle: "FEATURED CASE STUDIES",
                  onProceed: widget.onExploreProjects,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExecutiveSummary(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step 01 Section Badge
        StaggeredEntrance(
          delay: const Duration(milliseconds: 40),
          child: const StepSectionBadge(
            stepNumber: "01",
            label: "EXECUTIVE OVERVIEW",
            icon: Icons.terminal_rounded,
          ),
        ),
        const SizedBox(height: 16),

        // Availability & Verification Pill with Pulsing Glow Dot
        StaggeredEntrance(
          delay: const Duration(milliseconds: 90),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.accentMuted,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.borderAccent),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PulsingGlowDot(color: AppColors.accentPrimary, size: 9),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "AVAILABLE FOR SENIOR BACKEND & FULL-STACK ROLES",
                    style: GoogleFonts.jetBrainsMono(
                      color: AppColors.accentPrimary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Role Designation
        StaggeredEntrance(
          delay: const Duration(milliseconds: 120),
          child: Text(
            "Python Backend Engineer • FastAPI Specialist • Full-Stack Architect",
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.accentPrimary,
              fontSize: isDesktop ? 14 : 12.5,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Main Headline
        StaggeredEntrance(
          delay: const Duration(milliseconds: 200),
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.plusJakartaSans(
                fontSize: isDesktop ? 44 : 30,
                fontWeight: FontWeight.w800,
                height: 1.16,
                letterSpacing: -1.0,
                color: AppColors.textPrimary,
              ),
              children: const [
                TextSpan(text: "Engineering high-concurrency "),
                TextSpan(
                  text: "FastAPI microservices",
                  style: TextStyle(
                    color: AppColors.accentPrimary,
                  ),
                ),
                TextSpan(text: " & real-time operational systems."),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Executive Bio
        StaggeredEntrance(
          delay: const Duration(milliseconds: 280),
          child: Text(
            "Software Engineer with ~3 years of verified production experience at SPI Equipments India. Specialized in asynchronous Python backends, real-time WebSocket pipelines, PostgreSQL query optimization, and production Flutter client applications.",
            style: GoogleFonts.plusJakartaSans(
              fontSize: isDesktop ? 17 : 15,
              height: 1.65,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Skills Pill Strip
        StaggeredEntrance(
          delay: const Duration(milliseconds: 360),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _skillBadge("SPI Equipments (~3 Yrs)", isAccent: true),
              _skillBadge("FastAPI & Python 3.11+"),
              _skillBadge("WebSockets & AsyncIO"),
              _skillBadge("PostgreSQL & MySQL"),
              _skillBadge("Flutter & Dart Clients"),
              _skillBadge("GenAI & RAG (pgvector)"),
              _skillBadge("Docker & Pytest"),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons with Interactive Hover
        StaggeredEntrance(
          delay: const Duration(milliseconds: 440),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _AnimatedActionButton(
                onPressed: widget.onExploreProjects,
                icon: Icons.arrow_forward_rounded,
                label: "Explore Featured Projects",
                isPrimary: true,
              ),
              _AnimatedActionButton(
                onPressed: widget.onOpenResume,
                icon: Icons.file_copy_outlined,
                label: "ATS-Friendly Résumé",
                isPrimary: false,
              ),
              _AnimatedActionButton(
                onPressed: _copyEmail,
                icon: _copied ? Icons.check_circle_rounded : Icons.copy_rounded,
                label: _copied ? "Email Copied!" : "Copy Email",
                isPrimary: false,
                isMonospace: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Meta Strip (Wrap prevents mobile overflow)
        StaggeredEntrance(
          delay: const Duration(milliseconds: 520),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_outlined, color: AppColors.textMuted, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "Coimbatore, Tamil Nadu, India",
                    style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5),
                  ),
                ],
              ),
              Text("•", style: GoogleFonts.plusJakartaSans(color: AppColors.textMuted)),
              InkWell(
                onTap: () => launchUrl(Uri.parse(PortfolioData.personal.linkedin)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LinkedIn Verified Profile",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.accentPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.open_in_new_rounded, size: 13, color: AppColors.accentPrimary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricsGrid(double screenWidth) {
    final metrics = PortfolioData.metrics;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 540
                ? 2
                : 1;

        final itemWidth = (constraints.maxWidth - ((crossAxisCount - 1) * 16)) / crossAxisCount;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: metrics.asMap().entries.map((entry) {
            final idx = entry.key;
            final m = entry.value;

            // Varied accent glows across metric cards
            Color cardGlow;
            switch (idx) {
              case 0:
                cardGlow = AppColors.accentPrimary; // Teal
                break;
              case 1:
                cardGlow = AppColors.accentSky; // Sky blue
                break;
              case 2:
                cardGlow = AppColors.accentEmerald; // Emerald
                break;
              case 3:
                cardGlow = const Color(0xFFC084FC); // Purple
                break;
              default:
                cardGlow = AppColors.accentPrimary;
            }

            return SizedBox(
              width: itemWidth,
              child: HoverLiftCard(
                liftOffset: -8.0,
                glowColor: cardGlow,
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          m.value,
                          style: GoogleFonts.plusJakartaSans(
                            color: cardGlow,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: cardGlow.withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      m.label,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      m.detail,
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.textMuted,
                        fontSize: 11,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _skillBadge(String label, {bool isAccent = false}) {
    return _InteractiveSkillBadge(label: label, isAccent: isAccent);
  }
}

class _InteractiveSkillBadge extends StatefulWidget {
  final String label;
  final bool isAccent;

  const _InteractiveSkillBadge({required this.label, this.isAccent = false});

  @override
  State<_InteractiveSkillBadge> createState() => _InteractiveSkillBadgeState();
}

class _InteractiveSkillBadgeState extends State<_InteractiveSkillBadge> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.accentPrimary.withValues(alpha: 0.18)
              : (widget.isAccent ? AppColors.accentMuted : const Color(0x0AFFFFFF)),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: _isHovered
                ? AppColors.accentPrimary
                : (widget.isAccent ? AppColors.borderAccent : AppColors.borderSubtle),
            width: _isHovered ? 1.2 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.25),
                    blurRadius: 8,
                  ),
                ]
              : null,
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.jetBrainsMono(
            color: _isHovered
                ? AppColors.accentPrimary
                : (widget.isAccent ? AppColors.accentPrimary : AppColors.textSecondary),
            fontSize: 12,
            fontWeight: widget.isAccent || _isHovered ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _AnimatedActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isPrimary;
  final bool isMonospace;

  const _AnimatedActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.isPrimary,
    this.isMonospace = false,
  });

  @override
  State<_AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<_AnimatedActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -3.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: (widget.isPrimary ? AppColors.accentPrimary : Colors.white).withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: widget.isPrimary
            ? ElevatedButton.icon(
                onPressed: widget.onPressed,
                icon: Icon(widget.icon, size: 16),
                label: Text(widget.label),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentPrimary,
                  foregroundColor: const Color(0xFF042F2E),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              )
            : OutlinedButton.icon(
                onPressed: widget.onPressed,
                icon: Icon(widget.icon, size: 16),
                label: Text(widget.label),
                style: OutlinedButton.styleFrom(
                  backgroundColor: _isHovered ? Colors.white.withValues(alpha: 0.05) : AppColors.bgCard,
                  foregroundColor: _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
                  side: BorderSide(
                    color: _isHovered ? AppColors.accentPrimary : AppColors.borderMedium,
                    width: _isHovered ? 1.4 : 1.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: widget.isMonospace
                      ? GoogleFonts.jetBrainsMono(fontSize: 13, fontWeight: FontWeight.w500)
                      : GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
      ),
    );
  }
}

/// Simple, elegant profile & core tech highlights card.
class ProfileHighlightCard extends StatefulWidget {
  const ProfileHighlightCard({super.key});

  @override
  State<ProfileHighlightCard> createState() => _ProfileHighlightCardState();
}

class _ProfileHighlightCardState extends State<ProfileHighlightCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final p = PortfolioData.personal;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -5.0 : 0.0, 0.0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1527).withValues(alpha: 0.92),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _isHovered ? AppColors.accentPrimary : AppColors.borderAccent,
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
            if (_isHovered)
              BoxShadow(
                color: AppColors.accentPrimary.withValues(alpha: 0.20),
                blurRadius: 36,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Status bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accentEmerald.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const PulsingGlowDot(size: 7, color: AppColors.accentEmerald),
                      const SizedBox(width: 7),
                      Text(
                        "OPEN FOR ROLES",
                        style: GoogleFonts.jetBrainsMono(
                          color: AppColors.accentEmerald,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on_outlined, color: AppColors.textMuted, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      "Coimbatore, India",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textMuted,
                        fontSize: 11.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Profile info row
            Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.accentPrimary, AppColors.accentSky],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentPrimary.withValues(alpha: 0.35),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      p.initials,
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color(0xFF021B1A),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Python Backend & Full-Stack Architect",
                        style: GoogleFonts.jetBrainsMono(
                          color: AppColors.accentPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "SPI Equipments India (~3 Years)",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),

            // 4 Core Competency Highlights Grid
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildMiniPill("FastAPI & Python", "Async REST APIs", Icons.bolt_rounded, AppColors.accentPrimary),
                _buildMiniPill("Flutter & Dart", "Mobile & Web Apps", Icons.devices_rounded, AppColors.accentSky),
                _buildMiniPill("PostgreSQL & MySQL", "ACID & Query Opt", Icons.dns_rounded, AppColors.accentEmerald),
                _buildMiniPill("Docker & GenAI", "pgvector RAG & CI", Icons.auto_awesome_rounded, const Color(0xFFC084FC)),
              ],
            ),
            const SizedBox(height: 20),

            // Quick Social Links
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF080D1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(p.github)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.code_rounded, color: AppColors.accentPrimary, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          "GitHub Profile",
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.accentPrimary,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("•", style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted)),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(p.linkedin)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.open_in_new_rounded, color: AppColors.accentSky, size: 14),
                        const SizedBox(width: 6),
                        Text(
                          "LinkedIn Profile",
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.accentSky,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniPill(String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 195,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF090E1B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textPrimary,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

