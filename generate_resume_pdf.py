import os
from playwright.sync_api import sync_playwright

HTML_CONTENT = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Maniananth M - Software Engineer Resume</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap');

    @page {
      size: A4;
      margin: 12mm 14mm 12mm 14mm;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      color: #1e293b;
      background: #ffffff;
      font-size: 9.2pt;
      line-height: 1.36;
      -webkit-font-smoothing: antialiased;
    }

    a {
      color: #0284c7;
      text-decoration: none;
    }

    .page {
      width: 100%;
    }

    .page-break {
      page-break-before: always;
      break-before: page;
      padding-top: 2mm;
    }

    .header {
      text-align: center;
      border-bottom: 2px solid #0f172a;
      padding-bottom: 8px;
      margin-bottom: 12px;
    }

    .candidate-name {
      font-size: 21pt;
      font-weight: 800;
      letter-spacing: -0.5px;
      color: #0f172a;
      text-transform: uppercase;
      margin-bottom: 3px;
    }

    .candidate-title {
      font-size: 11pt;
      font-weight: 700;
      color: #0d9488;
      letter-spacing: 0.3px;
      margin-bottom: 6px;
    }

    .contact-row {
      font-size: 9.0pt;
      color: #475569;
      margin-bottom: 4px;
    }

    .contact-row a {
      color: #1e293b;
      font-weight: 600;
    }

    .links-row {
      font-family: 'JetBrains Mono', monospace;
      font-size: 8.5pt;
      color: #0369a1;
    }

    .links-row a {
      color: #0284c7;
      font-weight: 600;
    }

    .section {
      margin-bottom: 14px;
      break-inside: avoid;
    }

    .section-title {
      font-size: 10.5pt;
      font-weight: 800;
      color: #0f172a;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      border-bottom: 1.5px solid #cbd5e1;
      padding-bottom: 3px;
      margin-bottom: 8px;
    }

    .summary-text {
      color: #334155;
      text-align: justify;
      font-size: 9.3pt;
      line-height: 1.45;
    }

    .skills-table {
      width: 100%;
      border-collapse: collapse;
    }

    .skills-table td {
      padding: 2.8px 0;
      vertical-align: top;
      font-size: 8.9pt;
      line-height: 1.34;
      color: #334155;
    }

    .skill-label {
      font-weight: 700;
      color: #0f172a;
      width: 185px;
      padding-right: 10px;
      white-space: nowrap;
    }

    .job-header {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      margin-bottom: 2px;
    }

    .job-company {
      font-size: 11pt;
      font-weight: 700;
      color: #0f172a;
    }

    .job-dates {
      font-family: 'JetBrains Mono', monospace;
      font-size: 8.6pt;
      color: #64748b;
      font-weight: 600;
    }

    .job-sub {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      margin-bottom: 4px;
    }

    .job-role {
      font-size: 9.6pt;
      font-weight: 700;
      color: #0d9488;
    }

    .job-location {
      font-size: 8.6pt;
      color: #64748b;
    }

    .job-desc {
      font-size: 9.0pt;
      color: #475569;
      font-style: italic;
      margin-bottom: 6px;
    }

    .bullet-list {
      margin: 0;
      padding-left: 18px;
    }

    .bullet-list li {
      font-size: 9.0pt;
      line-height: 1.40;
      color: #334155;
      margin-bottom: 5px;
    }

    .metric-bold {
      font-weight: 700;
      color: #0f172a;
    }

    .project-card {
      margin-bottom: 12px;
      break-inside: avoid;
    }

    .project-header {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      margin-bottom: 2px;
    }

    .project-title {
      font-size: 10.2pt;
      font-weight: 700;
      color: #0f172a;
    }

    .project-tech {
      font-family: 'JetBrains Mono', monospace;
      font-size: 8.4pt;
      color: #0369a1;
      font-weight: 600;
      margin-bottom: 4px;
    }

    .edu-item {
      display: flex;
      justify-content: space-between;
      align-items: baseline;
      margin-bottom: 4px;
      break-inside: avoid;
    }

    .edu-degree {
      font-size: 9.6pt;
      font-weight: 700;
      color: #0f172a;
    }

    .edu-sub {
      font-size: 8.8pt;
      color: #475569;
      margin-top: 1px;
    }

    .edu-date {
      font-family: 'JetBrains Mono', monospace;
      font-size: 8.6pt;
      color: #64748b;
      font-weight: 600;
    }

    .cert-item {
      margin-top: 8px;
      break-inside: avoid;
    }

    .cert-title {
      font-size: 9.4pt;
      font-weight: 700;
      color: #0f172a;
    }

    .cert-sub {
      font-size: 8.8pt;
      color: #475569;
    }

    .page-header-mini {
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #cbd5e1;
      padding-bottom: 4px;
      margin-bottom: 12px;
      font-size: 8.2pt;
      color: #64748b;
      font-family: 'JetBrains Mono', monospace;
    }
  </style>
