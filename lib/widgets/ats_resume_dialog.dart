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
    final edu = PortfolioData.education[0];
    final cert = PortfolioData.certifications[0];
    final projects = PortfolioData.projects;

    return '''
${p.name.toUpperCase()}
Software Engineer — Python Backend & Full-Stack Architect
Email: ${p.email} | Phone: ${p.phone} | Location: ${p.location}
LinkedIn: ${p.linkedin} | GitHub: ${p.github} | Portfolio: https://maniananth-portfolio.web.app

================================================================================
PROFESSIONAL SUMMARY
================================================================================
${p.summary}

================================================================================
CORE TECHNICAL SKILLS TAXONOMY
================================================================================
• Programming Languages: Python 3.11+, Dart, SQL, Bash / Shell Scripting
• Backend Frameworks & APIs: FastAPI, Python AsyncIO, Uvicorn, Django, Flask, RESTful API Design, WebSockets, ASGI Channels, Pydantic v2, Swagger / OpenAPI
• Databases & Data Storage: PostgreSQL, MySQL, SQLite, Redis Caching, SQLAlchemy ORM, Alembic Migrations, Database Indexing, Query Optimization, ACID Compliance
• AI & Machine Learning: Generative AI, Large Language Models (LLMs), Retrieval-Augmented Generation (RAG), pgvector, LangChain, OpenAI API, Vector Embeddings, Semantic Search
• Cloud, DevOps & Tools: Docker, Docker Compose, Linux / Ubuntu, AWS (EC2, S3), Nginx Reverse Proxy, Git, GitHub Actions (CI/CD), Postman
• Architecture & Security: Microservices, Clean Architecture, Event-Driven Architecture, High Concurrency, Non-blocking I/O, Role-Based Access Control (RBAC), JWT, OAuth 2.0
• Testing & Software Quality: Pytest, Unit Testing, Integration Testing, API Contract Testing, Test-Driven Development (TDD), Structured Error Envelopes, Structured Logging
• Frontend & Client Engineering: Flutter, Dart, Cross-Platform Web & Mobile, Provider State Management, Offline Data Caching, WebSocket Client Sync

================================================================================
COMMERCIAL WORK EXPERIENCE
================================================================================
${exp.company} — ${exp.location}
${exp.role} | ${exp.period} | ${exp.employmentType}
Core Stack: Python, FastAPI, WebSockets, PostgreSQL, SQLAlchemy, Docker, Flutter, Linux, Pytest

Scope & Overview:
${exp.description}

Key Quantified Contributions & Achievements:
${exp.contributions.map((c) => "• $c").join("\n")}

================================================================================
KEY ENGINEERING PROJECTS
================================================================================
1. ${projects[0].title.toUpperCase()}
Tech Stack: ${projects[0].backend}, ${projects[0].database}, ${projects[0].client}, ${projects[0].deployment}
Role: Architect & Lead Developer | Subtitle: ${projects[0].subtitle}
• Overview: ${projects[0].summary}
• Engineered an asynchronous FastAPI backend paired with a responsive Flutter mobile/tablet interface.
• Built ASGI WebSocket channels broadcasting live job updates, eliminating polling overhead and reducing field technician dispatch response times by 45%.
• Structured complex relational audit trails with foreign keys and composite indexes in PostgreSQL, tracking 10,000+ servicing logs, replacement components, and digital sign-offs.
• Enforced Role-Based Access Control (RBAC) with JWT tokens separating Admin, Service Manager, and Field Technician capabilities.

2. ${projects[1].title.toUpperCase()}
Tech Stack: ${projects[1].backend}, ${projects[1].database}, ${projects[1].client}
Role: Architect & Lead Developer | Subtitle: ${projects[1].subtitle}
• Overview: ${projects[1].summary}
• Developed an integrated high-concurrency hospitality ordering platform synchronizing self-ordering kiosk terminals with real-time Kitchen Display System (KDS) screens.
• Implemented client-generated idempotency tokens and transactional database isolation, successfully preventing duplicate orders during network dropouts and rapid tap retries.
• Segmented WebSocket order broadcasting channels by kitchen preparation station (grill, fryer, assembly), reducing kitchen ticket routing confusion by 40%.
• Achieved sub-second KOT propagation from customer tap to kitchen display with optimistic UI updates and auto-revert fallback.

3. GENERATIVE AI & RAG KNOWLEDGE SEARCH ENGINE
Tech Stack: Python 3.11+, FastAPI, LangChain, OpenAI / LLMs, pgvector, PostgreSQL, Docker
Role: Backend & AI Engineer
• Architected a Retrieval-Augmented Generation (RAG) platform performing contextual semantic search and automated Q&A across 10,000+ pages of equipment manuals and engineering documentation.
• Generated high-dimensional vector embeddings stored and indexed in PostgreSQL via pgvector, achieving <200ms semantic similarity retrieval latency with zero hallucination via strict prompt bounding.
• Built automated tool-calling workflows and RESTful query endpoints with structured JSON responses.

================================================================================
EDUCATION
================================================================================
${edu.degree}
${edu.institution} — ${edu.location} | ${edu.duration} | Grade: ${edu.grade}
• Strong analytical, mathematical, and algorithmic problem-solving foundation facilitating high-concurrency systems architecture and backend engineering.

================================================================================
CERTIFICATIONS & CREDENTIALS
================================================================================
• ${cert.title} — ${cert.issuer} (${cert.year})
  Verified Skills: ${cert.skills.join(", ")}
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
                            "Software Engineer — Python Backend & Full-Stack Architect",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jetBrainsMono(
                              color: AppColors.accentPrimary,
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${p.email} • ${p.phone} • ${p.location}",
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

                    // Core Technical Skills Taxonomy
                    _atsSectionTitle("CORE TECHNICAL SKILLS TAXONOMY"),
                    _atsSkillRow("Programming Languages", "Python 3.11+, Dart, SQL, Bash / Shell Scripting"),
                    _atsSkillRow("Backend Frameworks & APIs", "FastAPI, Python AsyncIO, Uvicorn, Django, Flask, RESTful APIs, WebSockets, ASGI Channels, Pydantic v2, Swagger / OpenAPI"),
                    _atsSkillRow("Databases & Data Storage", "PostgreSQL, MySQL, SQLite, Redis Caching, SQLAlchemy ORM, Alembic Migrations, Indexing, Query Optimization, ACID"),
                    _atsSkillRow("AI & Machine Learning", "Generative AI, Large Language Models (LLMs), Retrieval-Augmented Generation (RAG), pgvector, LangChain, Vector Embeddings, Semantic Search"),
                    _atsSkillRow("Cloud, DevOps & Tools", "Docker, Docker Compose, Linux / Ubuntu, AWS (EC2, S3), Nginx Reverse Proxy, Git, GitHub Actions (CI/CD), Postman"),
                    _atsSkillRow("Architecture & Security", "Microservices, Clean Architecture, Event-Driven Architecture, High Concurrency, Non-blocking I/O, RBAC, JWT, OAuth 2.0"),
                    _atsSkillRow("Testing & Quality", "Pytest, Unit Testing, Integration Testing, API Contract Testing, Test-Driven Development (TDD), Structured Error Envelopes"),
                    _atsSkillRow("Frontend & Mobile", "Flutter, Dart, Cross-Platform Web & Mobile, Provider State Management, Offline Data Caching, WebSocket Client Sync"),
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

                    // Key Engineering Projects
                    _atsSectionTitle("KEY ENGINEERING PROJECTS"),
                    
                    // Project 1
                    _buildProjectItem(
                      title: "1. Service Management Application (Enterprise Field Dispatch)",
                      stack: "FastAPI, Python 3.11+, WebSockets, PostgreSQL, SQLAlchemy, Flutter, Docker",
                      bullets: [
                        "Engineered full-lifecycle field maintenance automation system connecting Admin, Service Managers, and Field Engineers.",
                        "Bypassed polling latency with bidirectional WebSockets, delivering real-time ticket dispatch alerts and reducing technician response times by 45%.",
                        "Structured normalized PostgreSQL relational schema with composite B-tree indexing to process 10,000+ servicing history and part replacement logs.",
                        "Implemented multi-tier Role-Based Access Control (RBAC) with JWT auth separating field, management, and administrative privileges.",
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Project 2
                    _buildProjectItem(
                      title: "2. Restaurant Self-Ordering & Kitchen Display System (KDS)",
                      stack: "FastAPI, Python AsyncIO, WebSockets, MySQL, Flutter, Idempotency State Machine",
                      bullets: [
                        "Architected synchronized restaurant automation platform connecting dining kiosk ordering terminals with real-time Kitchen Display Systems.",
                        "Eliminated duplicate order submissions during network dropouts by implementing client-side idempotency keys and transactional database locks.",
                        "Segmented WebSocket order broadcast channels by station (grill, fryer, cold prep), cutting kitchen routing confusion by 40%.",
                        "Sub-second KOT propagation from customer tap to kitchen display with optimistic UI updates and auto-revert fallback.",
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Project 3
                    _buildProjectItem(
                      title: "3. Generative AI Medical & Industrial Knowledge Search Engine (RAG)",
                      stack: "Python 3.11+, FastAPI, LangChain, OpenAI API, pgvector, PostgreSQL, Docker",
                      bullets: [
                        "Designed a Retrieval-Augmented Generation (RAG) platform performing contextual semantic search and automated Q&A across 10,000+ technical manual pages.",
                        "Indexed high-dimensional vector embeddings in PostgreSQL via pgvector, achieving <200ms semantic similarity retrieval latency.",
                        "Enforced strict prompt bounding eliminating model hallucinations and delivering verifiable citations to source engineering documentation.",
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

