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

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _capabilitiesKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _principlesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 400;
      if (shouldShow != _showBackToTop) {
        setState(() => _showBackToTop = shouldShow);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _navigateToSection(String sectionKey) {
    switch (sectionKey) {
      case 'hero':
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 650), curve: Curves.easeInOutCubic);
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
          // Ambient Background Glow Circles
          Positioned(
            top: 60,
            left: 80,
            child: IgnorePointer(
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accentPrimary.withValues(alpha: 0.06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 900,
            right: 40,
            child: IgnorePointer(
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accentSky.withValues(alpha: 0.04),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Main Scrollable Page
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top Offset for fixed/sticky navbar
                const SizedBox(height: 70),

                // Hero Section
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onOpenResume: _openResume,
                    onExploreProjects: () => _scrollToKey(_projectsKey),
                  ),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Projects Section
                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Bento Capabilities Section
                Container(
                  key: _capabilitiesKey,
                  child: const BentoCapabilitiesSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Commercial Experience Section
                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Competency Matrix Section
                Container(
                  key: _skillsKey,
                  child: const CompetenciesSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Engineering Principles Section
                Container(
                  key: _principlesKey,
                  child: const PrinciplesSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // About & Education Section
                Container(
                  key: _aboutKey,
                  child: const AboutEducationSection(),
                ),

                const Divider(color: AppColors.borderSubtle, height: 1),

                // Direct Contact Section
                Container(
                  key: _contactKey,
                  child: ContactSection(
                    onOpenResume: _openResume,
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

          // Sticky Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
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
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 650),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: const Icon(Icons.arrow_upward_rounded, size: 18),
            )
          : null,
    );
  }
}
