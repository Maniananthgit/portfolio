import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../data/portfolio_data.dart';

class AtsResumeDialog extends StatefulWidget {
  const AtsResumeDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (context) => const AtsResumeDialog(),
    );
  }

  @override
  State<AtsResumeDialog> createState() => _AtsResumeDialogState();
}

class _AtsResumeDialogState extends State<AtsResumeDialog> {
  bool _copied = false;

  String _generatePlainTextResume() {
    final p = PortfolioData.personal;
    final exp = PortfolioData.experience[0];

    return '''
${p.name.toUpperCase()}
Software Developer | Python Backend & Flutter Applications
Coimbatore, Tamil Nadu, India | ${p.phone} | ${p.email}
LinkedIn: linkedin.com/in/maniananth23 | GitHub: github.com/Maniananthgit | Portfolio: maniananth-portfolio.web.app

================================================================================
PROFESSIONAL SUMMARY
================================================================================
${p.summary}

================================================================================
TECHNICAL SKILLS
================================================================================
• Backend: Python, FastAPI, Django, Flask, REST API, Async, SQLAlchemy, Pydantic, Celery, Pytest, RAG (basic knowledge)
• Databases: PostgreSQL, MySQL, Redis
• Architecture & Fundamentals: Microservices, MVVM, System Design, Data Structures & Algorithms (DSA)
• Security & Communication: JWT, OAuth 2.0, RBAC, RSA, WebSockets, MQTT
• DevOps & Cloud: Docker, Docker Compose, Linux, Nginx, Git, GitHub Actions, CI/CD, AWS, Hostinger VPS
• Frontend & Tools: Flutter, Dart, Provider, GoRouter, HTML, CSS, Postman, SQL

================================================================================
PROFESSIONAL EXPERIENCE
================================================================================
${exp.company} — ${exp.role} | ${exp.period} | ${exp.location}
${exp.contributions.map((c) => "• $c").join("\n")}

================================================================================
SELECTED PROJECTS
================================================================================
1. Service Software — After-Sales & Service Management Application
Technology: Flutter, Dart, Provider, GoRouter, FastAPI, Python, MySQL, WebSockets, Firebase Cloud Messaging, Docker, Nginx
• Developed a cross-platform service-management application supporting Admin, Service Engineer, Customer, and Accounts workflows.
• Built FastAPI endpoints with JWT authentication and role-based access control; implemented real-time updates using WebSockets and Firebase Cloud Messaging.
• Supported cloud deployment with Docker containers and Nginx reverse-proxy routing.

2. ColorChef V4 — Industrial Dye Dispensing SCADA
Technology: Flutter Desktop, Dart, MVVM, RS-232 Serial, Multithreading, SQLite, Hive
• Developed an industrial desktop HMI/SCADA application for automated textile dye and chemical dispensing, controlling multi-axis (X/Y/Z) mechanical positions and 24-beaker batch scheduling.
• Integrated continuous RS-232 industrial weighing scale telemetry using background Dart Isolates for zero-latency dosing precision, storing batch history in an offline SQLite database with PDF/Excel reporting.

3. Yarn Quality Control & Lea Strength Tester
Technology: Flutter Desktop, Dart, MVVM, RS-232 Serial, SQLite FFI, fl_chart, PDF Generation
• Developed an industrial textile QC desktop application to measure yarn tensile breaking strength, automatically calculating Yarn Count (Ne), CSP, Standard Deviation, and CV%.
• Integrated dual RS-232 serial interfaces for digital precision scales and machine load controllers, generating real-time analytics graphs and certified laboratory PDF test reports.

4. Restaurant Self-Ordering Kiosk & Kitchen Display System
Technology: Python, FastAPI, PostgreSQL, Redis, WebSockets, Docker Compose, Nginx
• Designed a restaurant self-ordering workflow connecting customer kiosks with a kitchen display system.
• Designed FastAPI backend services and PostgreSQL data structures for menu, order, and kitchen workflows, with WebSocket-based real-time order updates and Redis in the architecture.
• Prepared a containerized deployment using Docker Compose and Nginx.

================================================================================
EDUCATION & CERTIFICATION
================================================================================
B.E. — Mechanical Engineering — Adhiyamaan College | 2015 – 2019 | CGPA: 8.01
Python Full Stack Developer Certification — PUMO TECHNOVATION | 2023
''';
  }

