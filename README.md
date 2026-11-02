# Maniananth M — Software Engineer Portfolio (Recruiter Edition)

A high-performance personal engineering portfolio and recruiter hub for **Maniananth M**, targeting higher-paying **Python Backend Engineer**, **FastAPI Specialist**, and **Full-Stack Software Engineer** roles.

---

## 👤 Official Candidate Profile

- **Name:** Maniananth M
- **Target Roles:** Python Backend Engineer, FastAPI Developer, Full-Stack Software Engineer
- **Current Location:** Coimbatore, Tamil Nadu, India
- **Email:** `maniananth93@gmail.com`
- **Phone:** `+91 9787245016`
- **LinkedIn:** [linkedin.com/in/maniananth23](https://www.linkedin.com/in/maniananth23)
- **GitHub:** [github.com/Maniananthgit](https://github.com/Maniananthgit)
- **Commercial Experience:** ~3 Years (SPI Equipments India Private Limited)
- **Education:** B.E. Mechanical Engineering, Adhiyamaan College (2015–2019, GPA: 8.01 / 10)
- **Certification:** Python Full Stack Developer, PUMO TECHNOVATION (2023)

---

## 🛠️ Complete Technical Skills Taxonomy

### 1. Backend Development
- Python, FastAPI, Django
- REST API Development & API Integration
- Asynchronous Programming (Async/Await) & ASGI (Uvicorn)
- WebSockets & Event Streaming
- Authentication & Authorization (JWT, OAuth 2.0)

### 2. Databases & Data Management
- PostgreSQL, MySQL, SQLite
- SQLAlchemy ORM & Connection Pooling
- Database Design & Relational Schema Optimization
- Database Migrations & Versioning
- Redis Caching & Session Stores
- Query Optimization & Composite Indexing

### 3. AI & Generative AI
- Large Language Model (LLM) Integration
- Generative AI Application Development
- Prompt Engineering & Context Management
- Embeddings & Semantic Search
- Retrieval-Augmented Generation (RAG)
- Vector Search with `pgvector`
- AI Tool Calling & Workflow Automation
- AI Evaluation & Safety Guardrails

### 4. Cloud & DevOps
- Docker & Docker Compose Containerization
- Linux / Ubuntu Server Administration
- Amazon Web Services (AWS)
- Git & GitHub Version Control
- GitHub Actions (CI/CD Automated Pipelines)
- Nginx Reverse Proxy & SSL Configuration
- Application Deployment & Telemetry Monitoring

### 5. Testing & Software Quality
- Pytest Automated Testing
- Unit & Integration Test Suites
- API Contract & Endpoint Testing
- Structured Debugging & Logging
- Granular Error Handling Envelopes
- Secure API Development

### 6. Frontend & Application Development
- Flutter & Dart
- Provider State Management
- Responsive UI Development (Mobile, Tablet & Kiosk)
- Client REST API Integration
- Real-Time WebSocket Client Integration

### 7. Software Engineering Fundamentals
- Object-Oriented Programming (OOP)
- Data Structures & Algorithms (DSA)
- Clean Code & Layered Architecture
- System Design Fundamentals (Idempotency, Non-blocking I/O)
- Performance & Query Optimization
- Agile / Scrum Development

---

## 🌟 Key Application Features

1. **Built 100% in Flutter Web:** Direct, hands-on proof of production-grade Flutter, Dart, and responsive state architecture.
2. **Executive Engineering Metrics Grid:** Verified commercial production indicators including ~3 Years tenure at SPI Equipments India, FastAPI, PostgreSQL, and LLM/RAG competencies.
3. **Featured Production Case Studies:**
   - **Service Management Application:** Flutter tablet client, FastAPI microservices, RBAC gates, and real-time engineer dispatch.
   - **Restaurant KDS & Self-Ordering System:** Sub-second kitchen order propagation, client idempotency keys, and station-specific state machines.
4. **Editorial Bento Capabilities Grid:** Concrete architectural competencies developed across production deployments at SPI Equipments India.
5. **ATS-Friendly Printable Résumé Modal:** Single-column layout with instant plaintext copy and print formatting.
6. **Centralized Data Store:** All content configured cleanly in `lib/data/portfolio_data.dart`.
7. **Previous React Code Safely Preserved:** Full previous React/Vite source code is archived in `_react_archive/`.

---

## 🚀 Running Locally with Flutter

```bash
# Get Flutter dependencies
flutter pub get

# Run on Chrome locally
flutter run -d chrome

# Or use npm script:
npm run dev

# Analyze code quality
flutter analyze

# Build production web bundle
flutter build web --release
```
Production build compiles cleanly to `build/web` with 0 errors and 0 issues.

---

## 🌐 Global Cloud Deployment (Firebase Hosting)

The Flutter Web portfolio is deployed live on Google Cloud's global CDN via Firebase Hosting:

- **Live URL:** [https://maniananth-portfolio.web.app](https://maniananth-portfolio.web.app)
- **Secondary Domain:** [https://maniananth-portfolio.firebaseapp.com](https://maniananth-portfolio.firebaseapp.com)
- **Firebase Console:** [console.firebase.google.com/project/maniananth-portfolio/overview](https://console.firebase.google.com/project/maniananth-portfolio/overview)

### How to Deploy Future Updates

Whenever you make updates in `lib/data/portfolio_data.dart` or any Flutter widget:

```bash
npm run deploy
```
*(or run `flutter build web --release && npx firebase deploy --only hosting`)*

This compiles your Flutter Web application and deploys it live across Google's global CDN in seconds.

---

## 🔗 Adding a Custom Domain (e.g. `maniananth.dev`, `maniananth.com`)

You can connect any custom domain to your Firebase Hosting site for free with an automated Google SSL certificate:

1. **Open Firebase Hosting Console:**
   Go to [Firebase Hosting Dashboard](https://console.firebase.google.com/project/maniananth-portfolio/hosting/sites).
2. **Add Custom Domain:**
   Click the **"Add custom domain"** button.
3. **Enter Domain Name:**
   Type your domain (for example, `maniananth.dev` or `www.maniananth.dev`). Check the box to redirect root domain if prompted.
4. **Configure DNS Records:**
   Firebase will give you:
   - **Type:** `A` Record
   - **Host / Name:** `@` (or subdomain)
   - **Value / Destination:** Two Google IP addresses (e.g., `199.36.158.100`)
   *(If domain ownership verification is needed, Firebase will also give a one-time `TXT` record)*.
5. **Update DNS in Domain Registrar:**
   Log in to where you bought your domain (GoDaddy, Namecheap, Cloudflare, Hostinger, Google Domains, etc.), open **DNS Management**, and add the records provided by Firebase.
6. **SSL Provisioning:**
   Firebase automatically provisions and renews a free Let's Encrypt / Google SSL certificate within a few hours. Once DNS propagates, your custom URL is live!
