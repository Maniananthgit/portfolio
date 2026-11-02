import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class CaseStudyModal extends StatefulWidget {
  final ProjectItem project;

  const CaseStudyModal({super.key, required this.project});

  static void show(BuildContext context, ProjectItem project) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (context) => CaseStudyModal(project: project),
    );
  }

  @override
  State<CaseStudyModal> createState() => _CaseStudyModalState();
}

class _CaseStudyModalState extends State<CaseStudyModal> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;

    return Dialog(
      backgroundColor: AppColors.bgCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.borderMedium),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 16,
        vertical: isDesktop ? 40 : 20,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 960,
          maxHeight: size.height * 0.88,
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          runSpacing: 6,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppColors.accentMuted,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColors.borderAccent),
                              ),
                              child: Text(
                                "ARCHITECTURAL CASE STUDY",
                                style: GoogleFonts.jetBrainsMono(
                                  color: AppColors.accentPrimary,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "SPI Equipments India",
                              style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.project.title,
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textPrimary,
                            fontSize: isDesktop ? 22 : 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),

            // Tab Navigation
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0F1218),
                border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: !isDesktop,
                labelColor: AppColors.accentPrimary,
                unselectedLabelColor: AppColors.textMuted,
                indicatorColor: AppColors.accentPrimary,
                indicatorWeight: 3,
                labelStyle: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13),
                tabs: const [
                  Tab(text: "Problem & Solution"),
                  Tab(text: "System Topology"),
                  Tab(text: "Engineering Decisions"),
                  Tab(text: "Testing & Concurrency"),
                ],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildProblemSolutionTab(),
                  _buildTopologyTab(),
                  _buildDecisionsTab(),
                  _buildTestingTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProblemSolutionTab() {
    final p = widget.project;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _sectionBlock("Core Architectural Objective", p.summary, Icons.flag_outlined, AppColors.accentSky),
        const SizedBox(height: 20),
        _sectionBlock("The Commercial & Technical Challenge", p.challenge, Icons.warning_amber_rounded, AppColors.accentAmber),
        const SizedBox(height: 20),
        _sectionBlock("Engineered Solution & Architecture", p.solution, Icons.check_circle_outline, AppColors.accentEmerald),
        const SizedBox(height: 24),
        Text(
          "Key Production Capabilities:",
          style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...p.keyFeatures.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_right_rounded, color: AppColors.accentPrimary, size: 22),
                  const SizedBox(width: 6),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.5),
                        children: [
                          TextSpan(text: "${f.name}: ", style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                          TextSpan(text: f.desc),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildTopologyTab() {
    final p = widget.project;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.accentMuted,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderAccent),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ARCHITECTURAL PATTERN",
                style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 11, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                p.architecturePattern,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14.5, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Component Hierarchy & Responsibilities:",
          style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        ...p.architectureComponents.map((c) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF10131B),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.accentPrimary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.layers_rounded, color: AppColors.accentPrimary, size: 18),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              c.name,
                              style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                c.tech,
                                style: GoogleFonts.jetBrainsMono(color: AppColors.accentSky, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          c.role,
                          style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildDecisionsTab() {
    final p = widget.project;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          "Technical Trade-offs & Engineering Decisions:",
          style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...p.engineeringDecisions.map((d) => Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF12151E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.alt_route_rounded, color: AppColors.accentAmber, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        d.decision,
                        style: GoogleFonts.plusJakartaSans(color: AppColors.accentPrimary, fontWeight: FontWeight.bold, fontSize: 14.5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    d.rationale,
                    style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.55),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildTestingTab() {
    final p = widget.project;
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          "Automated Testing & Security Gates:",
          style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        ...p.securityAndTesting.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.verified_user_outlined, color: AppColors.accentEmerald, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.5),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 24),
        Text(
          "Commercial & Operational Impact:",
          style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        ...p.verifiedImpact.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.trending_up_rounded, color: AppColors.accentPrimary, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 13.5, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _sectionBlock(String title, String content, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF10131B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 14.5),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.55),
          ),
        ],
      ),
    );
  }
}
