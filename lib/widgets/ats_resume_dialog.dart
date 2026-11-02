import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final edu = PortfolioData.education[0];
    final cert = PortfolioData.certifications[0];

    return '''
${p.name.toUpperCase()}
${p.role}
Email: ${p.email} | Phone: ${p.phone} | Location: ${p.location}
LinkedIn: ${p.linkedin} | GitHub: ${p.github}

PROFESSIONAL SUMMARY
${p.summary}

COMMERCIAL EXPERIENCE
${exp.company}
${exp.role} | ${exp.period} | ${exp.location}
${exp.description}
Key Contributions:
${exp.contributions.map((c) => "• $c").join("\n")}

TECHNICAL SKILLS TAXONOMY
• Backend Development: Python, FastAPI, Django, REST API Development, Async/Await, WebSockets, JWT, OAuth 2.0, API Integration
• Databases & Data Management: PostgreSQL, MySQL, SQLite, SQLAlchemy, Database Optimization, Redis, Database Migrations
• AI & Generative AI: LLM Integration, Generative AI Application Development, Prompt Engineering, Embeddings, RAG, pgvector, AI Tool Calling
• Cloud & DevOps: Docker, Docker Compose, Linux, AWS, Git, GitHub Actions, Nginx Reverse Proxy
• Testing & Quality: Pytest, Unit & Integration Testing, API Testing, Debugging, Error Handling Envelopes
• Frontend & Mobile: Flutter, Dart, Provider State Management, Responsive UI, REST & WebSocket Clients
• Software Engineering: OOP, Data Structures & Algorithms, Clean Architecture, System Design, Agile

EDUCATION
${edu.degree}
${edu.institution} (${edu.duration}) | Grade: ${edu.grade}

CERTIFICATIONS
${cert.title} — ${cert.issuer} (${cert.year})
Skills: ${cert.skills.join(", ")}
''';
  }

  void _copyResumeText() {
    Clipboard.setData(ClipboardData(text: _generatePlainTextResume()));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copied = false);
    });
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
          maxWidth: 900,
          maxHeight: size.height * 0.9,
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
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _copyResumeText,
                        icon: Icon(_copied ? Icons.check_circle_rounded : Icons.copy_rounded, size: 14),
                        label: Text(_copied ? "Copied!" : (isDesktop ? "Copy Clean Text" : "Copy")),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentPrimary,
                          foregroundColor: const Color(0xFF042F2E),
                          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 14 : 10, vertical: 10),
                          textStyle: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold, fontSize: 11.5),
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

            // ATS Document Content (Pure Single Column Printable)
            Expanded(
              child: Container(
                color: const Color(0xFF0B0E14),
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
                            p.role,
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.accentPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${p.email} • ${p.phone} • ${p.location}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13),
                          ),
                          Text(
                            "LinkedIn: linkedin.com/in/maniananth23 • GitHub: github.com/Maniananthgit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11.5),
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

                    // Commercial Experience
                    _atsSectionTitle("COMMERCIAL WORK EXPERIENCE"),
                    Text(
                      exp.company,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(exp.role, style: GoogleFonts.jetBrainsMono(color: AppColors.accentPrimary, fontSize: 12.5, fontWeight: FontWeight.w600)),
                        Text(exp.period, style: GoogleFonts.jetBrainsMono(color: AppColors.textMuted, fontSize: 11.5)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exp.description,
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13.5, height: 1.55),
                    ),
                    const SizedBox(height: 10),
                    ...exp.contributions.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• ", style: GoogleFonts.plusJakartaSans(color: AppColors.accentPrimary, fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(c, style: GoogleFonts.plusJakartaSans(color: AppColors.textSecondary, fontSize: 13, height: 1.45)),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 24),

                    // Skills Taxonomy
                    _atsSectionTitle("TECHNICAL SKILLS TAXONOMY"),
                    _atsSkillRow("Backend Development", "Python, FastAPI, Django, REST API Development, Async/Await, WebSockets, JWT, OAuth 2.0"),
                    _atsSkillRow("Databases & Data", "PostgreSQL, MySQL, SQLite, SQLAlchemy, Redis, Relational Indexing, Database Migrations"),
                    _atsSkillRow("AI & Generative AI", "LLM Integration, Prompt Engineering, Embeddings, RAG, pgvector, AI Tool Calling & Evaluation"),
                    _atsSkillRow("Cloud & DevOps", "Docker, Docker Compose, Linux, AWS, Git, GitHub Actions, Nginx Reverse Proxy"),
                    _atsSkillRow("Testing & Quality", "Pytest, Unit & Integration Testing, API Contract Testing, Debugging & Structured Logging"),
                    _atsSkillRow("Frontend & Mobile", "Flutter, Dart, Provider State Management, Responsive UI, REST & WebSocket Clients"),
                    _atsSkillRow("Software Engineering", "OOP, Data Structures & Algorithms, Clean Architecture, System Design, Agile"),
                    const SizedBox(height: 24),

                    // Education & Certification
                    _atsSectionTitle("EDUCATION & CERTIFICATION"),
                    Text(
                      "${edu.degree} — ${edu.institution}",
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${edu.duration} | Grade: ${edu.grade}",
                      style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 12),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "${cert.title} — ${cert.issuer} (${cert.year})",
                      style: GoogleFonts.plusJakartaSans(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Skills: ${cert.skills.join(', ')}",
                      style: GoogleFonts.jetBrainsMono(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