</head>
<body>

  <!-- ==================== PAGE 1 ==================== -->
  <div class="page">
    <!-- HEADER -->
    <div class="header">
      <div class="candidate-name">MANIANANTH M</div>
      <div class="candidate-title">Software Engineer — Python Backend & Full-Stack Architect</div>
      <div class="contact-row">
        <span>Email: <a href="mailto:maniananth93@gmail.com">maniananth93@gmail.com</a></span>
        <span>•</span>
        <span>Phone: <a href="tel:+919787245016">+91 9787245016</a></span>
        <span>•</span>
        <span>Location: Coimbatore, Tamil Nadu, India</span>
      </div>
      <div class="links-row">
        <span>LinkedIn: <a href="https://linkedin.com/in/maniananth23" target="_blank">linkedin.com/in/maniananth23</a></span>
        <span>•</span>
        <span>GitHub: <a href="https://github.com/Maniananthgit" target="_blank">github.com/Maniananthgit</a></span>
        <span>•</span>
        <span>Portfolio: <a href="https://maniananth-portfolio.web.app" target="_blank">maniananth-portfolio.web.app</a></span>
      </div>
    </div>

    <!-- PROFESSIONAL SUMMARY -->
    <div class="section">
      <div class="section-title">PROFESSIONAL SUMMARY</div>
      <p class="summary-text">
        Production-proven Software Engineer with ~3 years of commercial experience specializing in high-concurrency Python & FastAPI backends, asynchronous microservice architectures (AsyncIO), and cross-platform Flutter client integrations. Demonstrated track record of slashing API latency by <span class="metric-bold">42%</span>, orchestrating bidirectional real-time WebSocket pipelines for <span class="metric-bold">50+ concurrent field technicians</span>, and designing Generative AI / RAG search systems using pgvector with sub-200ms latency. Dedicated adherent of Clean Architecture, domain-driven data models, idempotent API transactions, and automated test-driven development (<span class="metric-bold">85%+ Pytest coverage</span>).
      </p>
    </div>

    <!-- CORE TECHNICAL SKILLS TAXONOMY -->
    <div class="section">
      <div class="section-title">CORE TECHNICAL SKILLS TAXONOMY</div>
      <table class="skills-table">
        <tr>
          <td class="skill-label">Programming Languages:</td>
          <td>Python 3.11+, Dart, SQL, Bash / Shell Scripting</td>
        </tr>
        <tr>
          <td class="skill-label">Backend Frameworks & APIs:</td>
          <td>FastAPI, Python AsyncIO, Uvicorn, Django, Flask, RESTful APIs, WebSockets, ASGI Channels, Pydantic v2, Swagger / OpenAPI</td>
        </tr>
        <tr>
          <td class="skill-label">Databases & Data Storage:</td>
          <td>PostgreSQL, MySQL, SQLite, Redis Caching, SQLAlchemy ORM, Alembic Migrations, B-Tree Indexing, Query Optimization, ACID</td>
        </tr>
        <tr>
          <td class="skill-label">AI & Machine Learning:</td>
          <td>Generative AI, Large Language Models (LLMs), Retrieval-Augmented Generation (RAG), pgvector, LangChain, Vector Embeddings, Semantic Search</td>
        </tr>
        <tr>
          <td class="skill-label">Cloud, DevOps & Tools:</td>
          <td>Docker, Docker Compose, Linux / Ubuntu, AWS (EC2, S3), Nginx Reverse Proxy, Git, GitHub Actions (CI/CD), Postman</td>
        </tr>
        <tr>
          <td class="skill-label">Architecture & Security:</td>
          <td>Microservices, Clean Architecture, Event-Driven Architecture, High Concurrency, Non-blocking I/O, RBAC, JWT, OAuth 2.0</td>
        </tr>
        <tr>
          <td class="skill-label">Testing & Code Quality:</td>
          <td>Pytest, Unit Testing, Integration Testing, API Contract Testing, Test-Driven Development (TDD), Structured Error Envelopes</td>
        </tr>
        <tr>
          <td class="skill-label">Frontend & Mobile:</td>
          <td>Flutter, Dart, Cross-Platform Web & Mobile, Provider State Management, Offline Data Caching, WebSocket Client Sync</td>
        </tr>
      </table>
    </div>

    <!-- COMMERCIAL WORK EXPERIENCE -->
    <div class="section">
      <div class="section-title">COMMERCIAL WORK EXPERIENCE</div>
      <div class="job-header">
        <span class="job-company">SPI Equipments</span>
        <span class="job-dates">Oct 2023 – Present</span>
      </div>
      <div class="job-sub">
        <span class="job-role">Python Backend Developer & Full-Stack Engineer</span>
        <span class="job-location">Coimbatore, Tamil Nadu, India</span>
      </div>
      <div class="job-desc">
        Core backend and full-stack contributor engineering distributed enterprise maintenance automation platforms, real-time telemetry pipelines, and Flutter client applications.
      </div>
      <ul class="bullet-list">
        <li><span class="metric-bold">42% Latency Reduction:</span> Refactored core RESTful API endpoints from synchronous blocking I/O to non-blocking FastAPI <span class="metric-bold">AsyncIO</span> coroutines and async SQLAlchemy connection pooling, cutting average API latency by 42%.</li>
        <li><span class="metric-bold">Real-Time Event Streaming:</span> Architected a bidirectional WebSocket pub/sub notification pipeline delivering sub-second real-time service alerts to <span class="metric-bold">50+ concurrent field technicians</span>, eliminating polling server overhead.</li>
        <li><span class="metric-bold">60% Query Execution Optimization:</span> Tuned complex relational schemas and query execution plans on PostgreSQL with composite B-tree indexing, cutting heavy join execution times by 60%.</li>
        <li><span class="metric-bold">35% Throughput Increase:</span> Modularized backend services using strict Pydantic v2 data models and centralized error envelopes, increasing request processing throughput by 35%.</li>
        <li><span class="metric-bold">85%+ Test Coverage:</span> Designed automated unit and integration test suites using <span class="metric-bold">pytest</span> and <span class="metric-bold">httpx.AsyncClient</span>, elevating code coverage to 85%+ with zero production regressions.</li>
        <li><span class="metric-bold">Cross-Platform Flutter Integration:</span> Developed and deployed cross-platform client mobile applications featuring offline-first local state caching and automated background synchronization.</li>
      </ul>
    </div>
  </div>

  <!-- ==================== PAGE 2 ==================== -->
  <div class="page page-break">
    <div class="page-header-mini">
      <span>MANIANANTH M — RESUME</span>
      <span>PAGE 2 OF 2 • PYTHON BACKEND & FULL-STACK ARCHITECT</span>
    </div>

    <!-- KEY ENGINEERING PROJECTS -->
    <div class="section">
      <div class="section-title">KEY ENGINEERING PROJECTS</div>

      <div class="project-card">
        <div class="project-header">
          <span class="project-title">1. Service Management Application (Enterprise Field Dispatch)</span>
        </div>
        <div class="project-tech">FastAPI • Python 3.11+ • WebSockets • PostgreSQL • SQLAlchemy • Flutter • Docker</div>
        <ul class="bullet-list">
          <li>Engineered full-lifecycle field maintenance platform connecting Admin, Service Managers, and Field Engineers for automated equipment service tracking.</li>
          <li>Bypassed polling latency with bidirectional WebSockets, delivering real-time ticket alerts and cutting technician response times by <span class="metric-bold">45%</span>.</li>
          <li>Structured normalized PostgreSQL schema with composite B-tree indexing to process <span class="metric-bold">10,000+</span> servicing history and part replacement logs.</li>
          <li>Implemented multi-tier Role-Based Access Control (RBAC) with JWT authentication separating field, management, and administrative privileges.</li>
        </ul>
      </div>

      <div class="project-card">
        <div class="project-header">
          <span class="project-title">2. Restaurant Self-Ordering & Kitchen Display System (KDS)</span>
        </div>
        <div class="project-tech">FastAPI • Python AsyncIO • WebSockets • MySQL • Flutter • Idempotency State Machine</div>
        <ul class="bullet-list">
          <li>Architected synchronized restaurant automation platform connecting table-side ordering kiosks with real-time Kitchen Display Systems.</li>
          <li>Eliminated duplicate order submissions during network dropouts using client-side idempotency keys and transactional database locks.</li>
          <li>Segmented WebSocket order broadcast channels by station (grill, fryer, cold prep), cutting kitchen routing confusion by <span class="metric-bold">40%</span>.</li>
          <li>Delivered sub-second KOT propagation from customer tap to kitchen display with optimistic UI updates and auto-revert fallback.</li>
        </ul>
      </div>

      <div class="project-card">
        <div class="project-header">
          <span class="project-title">3. Generative AI Medical & Industrial Knowledge Search Engine (RAG)</span>
        </div>
        <div class="project-tech">Python 3.11+ • FastAPI • LangChain • OpenAI API • pgvector • PostgreSQL • Docker</div>
        <ul class="bullet-list">
          <li>Designed a Retrieval-Augmented Generation (RAG) platform performing contextual semantic search and Q&A across <span class="metric-bold">10,000+</span> technical manual pages.</li>
          <li>Indexed high-dimensional vector embeddings in PostgreSQL via <span class="metric-bold">pgvector</span>, achieving <span class="metric-bold">&lt;200ms</span> semantic similarity retrieval latency.</li>
          <li>Enforced strict prompt bounding eliminating model hallucinations and delivering verifiable citations to source engineering documentation.</li>
        </ul>
      </div>
    </div>

    <!-- EDUCATION & CERTIFICATIONS -->
    <div class="section">
      <div class="section-title">EDUCATION & CERTIFICATIONS</div>
      <div class="edu-item">
        <div>
          <span class="edu-degree">Bachelor of Engineering (B.E.) — Mechanical Engineering</span>
          <div class="edu-sub">KPR Institute of Engineering and Technology | Grade: 7.7 CGPA | Coimbatore, India</div>
        </div>
        <span class="edu-date">2019 – 2023</span>
      </div>
      <div class="cert-item">
        <span class="cert-title">Python Full Stack Development Certification</span>
        <span class="cert-sub">— Appin Technology (2023)</span>
        <div class="edu-sub">Verified Competencies: Python 3, Django, FastAPI, REST APIs, PostgreSQL, Docker, Git</div>
      </div>
    </div>

    <!-- ENGINEERING PRINCIPLES & ARCHITECTURAL DISCIPLINE -->
    <div class="section" style="margin-top: 14px;">
      <div class="section-title">CORE ENGINEERING PRINCIPLES & STANDARDS</div>
      <table class="skills-table">
        <tr>
          <td class="skill-label">Clean Architecture:</td>
          <td>Strict separation of Domain Entities, Use Cases / Interactors, Repositories, and Delivery Gateways.</td>
        </tr>
        <tr>
          <td class="skill-label">Concurrency & Scale:</td>
          <td>Non-blocking asynchronous I/O (AsyncIO), event loops, connection pooling, and horizontal microservice scaling.</td>
        </tr>
        <tr>
          <td class="skill-label">Resilience & Fail-Safes:</td>
          <td>Idempotent request keys, automatic retry policies with exponential backoff, circuit breakers, and transactional rollback.</td>
        </tr>
        <tr>
          <td class="skill-label">Security & Defense:</td>
          <td>OAuth 2.0 / JWT bearer tokens, bcrypt credential hashing, role-based access control (RBAC), and SQL injection prevention via parameterized ORM queries.</td>
        </tr>
      </table>
    </div>

  </div>

</body>
</html>
"""

def generate_pdf():
    os.makedirs("web", exist_ok=True)
    pdf_path = os.path.abspath("web/Maniananth_M_Resume.pdf")
    
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.set_content(HTML_CONTENT, wait_until="networkidle")
        page.pdf(
            path=pdf_path,
            format="A4",
            print_background=True,
            margin={
                "top": "10mm",
                "right": "12mm",
                "bottom": "10mm",
                "left": "12mm"
            }
        )
        browser.close()
        print(f"Generated PDF successfully at: {pdf_path}")
        print(f"File size: {os.path.getsize(pdf_path)} bytes")

if __name__ == "__main__":
    generate_pdf()
