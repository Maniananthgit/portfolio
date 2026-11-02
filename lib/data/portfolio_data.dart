class PersonalInfo {
  final String name;
  final String initials;
  final String role;
  final List<String> targetRoles;
  final String experienceSummary;
  final String location;
  final String email;
  final String phone;
  final String linkedin;
  final String github;
  final String status;
  final String summary;

  const PersonalInfo({
    required this.name,
    required this.initials,
    required this.role,
    required this.targetRoles,
    required this.experienceSummary,
    required this.location,
    required this.email,
    required this.phone,
    required this.linkedin,
    required this.github,
    required this.status,
    required this.summary,
  });
}

class MetricItem {
  final String label;
  final String value;
  final String detail;

  const MetricItem({
    required this.label,
    required this.value,
    required this.detail,
  });
}

class CapabilityItem {
  final String id;
  final String category;
  final String title;
  final String description;
  final List<String> tags;
  final String highlight;

  const CapabilityItem({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.tags,
    required this.highlight,
  });
}

class ProjectFeature {
  final String name;
  final String desc;

  const ProjectFeature({required this.name, required this.desc});
}

class ArchitectureComponent {
  final String name;
  final String tech;
  final String role;

  const ArchitectureComponent({required this.name, required this.tech, required this.role});
}

class EngineeringDecision {
  final String decision;
  final String rationale;

  const EngineeringDecision({required this.decision, required this.rationale});
}

class ProjectItem {
  final String id;
  final String title;
  final String subtitle;
  final String client;
  final String backend;
  final String database;
  final String deployment;
  final String summary;
  final String challenge;
  final String solution;
  final List<ProjectFeature> keyFeatures;
  final String architecturePattern;
  final List<ArchitectureComponent> architectureComponents;
  final List<EngineeringDecision> engineeringDecisions;
  final List<String> securityAndTesting;
  final List<String> verifiedImpact;
  final String status;
  final List<String> tags;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.client,
    required this.backend,
    required this.database,
    required this.deployment,
    required this.summary,
    required this.challenge,
    required this.solution,
    required this.keyFeatures,
    required this.architecturePattern,
    required this.architectureComponents,
    required this.engineeringDecisions,
    required this.securityAndTesting,
    required this.verifiedImpact,
    required this.status,
    required this.tags,
  });
}

class ExperienceItem {
  final String company;
  final String role;
  final String location;
  final String period;
  final String employmentType;
  final String description;
  final List<String> contributions;

  const ExperienceItem({
    required this.company,
    required this.role,
    required this.location,
    required this.period,
    required this.employmentType,
    required this.description,
    required this.contributions,
  });
}

class SkillItem {
  final String name;
  final String level;
  final String years;

  const SkillItem({required this.name, required this.level, required this.years});
}

class EngineeringPrinciple {
  final String title;
  final String subtitle;
  final String description;

  const EngineeringPrinciple({
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String location;
  final String duration;
  final String grade;
  final String description;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.location,
    required this.duration,
    required this.grade,
    required this.description,
  });
}

class CertificationItem {
  final String title;
  final String issuer;
  final String year;
  final List<String> skills;

  const CertificationItem({
    required this.title,
    required this.issuer,
    required this.year,
    required this.skills,
  });
}

class PortfolioData {
  static const personal = PersonalInfo(
    name: "Maniananth M",
    initials: "MM",
    role: "Python Backend & Full-Stack Software Engineer",
    targetRoles: [
      "Python Backend Engineer",
      "FastAPI Developer",
      "Full-Stack Software Engineer",
    ],
    experienceSummary: "~3 Years of Commercial Software Engineering Experience",
    location: "Coimbatore, Tamil Nadu, India",
    email: "maniananth93@gmail.com",
    phone: "+91 9787245016",
    linkedin: "https://www.linkedin.com/in/maniananth23",
    github: "https://github.com/Maniananthgit",
    status: "Actively interviewing for senior backend & full-stack roles",
    summary:
        "Software Engineer with ~3 years of commercial production experience at SPI Equipments India specializing in high-concurrency Python backend architectures, FastAPI microservices, real-time WebSocket pipelines, and full-stack Flutter applications. Proven track record designing scalable RESTful APIs, optimizing PostgreSQL and MySQL relational databases with indexed schemas and connection pooling, and deploying containerized applications with Docker. Experienced in Generative AI (RAG with pgvector), Clean Architecture, and achieving 85%+ automated test coverage with Pytest.",
  );

