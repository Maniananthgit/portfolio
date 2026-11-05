import os
from playwright.sync_api import sync_playwright

HTML_CONTENT = """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>MANIANANTH M - Resume</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap');

    @page {
      size: A4;
      margin: 12mm 15mm 12mm 15mm;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      color: #111827;
      background: #ffffff;
      font-size: 9.3pt;
      line-height: 1.40;
      -webkit-font-smoothing: antialiased;
    }

    a {
      color: #111827;
      text-decoration: none;
    }

    .page {
      width: 100%;
    }

    .page-break {
      page-break-before: always;
      break-before: page;
      padding-top: 4mm;
    }

    .header {
      text-align: center;
      margin-bottom: 14px;
    }

    .candidate-name {
      font-size: 21pt;
      font-weight: 800;
      letter-spacing: -0.3px;
      color: #111827;
      text-transform: uppercase;
      margin-bottom: 4px;
    }

    .candidate-title {
      font-size: 10.5pt;
      font-weight: 700;
      color: #111827;
      letter-spacing: 0.1px;
      margin-bottom: 4px;
    }

    .contact-row {
      font-size: 9.0pt;
      color: #1f2937;
      margin-bottom: 2px;
    }

    .contact-row a {
      color: #1f2937;
    }

    .links-row {
      font-size: 8.8pt;
      color: #1f2937;
    }

    .links-row a {
      color: #1f2937;
    }

    .section {
      margin-bottom: 12px;
      break-inside: avoid;
    }

    .section-title {
      font-size: 9.8pt;
      font-weight: 800;
      color: #111827;
      text-transform: uppercase;
      letter-spacing: 0.6px;
      border-bottom: 1.2px solid #111827;
      padding-bottom: 2px;
      margin-bottom: 6px;
    }

    .summary-text {
      color: #1f2937;
      text-align: justify;
      font-size: 9.1pt;
      line-height: 1.42;
    }

    .skill-line {
      font-size: 9.0pt;
      line-height: 1.44;
      color: #1f2937;
      margin-bottom: 2px;
    }

    .skill-label {
      font-weight: 700;
      color: #111827;
    }

    .exp-header {
      font-size: 9.5pt;
      font-weight: 700;
      color: #111827;
      margin-bottom: 4px;
    }

    .bullet-list {
      margin: 0;
      padding-left: 18px;
    }

    .bullet-list li {
      font-size: 9.0pt;
      line-height: 1.40;
      color: #1f2937;
      margin-bottom: 3.5px;
    }

    .project-card {
      margin-bottom: 11px;
      break-inside: avoid;
    }

    .project-title {
      font-size: 9.6pt;
      font-weight: 700;
      color: #111827;
      margin-bottom: 1.5px;
    }

    .project-tech {
      font-size: 8.8pt;
      color: #1f2937;
      margin-bottom: 3px;
    }

    .project-tech span {
      font-weight: 700;
    }

    .edu-line {
      font-size: 9.2pt;
      color: #1f2937;
      margin-bottom: 3px;
    }

    .edu-line strong {
      color: #111827;
      font-weight: 700;
    }
  </style>
</head>
<body>

  <!-- ==================== PAGE 1 ==================== -->
  <div class="page">
    <!-- HEADER -->
    <div class="header">
      <div class="candidate-name">MANIANANTH M</div>
      <div class="candidate-title">Software Developer | Python Backend & Flutter Applications</div>
      <div class="contact-row">
        <span>Coimbatore, Tamil Nadu, India</span>
        <span> | </span>
        <span><a href="tel:+919787245016">+91 9787245016</a></span>
        <span> | </span>
        <span><a href="mailto:maniananth93@gmail.com">maniananth93@gmail.com</a></span>
      </div>
      <div class="links-row">
        <span><a href="https://linkedin.com/in/maniananth23" target="_blank">linkedin.com/in/maniananth23</a></span>
        <span> | </span>
        <span><a href="https://github.com/Maniananthgit" target="_blank">github.com/Maniananthgit</a></span>
        <span> | </span>
        <span><a href="https://maniananth-portfolio.web.app" target="_blank">maniananth-portfolio.web.app</a></span>
      </div>
    </div>

    <!-- PROFESSIONAL SUMMARY -->
    <div class="section">
      <div class="section-title">PROFESSIONAL SUMMARY</div>
      <p class="summary-text">
        Software Developer with 3 years of combined experience across software development and manufacturing, focused on Python backend development and cross-platform Flutter applications. Skilled in FastAPI REST APIs (with working knowledge of Django and Flask), PostgreSQL, MySQL, Redis, JWT/RBAC security, and real-time systems using WebSockets and MQTT. Experienced with Docker, Linux, Nginx, and CI/CD; familiar with Celery, Pytest, and microservices architecture.
      </p>
    </div>

    <!-- TECHNICAL SKILLS -->
    <div class="section">
      <div class="section-title">TECHNICAL SKILLS</div>
      <div class="skill-line"><span class="skill-label">Backend:</span> Python, FastAPI, Django, Flask, REST API, Async, SQLAlchemy, Pydantic, Celery, Pytest, RAG (basic knowledge)</div>
      <div class="skill-line"><span class="skill-label">Databases:</span> PostgreSQL, MySQL, Redis</div>
      <div class="skill-line"><span class="skill-label">Architecture & Fundamentals:</span> Microservices, MVVM, System Design, Data Structures & Algorithms (DSA)</div>
      <div class="skill-line"><span class="skill-label">Security & Communication:</span> JWT, OAuth 2.0, RBAC, RSA, WebSockets, MQTT</div>
      <div class="skill-line"><span class="skill-label">DevOps & Cloud:</span> Docker, Docker Compose, Linux, Nginx, Git, GitHub Actions, CI/CD, AWS, Hostinger VPS</div>
      <div class="skill-line"><span class="skill-label">Frontend & Tools:</span> Flutter, Dart, Provider, GoRouter, HTML, CSS, Postman, SQL</div>
    </div>

    <!-- PROFESSIONAL EXPERIENCE -->
    <div class="section">
      <div class="section-title">PROFESSIONAL EXPERIENCE</div>
      <div class="exp-header">
        SPI Equipments India Pvt. Ltd. — Software Developer, R&D | 2024 – Present | Coimbatore, Tamil Nadu
      </div>
      <ul class="bullet-list">
        <li>Develop and maintain cross-platform business applications using Flutter and Dart.</li>
        <li>Build REST APIs and backend services using Python and FastAPI with PostgreSQL and MySQL databases.</li>
        <li>Implement JWT authentication and role-based access control; build real-time workflows using WebSockets and asynchronous programming.</li>
        <li>Containerize backend services with Docker and Docker Compose, and configure Nginx as a reverse proxy.</li>
        <li>Use Git, GitHub, and GitHub Actions to manage source code and support CI/CD workflows.</li>
      </ul>
    </div>

    <!-- SELECTED PROJECTS (Part 1 on Page 1) -->
    <div class="section">
      <div class="section-title">SELECTED PROJECTS</div>

      <div class="project-card">
        <div class="project-title">Service Software — After-Sales & Service Management Application</div>
        <div class="project-tech"><span>Technology:</span> Flutter, Dart, Provider, GoRouter, FastAPI, Python, MySQL, WebSockets, Firebase Cloud Messaging, Docker, Nginx</div>
        <ul class="bullet-list">
          <li>Developed a cross-platform service-management application supporting Admin, Service Engineer, Customer, and Accounts workflows.</li>
          <li>Built FastAPI endpoints with JWT authentication and role-based access control; implemented real-time updates using WebSockets and Firebase Cloud Messaging.</li>
          <li>Supported cloud deployment with Docker containers and Nginx reverse-proxy routing.</li>
        </ul>
      </div>

      <div class="project-card">
        <div class="project-title">ColorChef V4 — Industrial Dye Dispensing SCADA</div>
        <div class="project-tech"><span>Technology:</span> Flutter Desktop, Dart, MVVM, RS-232 Serial, Multithreading, SQLite, Hive</div>
        <ul class="bullet-list">
          <li>Developed an industrial desktop HMI/SCADA application for automated textile dye and chemical dispensing, controlling multi-axis (X/Y/Z) mechanical positions and 24-beaker batch scheduling.</li>
          <li>Integrated continuous RS-232 industrial weighing scale telemetry using background Dart Isolates for zero-latency dosing precision, storing batch history in an offline SQLite database with PDF/Excel reporting.</li>
        </ul>
      </div>

      <div class="project-card">
        <div class="project-title">Yarn Quality Control & Lea Strength Tester</div>
        <div class="project-tech"><span>Technology:</span> Flutter Desktop, Dart, MVVM, RS-232 Serial, SQLite FFI, fl_chart, PDF Generation</div>
        <ul class="bullet-list">
          <li>Developed an industrial textile QC desktop application to measure yarn tensile breaking strength, automatically calculating Yarn Count (Ne), CSP, Standard Deviation, and CV%.</li>
          <li>Integrated dual RS-232 serial interfaces for digital precision scales and machine load controllers, generating real-time analytics graphs and certified laboratory PDF test reports.</li>
        </ul>
      </div>
    </div>
  </div>

  <!-- ==================== PAGE 2 ==================== -->
  <div class="page page-break">
    <div class="section">
      <div class="project-card" style="margin-top: 4px;">
        <div class="project-title">Restaurant Self-Ordering Kiosk & Kitchen Display System</div>
        <div class="project-tech"><span>Technology:</span> Python, FastAPI, PostgreSQL, Redis, WebSockets, Docker Compose, Nginx</div>
        <ul class="bullet-list">
          <li>Designed a restaurant self-ordering workflow connecting customer kiosks with a kitchen display system.</li>
          <li>Designed FastAPI backend services and PostgreSQL data structures for menu, order, and kitchen workflows, with WebSocket-based real-time order updates and Redis in the architecture.</li>
          <li>Prepared a containerized deployment using Docker Compose and Nginx.</li>
        </ul>
      </div>
    </div>

    <!-- EDUCATION & CERTIFICATION -->
    <div class="section" style="margin-top: 14px;">
      <div class="section-title">EDUCATION & CERTIFICATION</div>
      <div class="edu-line">
        <strong>B.E. — Mechanical Engineering — Adhiyamaan College</strong> | 2015 – 2019 | CGPA: 8.01
      </div>
      <div class="edu-line">
        <strong>Python Full Stack Developer Certification — PUMO TECHNOVATION</strong> | 2023
      </div>
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