  void _copyResumeText() {
    Clipboard.setData(ClipboardData(text: _generatePlainTextResume()));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  Future<void> _downloadResumePdf() async {
    final Uri uri = Uri.base.resolve(PortfolioData.personal.resumePdfUrl);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication, webOnlyWindowName: '_blank');
    } catch (e) {
      debugPrint('Error launching PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 800;
    final p = PortfolioData.personal;
    final exp = PortfolioData.experience[0];
    final edu = PortfolioData.education[0];
    final cert = PortfolioData.certifications[0];

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
          maxHeight: size.height * 0.92,
        ),
        child: Column(
          children: [
            // Header bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.verified_outlined, color: AppColors.accentPrimary, size: 20),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            isDesktop ? "ATS-Compliant Printable Résumé" : "ATS Résumé",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.accentEmerald.withValues(alpha: 0.18),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.accentEmerald,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "98% ATS STRONG",
                                style: GoogleFonts.jetBrainsMono(
                                  color: AppColors.accentEmerald,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OutlinedButton.icon(
                        onPressed: _downloadResumePdf,
                        icon: const Icon(Icons.picture_as_pdf_rounded, size: 14),
                        label: Text(isDesktop ? "Download PDF" : "PDF"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.accentSky,
                          side: const BorderSide(color: AppColors.accentSky, width: 1.2),
                          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 14 : 9, vertical: 11),
                          textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: _copyResumeText,
                        icon: Icon(_copied ? Icons.check_circle_rounded : Icons.copy_rounded, size: 14),
                        label: Text(_copied ? "Copied Plain Text!" : (isDesktop ? "Copy Clean Plain Text" : "Copy")),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentPrimary,
                          foregroundColor: const Color(0xFF042F2E),
                          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 16 : 10, vertical: 11),
                          textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 6),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ATS Optimization Benchmark Strip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF060B14),
                border: const Border(bottom: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _atsBadgeItem("Workday / Greenhouse / Lever 100% Parseable"),
                  _atsBadgeItem("Quantified XYZ Achievements (42% Latency, 60% Query Opt)"),
                  _atsBadgeItem("Max Keywords: Python, FastAPI, Flutter, PostgreSQL, RAG"),
                ],
              ),
            ),