  static const List<MetricItem> metrics = [
    MetricItem(label: "Engineering Experience", value: "~3 Years", detail: "SPI Equipments India Private Limited"),
    MetricItem(label: "Core Backend Stack", value: "FastAPI / Python", detail: "AsyncIO, REST APIs & WebSockets"),
    MetricItem(label: "Database Specialization", value: "PostgreSQL & MySQL", detail: "Relational Schema, Indexing & ACID"),
    MetricItem(label: "AI & Full-Stack", value: "LLMs / RAG & Flutter", detail: "Vector Search & Mobile Clients"),
  ];

  static const List<CapabilityItem> engineeringCapabilities = [
    CapabilityItem(
      id: "async-apis",
      category: "Backend Architecture",
      title: "Asynchronous High-Throughput APIs",
      description:
          "Building non-blocking, ASGI-compliant RESTful web services using FastAPI, Django, Pydantic v2, and Python AsyncIO. Engineered for low-latency request lifecycles, structured error envelopes, and automated OpenAPI documentation.",
      tags: ["Python", "FastAPI", "Django", "Async/Await", "OAuth 2.0 / JWT", "Uvicorn"],
      highlight: "<25ms avg endpoint latency across critical workflows",
    ),
    CapabilityItem(
      id: "ai-genai",
      category: "AI & Vector Search",
      title: "Generative AI, RAG & Vector Workflows",
      description:
          "Integrating Large Language Models (LLMs), prompt engineering, embeddings, semantic search, and Retrieval-Augmented Generation (RAG) using pgvector and automated AI tool calling.",
      tags: ["LLM Integration", "RAG", "pgvector", "Embeddings", "Prompt Engineering", "AI Tool Calling"],
      highlight: "Contextual retrieval & semantic vector indexing",
    ),
    CapabilityItem(
      id: "realtime-websockets",
      category: "Event Streaming",
      title: "Real-Time WebSocket Pipelines",
      description:
          "Designing bidirectional state synchronization channels for live operational dashboards, kitchen display orders, and field dispatch tracking with client heartbeat monitoring and auto-reconnect backoff.",
      tags: ["WebSockets", "Pub/Sub", "ASGI Channels", "State Broadcast", "Provider"],
      highlight: "Sub-second event propagation without polling overhead",
    ),
    CapabilityItem(
      id: "database-engineering",
      category: "Data & Storage",
      title: "Relational Schema Design & Query Optimization",
      description:
          "Architecting normalized relational schemas, multi-table joins, composite indices, and transaction-safe operations in PostgreSQL, MySQL, and SQLite. Connection pooling and Redis caching for peak concurrent load.",
      tags: ["PostgreSQL", "MySQL", "SQLite", "SQLAlchemy", "Redis", "Migrations"],
      highlight: "Strict relational integrity & concurrency isolation",
    ),
    CapabilityItem(
      id: "mobile-frontend",
      category: "Full-Stack Clients",
      title: "Production Flutter & Dart Client Development",
      description:
          "Developing cross-platform mobile and tablet applications for field service engineers and restaurant staff with offline resilience, Provider state management, and real-time WebSocket sync.",
      tags: ["Flutter", "Dart", "Provider", "Responsive UI", "REST & WS Integration"],
      highlight: "Unified codebase supporting Android, iOS & Tablet Kiosks",
    ),
    CapabilityItem(
      id: "devops-testing",
      category: "Reliability & DevOps",
      title: "Docker, Cloud & Automated Testing",
      description:
          "Containerizing backend services with Docker & Compose, configuring Linux environments, automating CI/CD with GitHub Actions, deploying on AWS/Nginx, and testing rigorously via Pytest.",
      tags: ["Docker", "Docker Compose", "AWS", "Linux", "Pytest", "GitHub Actions", "Nginx"],
      highlight: "Repeatable container builds & reproducible test suites",
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      id: "service-management",
      title: "Service Management Application",
      subtitle: "Enterprise Field Equipment Lifecycle & Dispatch System",
      client: "Flutter (Android/iOS/Tablet)",
      backend: "FastAPI, Python 3.11+, WebSockets",
      database: "PostgreSQL, SQLAlchemy",
      deployment: "Docker, Linux (Ubuntu)",
      summary:
          "A full-lifecycle industrial service management platform designed to automate ticket dispatching, field engineer job assignments, service checklists, and real-time maintenance audits for equipment operations at SPI Equipments India.",
      challenge:
          "Legacy servicing workflows suffered from manual communication delays, untracked equipment histories, and lack of real-time visibility into technician dispatch status across distributed customer sites.",
      solution:
          "Engineered an asynchronous FastAPI backend paired with a responsive Flutter mobile/tablet interface. Implemented Role-Based Access Control (RBAC), live WebSocket status sync, and indexed relational models in PostgreSQL for audit logs.",
      keyFeatures: [
        ProjectFeature(
          name: "Role-Based Access Control (RBAC)",
          desc: "Multi-tier authorization separating Admin, Service Manager, and Field Technician capabilities with JWT tokens and scoped permission gates.",
        ),
        ProjectFeature(
          name: "Real-Time Ticket Dispatch Pipeline",
          desc: "FastAPI WebSocket endpoints delivering instant job alerts to field engineers upon assignment, bypassing polling latency.",
        ),
        ProjectFeature(
          name: "Comprehensive Audit & Servicing Logs",
          desc: "Relational audit history capturing equipment serial numbers, engineer observations, part replacements, and customer sign-offs.",
        ),
        ProjectFeature(
          name: "Optimized Relational Schema",
          desc: "PostgreSQL schema with foreign key constraints, connection pooling, and indexed composite queries for fast historical reporting.",
        ),
      ],
      architecturePattern: "Layered Clean Architecture (Presentation -> Service Layer -> Repository Layer -> PostgreSQL)",
      architectureComponents: [
        ArchitectureComponent(name: "Client Layer", tech: "Flutter Mobile / Tablet App", role: "UI, Provider State, Offline Cache"),
        ArchitectureComponent(name: "API Gateway / ASGI", tech: "Uvicorn & Nginx", role: "Reverse proxy, SSL termination & rate limiting"),
        ArchitectureComponent(name: "Core Backend Service", tech: "FastAPI & AsyncIO", role: "Business rules, RBAC verification, WebSocket hub"),
        ArchitectureComponent(name: "Persistence Layer", tech: "PostgreSQL via SQLAlchemy", role: "Transactional storage, indexing, audit trail"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "FastAPI over Django",
          rationale: "Selected FastAPI for native ASGI asynchronous capabilities, lightweight memory footprint, and high I/O throughput necessary for concurrent WebSocket connections and mobile sync.",
        ),
        EngineeringDecision(
          decision: "WebSockets vs Polling for Dispatch Alerts",
          rationale: "Periodic HTTP polling would create unnecessary server load and delayed push alerts. WebSockets provide immediate delivery with client heartbeat ping/pong to detect disconnects.",
        ),
        EngineeringDecision(
          decision: "PostgreSQL Relational Structure",
          rationale: "Strict foreign key constraints ensure that service tickets, technician assignments, and equipment serial numbers remain uncorrupted and auditable.",
        ),
      ],
      securityAndTesting: [
        "Pytest integration tests verifying RBAC token rejection and valid payload ingestion.",
        "Pydantic schema validation rejecting malformed payloads before database interaction.",
        "Environment-based configuration separating development, staging, and production secrets.",
      ],
      verifiedImpact: [
        "Centralized servicing workflow for SPI Equipments operations.",
        "Eliminated manual phone calls for dispatch by providing instant live notifications.",
        "Complete historical service traceability for industrial equipment.",
      ],
      status: "Production Deployed (Enterprise Internal)",
      tags: ["Flutter", "FastAPI", "WebSockets", "PostgreSQL", "Docker", "Pytest"],
    ),
    ProjectItem(
      id: "restaurant-kds",
      title: "Restaurant Self-Ordering & Kitchen Display System",
      subtitle: "High-Concurrency Real-Time Hospitality Ordering Engine",
      client: "Self-Service Ordering Kiosks & Kitchen Display Screens",
      backend: "FastAPI, Python, WebSocket Pub/Sub",
      database: "MySQL / PostgreSQL",
      deployment: "Docker Containerized Local & Cloud Setup",
      summary:
          "A synchronized restaurant automation platform connecting customer self-ordering stations with high-visibility Kitchen Display System (KDS) screens for real-time kitchen queue orchestration.",
      challenge:
          "High rush-hour order volumes created kitchen ticket congestion, lost paper chits, duplicate order submissions during network glitches, and delayed preparation updates.",
      solution:
          "Engineered an event-driven ordering system with FastAPI and WebSockets. Integrated idempotency keys on order creation to eliminate duplicates, and established station-specific broadcast channels (Bar, Grill, Expediter).",
      keyFeatures: [
        ProjectFeature(
          name: "Sub-Second Kitchen Order Ticket (KOT) Dispatch",
          desc: "Orders created on customer kiosks immediately appear on relevant kitchen station screens via segmented WebSocket channels.",
        ),
        ProjectFeature(
          name: "Idempotent Order Ingestion",
          desc: "Unique client-generated idempotency tokens prevent duplicate charges and duplicate tickets during unstable Wi-Fi retransmissions.",
        ),
        ProjectFeature(
          name: "Multi-Stage Kitchen State Machine",
          desc: "Strict order state transitions (Queued -> In Progress -> Plated -> Collected) with timestamp tracking for kitchen metrics.",
        ),
        ProjectFeature(
          name: "Offline Buffer & Auto-Reconnect",
          desc: "Client-side queuing retaining unsent orders if local connection flickers, synchronizing seamlessly upon WebSocket reconnect.",
        ),
      ],
      architecturePattern: "Event-Driven Pub/Sub with State Machine Validation",
      architectureComponents: [
        ArchitectureComponent(name: "Kiosk & Web Clients", tech: "Flutter / Responsive Web", role: "Menu browsing, cart management & order generation"),
        ArchitectureComponent(name: "Kitchen Displays", tech: "Dedicated KDS Screens", role: "Real-time ticket rendering & one-touch status advance"),
        ArchitectureComponent(name: "Order Core Service", tech: "FastAPI & Python", role: "Idempotency check, state machine validation, dispatch"),
        ArchitectureComponent(name: "Database Engine", tech: "MySQL / PostgreSQL", role: "Menu catalog, order persistence & timestamp logging"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "Idempotency Keys on POST /orders",
          rationale: "In fast-paced restaurant environments, repeated taps or network retries must never submit double orders. Idempotency tokens store request hashes for instant safe de-duplication.",
        ),
        EngineeringDecision(
          decision: "Channel Segmentation by Station",
          rationale: "Rather than broadcasting every item to every kitchen screen, orders are parsed and routed by station tag (e.g. fryer vs grill vs cold prep) to minimize kitchen confusion.",
        ),
        EngineeringDecision(
          decision: "Optimistic UI Updates with Revert Fallback",
          rationale: "Kitchen staff tapping 'Complete' experience instant feedback on screen; in the rare event of backend sync failure, the ticket state is restored with a clear warning alert.",
        ),
      ],
      securityAndTesting: [
        "Concurrent request testing simulating 100 simultaneous order checkouts to verify transaction isolation.",
        "Validation of WebSocket connection drops and client auto-rejoin state recovery.",
        "Role-scoped access ensuring dining kiosks cannot query kitchen administrative metrics.",
      ],
      verifiedImpact: [
        "Sub-second KOT propagation from customer tap to kitchen display.",
        "Zero duplicate ticket generation during simulated peak network retry conditions.",
        "Clear operational visibility across preparation queues.",
      ],
      status: "Production Deployed & Tested",
      tags: ["FastAPI", "WebSockets", "MySQL", "Flutter", "State Machine", "Idempotency"],
    ),
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      company: "SPI Equipments India Private Limited",
      role: "Software Engineer — Backend & Full-Stack",
      location: "India",
      period: "Approx. 3 Years (Verified Timeline)",
      employmentType: "Full-time",
      description:
          "Primary engineer responsible for designing, building, and maintaining core backend services, real-time communication systems, and cross-platform applications powering company manufacturing, service management, and operational workflows.",
      contributions: [
        "Architected and deployed asynchronous microservices using FastAPI and Python 3.11+, reducing average endpoint response latency by 42% (<14ms P99) while sustaining high concurrent enterprise traffic.",
        "Designed and implemented real-time bidirectional WebSocket event pipelines with heartbeat tracking, delivering instant job alerts to 50+ field service technicians with sub-second propagation.",
        "Developed cross-platform mobile and tablet client applications using Flutter, Dart, and Provider state management, increasing technician daily inspection throughput by 35%.",
        "Modeled and optimized relational database schemas in PostgreSQL and MySQL with composite B-tree indexing and connection pooling, cutting query execution scan time by 60%.",
        "Enforced security and reliability standards including Role-Based Access Control (RBAC), JWT token lifecycle management, and idempotency keys to eliminate duplicate write submissions.",
        "Containerized services with Docker & Docker Compose, established automated CI/CD via GitHub Actions, and authored Pytest test suites achieving 85%+ code coverage.",
      ],
    ),
  ];

  static const Map<String, List<SkillItem>> competencies = {
    'backend': [
      SkillItem(name: "Python", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "FastAPI", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Django", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "REST API Development", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Async Programming (Async/Await)", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "WebSockets", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Auth & AuthZ (JWT, OAuth 2.0)", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "API Integration", level: "Core Production", years: "3 yrs"),
    ],
    'database': [
      SkillItem(name: "PostgreSQL", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "MySQL", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "SQLite", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "SQLAlchemy", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Database Design & Optimization", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Database Migrations", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Redis", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Query Optimization & Indexing", level: "Core Production", years: "2+ yrs"),
    ],
    'aiGenAi': [
      SkillItem(name: "LLM Integration", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "Generative AI App Dev", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "Prompt Engineering", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "Embeddings & Semantic Search", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "RAG (Retrieval-Augmented Gen)", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "Vector Search (pgvector)", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "AI Tool Calling & Automation", level: "Core Specialization", years: "1+ yr"),
      SkillItem(name: "AI Evaluation & Guardrails", level: "Core Specialization", years: "1+ yr"),
    ],
    'cloudDevops': [
      SkillItem(name: "Docker", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Docker Compose", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Linux", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "AWS", level: "Applied / Cloud", years: "1+ yr"),
      SkillItem(name: "Git & GitHub", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "GitHub Actions (CI/CD)", level: "Core Production", years: "1+ yr"),
      SkillItem(name: "Nginx", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Deployment & Monitoring", level: "Core Production", years: "2+ yrs"),
    ],
    'testingQuality': [
      SkillItem(name: "pytest", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Unit & Integration Testing", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "API Testing", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Debugging & Logging", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Error Handling", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Secure API Development", level: "Core Production", years: "2+ yrs"),
    ],
    'frontendApp': [
      SkillItem(name: "Flutter", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Dart", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Provider State Management", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Responsive UI Development", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "API Integration (Client)", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "WebSocket Integration (Client)", level: "Core Production", years: "2+ yrs"),
    ],
    'softwareEng': [
      SkillItem(name: "Object-Oriented Programming (OOP)", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Data Structures & Algorithms", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Clean Code & Design Principles", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "System Design Fundamentals", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Performance Optimization", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Agile Development", level: "Core Production", years: "2+ yrs"),
    ],
  };

  static const List<EngineeringPrinciple> engineeringPrinciples = [
    EngineeringPrinciple(
      title: "Predictable API Contracts",
      subtitle: "Strict Schemas & Automated Documentation",
      description:
          "Every endpoint must enforce strict request and response schemas via Pydantic v2 models. Eliminates runtime type errors, guarantees consistent HTTP error envelopes, and delivers self-documenting OpenAPI specs.",
    ),
    EngineeringPrinciple(
      title: "Asynchronous Non-Blocking I/O",
      subtitle: "Maximizing Server Throughput with ASGI",
      description:
          "Network-bound calls (database queries, external APIs, WebSocket pushes) utilize Python's async/await syntax to free thread workers, allowing high concurrency under heavy traffic loads.",
    ),
    EngineeringPrinciple(
      title: "Idempotency & Concurrency Safety",
      subtitle: "Zero Double Submissions Under Network Retries",
      description:
          "Critical write endpoints (e.g. order submission, ticket status progression) employ client-side idempotency keys and transactional database locks to safeguard against duplicate state changes.",
    ),
    EngineeringPrinciple(
      title: "Data Integrity Over Convenience",
      subtitle: "Normalized Relational Schemas & Foreign Constraints",
      description:
          "Business operations require unyielding auditability. Prefer explicit relational models with database-level cascade rules, composite indexes, and connection pools over loose unconstrained data stores.",
    ),
    EngineeringPrinciple(
      title: "Automated Test Coverage as Quality Guard",
      subtitle: "Unit & Integration Verification with Pytest",
      description:
          "Tests are written against live service interfaces and test database instances. Fixtures and mocked services ensure edge cases, authorization failures, and race conditions are caught before production.",
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      degree: "Bachelor of Engineering (B.E.) in Mechanical Engineering",
      institution: "Adhiyamaan College",
      location: "Tamil Nadu, India",
      duration: "2015 – 2019",
      grade: "GPA: 8.01 / 10",
      description:
          "Strong foundation in engineering mathematics, analytical problem-solving, kinematics, and structured systems analysis that accelerated transition into software engineering and computational architectures.",
    ),
  ];

  static const List<CertificationItem> certifications = [
    CertificationItem(
      title: "Python Full Stack Developer",
      issuer: "PUMO TECHNOVATION",
      year: "2023",
      skills: ["Python", "FastAPI / Django", "Full Stack Web Development", "Databases", "REST APIs"],
    ),
  ];
}
