import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/bento_capabilities_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/competencies_section.dart';
import 'widgets/principles_section.dart';
import 'widgets/about_education_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/ats_resume_dialog.dart';
import 'widgets/interactive_animations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maniananth M — Python Backend Engineer & Full-Stack Architect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgPrimary,
        primaryColor: AppColors.accentPrimary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accentPrimary,
          surface: AppColors.bgCard,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _ambientController;

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _capabilitiesKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _principlesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;
  String _activeSectionKey = 'hero';
  String? _targetedSectionKey;
  Timer? _targetResetTimer;

  @override
  void initState() {
    super.initState();
    _ambientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 400;
      if (shouldShow != _showBackToTop) {
        setState(() => _showBackToTop = shouldShow);
      }
    });
  }

  @override
  void dispose() {
    _targetResetTimer?.cancel();
    _ambientController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _navigateToSection(String sectionKey) {
    setState(() {
      _activeSectionKey = sectionKey;
      _targetedSectionKey = sectionKey;
    });

    _targetResetTimer?.cancel();
    _targetResetTimer = Timer(const Duration(milliseconds: 1400), () {
      if (mounted) setState(() => _targetedSectionKey = null);
    });

    switch (sectionKey) {
      case 'hero':
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutCubic);
        break;
      case 'projects':
        _scrollToKey(_projectsKey);
        break;
      case 'capabilities':
        _scrollToKey(_capabilitiesKey);
        break;
      case 'experience':
        _scrollToKey(_experienceKey);
        break;
      case 'skills':
        _scrollToKey(_skillsKey);
        break;
      case 'principles':
        _scrollToKey(_principlesKey);
        break;
      case 'about':
        _scrollToKey(_aboutKey);
        break;
      case 'contact':
        _scrollToKey(_contactKey);
        break;
    }
  }

  void _openResume() {
    AtsResumeDialog.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Stack(
        children: [
          // 1. Constellation Particle Animation (60fps Canvas)
          const Positioned.fill(
            child: IgnorePointer(
              child: ParticleBackground(particleCount: 52),
            ),
          ),

          // 2. Animated Ambient Background Glow Orbs
          AnimatedBuilder(
            animation: _ambientController,
            builder: (context, child) {
              final t = _ambientController.value;
              return Stack(
                children: [
                  Positioned(
                    top: 30 + (t * 50),
                    left: 40 + (t * 60),
                    child: IgnorePointer(
                      child: Container(
                        width: 550 + (t * 80),
                        height: 550 + (t * 80),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.accentPrimary.withValues(alpha: 0.08 + (t * 0.04)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 800 - (t * 60),
                    right: 20 + (t * 50),
                    child: IgnorePointer(
                      child: Container(
                        width: 600 + (t * 60),
                        height: 600 + (t * 60),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.accentSky.withValues(alpha: 0.06 + (t * 0.03)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1700 + (t * 40),
                    left: 60 - (t * 30),
                    child: IgnorePointer(
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFFC084FC).withValues(alpha: 0.05 + (t * 0.03)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 3. Main Scrollable Page
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top Offset for fixed/sticky navbar
                const SizedBox(height: 70),

                // Hero Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'hero',
                  child: Container(
                    key: _heroKey,
                    child: HeroSection(
                      onOpenResume: _openResume,
                      onExploreProjects: () => _navigateToSection('projects'),
                    ),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Projects Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'projects',
                  child: Container(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Bento Capabilities Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'capabilities',
                  child: Container(
                    key: _capabilitiesKey,
                    child: const BentoCapabilitiesSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Commercial Experience Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'experience',
                  child: Container(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Competency Matrix Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'skills',
                  child: Container(
                    key: _skillsKey,
                    child: const CompetenciesSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Engineering Principles Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'principles',
                  child: Container(
                    key: _principlesKey,
                    child: const PrinciplesSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // About & Education Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'about',
                  child: Container(
                    key: _aboutKey,
                    child: const AboutEducationSection(),
                  ),
                ),

                const AnimatedBeamDivider(),

                // Direct Contact Section
                AnimatedSectionWrapper(
                  isTargeted: _targetedSectionKey == 'contact',
                  child: Container(
                    key: _contactKey,
                    child: ContactSection(
                      onOpenResume: _openResume,
                    ),
                  ),
                ),

                // Footer Section
                FooterSection(
                  onOpenResume: _openResume,
                  onNavigate: _navigateToSection,
                ),
              ],
            ),
          ),

          // 4. Sticky Top Navbar with Active Topic Indicators
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              activeSectionKey: _activeSectionKey,
              onOpenResume: _openResume,
              onNavigate: _navigateToSection,
            ),
          ),
        ],
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              backgroundColor: AppColors.bgCard,
              foregroundColor: AppColors.accentPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: AppColors.borderAccent),
              ),
              onPressed: () {
                _navigateToSection('hero');
              },
              child: const Icon(Icons.arrow_upward_rounded, size: 18),
            )
          : null,
    );
  }
}