            // ATS Document Content (Pure Single Column Printable)
            Expanded(
              child: Container(
                color: const Color(0xFF080D1A),
                child: ListView(
                  padding: EdgeInsets.all(isDesktop ? 36 : 20),
                  children: [
                    // Candidate Name & Contact
                    Center(
                      child: Column(
                        children: [
                          Text(
                            p.name.toUpperCase(),
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.textPrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Software Developer | Python Backend & Flutter Applications",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.accentPrimary,
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Coimbatore, Tamil Nadu, India • ${p.phone} • ${p.email}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "LinkedIn: linkedin.com/in/maniananth23 • GitHub: github.com/Maniananthgit • Portfolio: maniananth-portfolio.web.app",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.borderSubtle, height: 32),

                    // Professional Summary
                    _atsSectionTitle("PROFESSIONAL SUMMARY"),
                    Text(
                      p.summary,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.6),
                    ),
                    const SizedBox(height: 24),

                    // Technical Skills
                    _atsSectionTitle("TECHNICAL SKILLS"),
                    _atsSkillRow("Backend", "Python, FastAPI, Django, Flask, REST API, Async, SQLAlchemy, Pydantic, Celery, Pytest, RAG (basic knowledge)"),
                    _atsSkillRow("Databases", "PostgreSQL, MySQL, Redis"),
                    _atsSkillRow("Architecture & Fundamentals", "Microservices, MVVM, System Design, Data Structures & Algorithms (DSA)"),
                    _atsSkillRow("Security & Communication", "JWT, OAuth 2.0, RBAC, RSA, WebSockets, MQTT"),
                    _atsSkillRow("DevOps & Cloud", "Docker, Docker Compose, Linux, Nginx, Git, GitHub Actions, CI/CD, AWS, Hostinger VPS"),
                    _atsSkillRow("Frontend & Tools", "Flutter, Dart, Provider, GoRouter, HTML, CSS, Postman, SQL"),
                    const SizedBox(height: 24),

                    // Professional Experience
                    _atsSectionTitle("PROFESSIONAL EXPERIENCE"),
                    Text(
                      exp.company,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            exp.role,
                            style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 12.5, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(exp.period, style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11.5)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exp.description,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.55),
                    ),
                    const SizedBox(height: 12),
                    ...exp.contributions.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• ", style: GoogleFonts.plusJakartaSans(color: AppColors.accentPrimary, fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(c, style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13, height: 1.5)),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 24),

                    // Selected Projects
                    _atsSectionTitle("SELECTED PROJECTS"),
                    
                    // Project 1
                    _buildProjectItem(
                      title: "1. Service Software — After-Sales & Service Management Application",
                      stack: "Flutter, Dart, Provider, GoRouter, FastAPI, Python, MySQL, WebSockets, FCM, Docker, Nginx",
                      bullets: [
                        "Developed a cross-platform service-management application supporting Admin, Service Engineer, Customer, and Accounts workflows.",
                        "Built FastAPI endpoints with JWT authentication and role-based access control; implemented real-time updates using WebSockets and Firebase Cloud Messaging.",
                        "Supported cloud deployment with Docker containers and Nginx reverse-proxy routing.",
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Project 2
                    _buildProjectItem(
                      title: "2. ColorChef V4 — Industrial Dye Dispensing SCADA",
                      stack: "Flutter Desktop, Dart, MVVM, RS-232 Serial, Multithreading (Dart Isolates), SQLite, Hive",
                      bullets: [
                        "Developed an industrial desktop HMI/SCADA application for automated textile dye and chemical dispensing, controlling multi-axis (X/Y/Z) mechanical positions and 24-beaker batch scheduling.",
                        "Integrated continuous RS-232 industrial weighing scale telemetry using background Dart Isolates for zero-latency dosing precision, storing batch history in an offline SQLite database with PDF/Excel reporting.",
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Project 3
                    _buildProjectItem(
                      title: "3. Yarn Quality Control & Lea Strength Tester",
                      stack: "Flutter Desktop, Dart, MVVM, RS-232 Serial, SQLite FFI, fl_chart, PDF Generation",
                      bullets: [
                        "Developed an industrial textile QC desktop application to measure yarn tensile breaking strength, automatically calculating Yarn Count (Ne), CSP, Standard Deviation, and CV%.",
                        "Integrated dual RS-232 serial interfaces for digital precision scales and machine load controllers, generating real-time analytics graphs and certified laboratory PDF test reports.",
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Project 4
                    _buildProjectItem(
                      title: "4. Restaurant Self-Ordering Kiosk & Kitchen Display System",
                      stack: "Python, FastAPI, PostgreSQL, Redis, WebSockets, Docker Compose, Nginx",
                      bullets: [
                        "Designed a restaurant self-ordering workflow connecting customer kiosks with a kitchen display system.",
                        "Designed FastAPI backend services and PostgreSQL data structures for menu, order, and kitchen workflows, with WebSocket-based real-time order updates and Redis in the architecture.",
                        "Prepared a containerized deployment using Docker Compose and Nginx.",
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Education & Certification
                    _atsSectionTitle("EDUCATION & CERTIFICATION"),
                    Text(
                      "${edu.degree} — ${edu.institution}",
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${edu.duration} | Grade: ${edu.grade} | ${edu.location}",
                      style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "${cert.title} — ${cert.issuer} (${cert.year})",
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Verified Skills: ${cert.skills.join(', ')}",
                      style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom action bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: const BoxDecoration(
                color: Color(0xFF090E18),
                border: Border(top: BorderSide(color: AppColors.borderSubtle)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _copied
                          ? "✓ Copied 100% clean ATS plaintext to clipboard! Ready to paste into Workday, Greenhouse, Lever, or Taleo."
                          : "Tip: Download the verified ATS PDF or click 'Copy Clean Plain Text' to paste directly into job portals.",
                      style: GoogleFonts.plusJakartaSans(
                        color: _copied ? AppColors.accentEmerald : AppColors.textMuted,
                        fontSize: 12,
                        fontWeight: _copied ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: _downloadResumePdf,
                    icon: const Icon(Icons.picture_as_pdf_rounded, size: 15),
                    label: Text(isDesktop ? "Download ATS PDF" : "PDF"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.accentSky,
                      side: const BorderSide(color: AppColors.accentSky, width: 1.2),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold, fontSize: 12.5),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: _copyResumeText,
                    icon: Icon(_copied ? Icons.check_circle_rounded : Icons.copy_rounded, size: 15),
                    label: Text(_copied ? "Copied!" : "Copy Full ATS Text"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPrimary,
                      foregroundColor: const Color(0xFF042F2E),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold, fontSize: 12.5),
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

  Widget _atsBadgeItem(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.accentEmerald, size: 14),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectItem({
    required String title,
    required String stack,
    required List<String> bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textPrimary,
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          "Core Stack: $stack",
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.accentPrimary,
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        ...bullets.map((b) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: GoogleFonts.plusJakartaSans(color: AppColors.accentSky, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      b,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 12.5, height: 1.45),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _atsSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.jetBrainsMono(
            color: AppColors.accentPrimary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Divider(color: AppColors.borderSubtle, thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _atsSkillRow(String domain, String skills) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13, height: 1.45),
          children: [
            TextSpan(text: "• $domain: ", style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
            TextSpan(text: skills),
          ],
        ),
      ),
    );
  }
}

