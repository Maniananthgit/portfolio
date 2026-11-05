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
  final String resumePdfUrl;

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
    this.resumePdfUrl = "Maniananth_M_Resume.pdf",
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
    role: "Software Developer | Python Backend & Flutter Applications",
    targetRoles: [
      "Software Developer (Python & Flutter)",
      "Python Backend Engineer",
      "Flutter Application Developer",
      "Full-Stack Software Engineer",
    ],
    experienceSummary: "3 Years of Combined Experience in Software Development & Manufacturing",
    location: "Coimbatore, Tamil Nadu, India",
    email: "maniananth93@gmail.com",
    phone: "+91 9787245016",
    linkedin: "https://www.linkedin.com/in/maniananth23",
    github: "https://github.com/Maniananthgit",
    status: "Software Developer, R&D at SPI Equipments India Pvt. Ltd. | Open to Backend & Flutter Roles",
    resumePdfUrl: "Maniananth_M_Resume.pdf",
    summary:
        "Software Developer with 3 years of combined experience across software development and manufacturing, focused on Python backend development and cross-platform Flutter applications. Skilled in FastAPI REST APIs (with working knowledge of Django and Flask), PostgreSQL, MySQL, Redis, JWT/RBAC security, and real-time systems using WebSockets and MQTT. Experienced with Docker, Linux, Nginx, and CI/CD; familiar with Celery, Pytest, and microservices architecture.",
  );

  static const List<MetricItem> metrics = [
    MetricItem(label: "Combined Experience", value: "3 Years", detail: "Software Development & Manufacturing"),
    MetricItem(label: "Current R&D Role", value: "2024 – Present", detail: "SPI Equipments India Pvt. Ltd."),
    MetricItem(label: "Core Stack", value: "Python & Flutter", detail: "FastAPI, WebSockets, RS-232 Serial & SQL"),
    MetricItem(label: "Key Production Apps", value: "4 Projects", detail: "SCADA HMI, QC Metrology, Service App & KDS"),
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
      id: "service-software",
      title: "Service Software — After-Sales & Service Management Application",
      subtitle: "Cross-Platform Enterprise Dispatch & Equipment Maintenance System",
      client: "Flutter, Dart, Provider, GoRouter",
      backend: "FastAPI, Python, WebSockets, Firebase Cloud Messaging",
      database: "MySQL",
      deployment: "Docker Containers, Nginx Reverse Proxy",
      summary:
          "Developed a cross-platform service-management application supporting Admin, Service Engineer, Customer, and Accounts workflows with real-time push dispatch.",
      challenge:
          "After-sales equipment servicing across distributed customer plants suffered from fragmented coordination, unverified service logs, and delayed technician dispatch alerts.",
      solution:
          "Built FastAPI endpoints with JWT authentication and role-based access control (RBAC); implemented real-time updates using WebSockets and Firebase Cloud Messaging, supported by Docker and Nginx reverse proxy.",
      keyFeatures: [
        ProjectFeature(
          name: "Role-Based Multi-Workflow Architecture",
          desc: "Dedicated operational flows for Admin, Service Engineer, Customer, and Accounts roles with secure JWT privileges.",
        ),
        ProjectFeature(
          name: "Real-Time WebSocket & FCM Alerts",
          desc: "Instant service ticket alerts and status sync using WebSockets and Firebase Cloud Messaging (FCM).",
        ),
        ProjectFeature(
          name: "Structured MySQL Relational Schema",
          desc: "Complete service history, customer equipment warranty logs, part replacements, and digital inspection audit trails.",
        ),
        ProjectFeature(
          name: "Docker & Nginx Cloud Deployment",
          desc: "Containerized backend deployment with Nginx reverse-proxy routing and SSL termination.",
        ),
      ],
      architecturePattern: "Layered Clean Architecture (Presentation -> Service Layer -> Repository Layer -> MySQL)",
      architectureComponents: [
        ArchitectureComponent(name: "Client Layer", tech: "Flutter (Android, iOS, Web) + Provider + GoRouter", role: "Cross-platform multi-role business workflows"),
        ArchitectureComponent(name: "API & Event Gateway", tech: "FastAPI & WebSockets", role: "REST endpoints, JWT auth & real-time dispatch"),
        ArchitectureComponent(name: "Push Messaging", tech: "Firebase Cloud Messaging (FCM)", role: "Background mobile notifications to field engineers"),
        ArchitectureComponent(name: "Persistence & Proxy", tech: "MySQL, Docker, Nginx", role: "Relational data models & reverse-proxy routing"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "Flutter with GoRouter & Provider",
          rationale: "GoRouter enables declarative deep-linking and state-driven routing across distinct Admin, Engineer, and Customer viewports while Provider ensures predictable, performant state management.",
        ),
        EngineeringDecision(
          decision: "WebSockets + FCM Hybrid Notification",
          rationale: "Active applications receive sub-second live updates via WebSockets; backgrounded or closed mobile apps receive critical dispatch alerts via Firebase Cloud Messaging.",
        ),
        EngineeringDecision(
          decision: "FastAPI with JWT RBAC",
          rationale: "Lightweight, high-throughput asynchronous request lifecycle with strict role-based permission scopes enforcing security across customer and internal enterprise tiers.",
        ),
      ],
      securityAndTesting: [
        "JWT bearer token validation with role-scoped authorization checks on every endpoint.",
        "Input sanitation and validation contracts through Pydantic v2 schemas.",
        "Automated API testing covering authentication, ticket dispatch, and role boundaries.",
      ],
      verifiedImpact: [
        "Unifies Admin, Service Engineer, Customer, and Accounts under a single cross-platform platform.",
        "Eliminates dispatch communication delay via instant WebSocket & FCM push notifications.",
        "Provides 100% auditable history of service tickets and equipment maintenance.",
      ],
      status: "Production Deployed (Enterprise)",
      tags: ["Flutter", "Dart", "Provider", "GoRouter", "FastAPI", "Python", "MySQL", "WebSockets", "FCM", "Docker", "Nginx"],
    ),
    ProjectItem(
      id: "colorchef-v4",
      title: "ColorChef V4 — Industrial Dye Dispensing SCADA",
      subtitle: "Automated Multi-Axis Textile Dye & Chemical Dispensing HMI",
      client: "Flutter Desktop (Windows), Dart, MVVM",
      backend: "RS-232 Serial Protocol, Background Dart Isolates (Multithreading)",
      database: "SQLite (Offline-First), Hive",
      deployment: "Industrial Touchscreen HMI Panel / PC",
      summary:
          "Developed an industrial desktop HMI/SCADA application for automated textile dye and chemical dispensing, controlling multi-axis (X/Y/Z) mechanical positions and 24-beaker batch scheduling.",
      challenge:
          "Textile dye laboratories require continuous, sub-second RS-232 weighing scale telemetry and precise multi-axis positioning without causing UI lag or jitter during robotic dispensing cycles.",
      solution:
          "Integrated continuous RS-232 industrial weighing scale telemetry using background Dart Isolates for zero-latency dosing precision, storing batch history in an offline SQLite database with PDF/Excel reporting.",
      keyFeatures: [
        ProjectFeature(
          name: "Multi-Axis (X/Y/Z) Mechanical Motion Control",
          desc: "Precise robotic coordinate positioning and automated 24-beaker batch scheduling algorithms.",
        ),
        ProjectFeature(
          name: "Background Dart Isolates Multithreading",
          desc: "Offloaded continuous RS-232 serial polling to separate OS threads, guaranteeing zero UI frame drops.",
        ),
        ProjectFeature(
          name: "Sub-Milligram Weighing Precision",
          desc: "High-frequency RS-232 telemetry processing with dynamic tare calibration and exact dispensing cutoff thresholds.",
        ),
        ProjectFeature(
          name: "Offline SQLite Database & Reporting",
          desc: "Local persistence of every dispensing cycle with automated PDF quality certificates and Excel export.",
        ),
      ],
      architecturePattern: "MVVM Architecture with Isolate-Driven Hardware Communication Layer",
      architectureComponents: [
        ArchitectureComponent(name: "HMI Presentation", tech: "Flutter Desktop (Windows)", role: "Touchscreen operator interface, live animations & queue"),
        ArchitectureComponent(name: "Telemetry Engine", tech: "Background Dart Isolates", role: "Continuous RS-232 serial polling & checksum verification"),
        ArchitectureComponent(name: "Robotic Controller", tech: "Multi-Axis (X/Y/Z) Drivers", role: "24-beaker motion positioning & chemical valve actuation"),
        ArchitectureComponent(name: "Persistence & Audit", tech: "SQLite, Hive, PDF Generation", role: "Offline recipe storage, batch logs & certified reports"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "Dart Isolates for Serial Telemetry",
          rationale: "Continuous high-baud-rate serial communication on the main thread would freeze the 60fps UI; dedicated background Isolates isolate hardware I/O completely.",
        ),
        EngineeringDecision(
          decision: "Offline SQLite & Hive Hybrid Storage",
          rationale: "Industrial floor machines must operate 24/7 without internet dependency. Hive provides microsecond recipe retrieval; SQLite stores relational batch logs.",
        ),
        EngineeringDecision(
          decision: "State-Driven Automated 24-Beaker Batch Scheduling",
          rationale: "Algorithmic job queuing optimizes motion paths between dyestuff canisters and beaker trays, minimizing dispensing cycle times.",
        ),
      ],
      securityAndTesting: [
        "CRC checksum validation on all inbound and outbound RS-232 serial data packets.",
        "Emergency halt protocols and hardware timeout detection with automatic valve shutdown.",
        "Stress tested across continuous 48-hour automated multi-beaker dispensing cycles.",
      ],
      verifiedImpact: [
        "Automated chemical & dye dispensing across 24-beaker batch schedules.",
        "Zero UI latency or jitter achieved via multi-threaded Dart Isolates.",
        "Accurate laboratory repeatability with certified PDF & Excel batch reports.",
      ],
      status: "Production Deployed (Industrial SCADA)",
      tags: ["Flutter Desktop", "Dart", "MVVM", "RS-232 Serial", "Multithreading", "Dart Isolates", "SQLite", "Hive", "SCADA"],
    ),
    ProjectItem(
      id: "yarn-qc-tester",
      title: "Yarn Quality Control & Lea Strength Tester",
      subtitle: "Industrial Textile Metrology & Tensile Analysis Station",
      client: "Flutter Desktop (Windows), Dart, MVVM, fl_chart",
      backend: "Dual RS-232 Serial Interfaces, SQLite FFI, PDF Generation",
      database: "SQLite FFI",
      deployment: "Laboratory Quality Control Station",
      summary:
          "Developed an industrial textile QC desktop application to measure yarn tensile breaking strength, automatically calculating Yarn Count (Ne), CSP, Standard Deviation, and CV%.",
      challenge:
          "Textile quality assurance technicians previously recorded machine gauge numbers manually and performed time-consuming manual formula calculations, creating transcription errors and audit bottlenecks.",
      solution:
          "Integrated dual RS-232 serial interfaces for digital precision scales and machine load controllers, generating real-time analytics graphs and certified laboratory PDF test reports.",
      keyFeatures: [
        ProjectFeature(
          name: "Dual RS-232 Serial Integration",
          desc: "Concurrent digital communication with precision analytical balances and motorized tensile load cell controllers.",
        ),
        ProjectFeature(
          name: "Automated Textile Statistical Calculations",
          desc: "Real-time algorithmic calculation of Yarn Count (Ne), Count-Strength Product (CSP), Standard Deviation, and Coefficient of Variation (CV%).",
        ),
        ProjectFeature(
          name: "Real-Time Tensile Curve Plotting",
          desc: "Interactive stress-strain breaking force visualization rendered dynamically via fl_chart.",
        ),
        ProjectFeature(
          name: "Certified Laboratory PDF Test Reports",
          desc: "Automated generation of standardized laboratory inspection certificates formatted for textile export compliance.",
        ),
      ],
      architecturePattern: "MVVM Architecture with Dual Hardware Interfacing Layer",
      architectureComponents: [
        ArchitectureComponent(name: "Operator Interface", tech: "Flutter Desktop & fl_chart", role: "Real-time tensile curve display & operator controls"),
        ArchitectureComponent(name: "Serial Communication", tech: "Dual RS-232 Ports (SerialPort)", role: "Concurrent scale weight & load cell breaking force capture"),
        ArchitectureComponent(name: "Statistical Engine", tech: "Dart Computational Engine", role: "Yarn Count (Ne), CSP, Mean, SD & CV% calculations"),
        ArchitectureComponent(name: "Test Audit Storage", tech: "SQLite FFI & PDF Generation", role: "Historical test runs & exportable laboratory certificates"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "Dual RS-232 Serial Architecture",
          rationale: "Enables single-step automated testing: the system reads the specimen weight from the balance and tensile breaking load from the tester simultaneously without manual operator data entry.",
        ),
        EngineeringDecision(
          decision: "SQLite FFI for High-Performance Desktop Persistence",
          rationale: "SQLite FFI executes native C binaries on Windows, delivering ultra-fast batch insertions for high-frequency tensile curve data points.",
        ),
        EngineeringDecision(
          decision: "fl_chart Dynamic Curve Rendering",
          rationale: "Smooth 60fps graph rendering of force vs elongation data points with interactive peak breaking force indicators.",
        ),
      ],
      securityAndTesting: [
        "Calibration verification protocols ensuring load cell and balance readings adhere to ISO textile testing standards.",
        "Automatic detection of serial port disconnects with graceful reconnection prompts.",
        "Validation of mathematical statistical models against certified benchmark metrology calculations.",
      ],
      verifiedImpact: [
        "100% elimination of manual operator transcription errors in yarn count and CSP calculations.",
        "Instant laboratory certification with export-ready PDF reports and historical trend tracking.",
        "Multi-port serial automation streamlining factory QC testing cycle time.",
      ],
      status: "Production Deployed (Textile Laboratory QC)",
      tags: ["Flutter Desktop", "Dart", "MVVM", "RS-232 Serial", "SQLite FFI", "fl_chart", "PDF Generation", "Industrial Metrology"],
    ),
    ProjectItem(
      id: "restaurant-kds",
      title: "Restaurant Self-Ordering Kiosk & Kitchen Display System",
      subtitle: "High-Concurrency Real-Time Hospitality Ordering Engine",
      client: "Customer Self-Ordering Kiosks & Kitchen Display Screens",
      backend: "Python, FastAPI, Redis, WebSockets",
      database: "PostgreSQL, Redis",
      deployment: "Docker Compose, Nginx Reverse Proxy",
      summary:
          "Designed a restaurant self-ordering workflow connecting customer kiosks with a kitchen display system featuring real-time WebSocket order updates, Redis caching, and containerized deployment.",
      challenge:
          "Rush-hour dining volume caused kitchen ticket bottlenecks, duplicate order submissions during network dropouts, and delays in kitchen preparation updates.",
      solution:
          "Designed FastAPI backend services and PostgreSQL data structures for menu, order, and kitchen workflows, with WebSocket-based real-time order updates and Redis in the architecture; prepared containerized deployment using Docker Compose and Nginx.",
      keyFeatures: [
        ProjectFeature(
          name: "Sub-Second Kitchen Order Dispatch",
          desc: "Orders placed on customer kiosks immediately appear on relevant kitchen station screens via segmented WebSocket channels.",
        ),
        ProjectFeature(
          name: "Redis State Caching & Event Pub/Sub",
          desc: "In-memory caching and channel segmentation by kitchen station (grill, fryer, cold prep) to minimize routing confusion.",
        ),
        ProjectFeature(
          name: "Idempotent Order Ingestion",
          desc: "Client-generated idempotency tokens and transactional database locks preventing duplicate orders during network glitches.",
        ),
        ProjectFeature(
          name: "Docker Compose & Nginx Deployment",
          desc: "Full containerized multi-container deployment with Nginx reverse-proxy routing and static asset caching.",
        ),
      ],
      architecturePattern: "Event-Driven Pub/Sub with State Machine Validation & Redis Caching",
      architectureComponents: [
        ArchitectureComponent(name: "Kiosk & Web Clients", tech: "Flutter / Responsive Web", role: "Menu browsing, cart management & order generation"),
        ArchitectureComponent(name: "Kitchen Displays", tech: "Dedicated KDS Screens", role: "Real-time ticket rendering & one-touch status advance"),
        ArchitectureComponent(name: "Order Core Service", tech: "FastAPI, Python, Redis", role: "Idempotency check, Redis caching, WebSocket dispatch"),
        ArchitectureComponent(name: "Database Engine", tech: "PostgreSQL, Docker, Nginx", role: "Transactional persistence, indexing & container routing"),
      ],
      engineeringDecisions: [
        EngineeringDecision(
          decision: "Redis for Real-Time State & Pub/Sub",
          rationale: "Redis accelerates active kitchen queue access with sub-millisecond retrieval while providing lightweight publish/subscribe channels for multi-screen sync.",
        ),
        EngineeringDecision(
          decision: "Idempotency Keys on Order Creation",
          rationale: "Prevents double billing and duplicate kitchen chits when customers tap repeatedly on kiosks during network retries.",
        ),
        EngineeringDecision(
          decision: "Docker Compose Multi-Container Orchestration",
          rationale: "Encapsulates FastAPI, PostgreSQL, Redis, and Nginx into predictable, repeatable containers easily deployable on local or cloud servers.",
        ),
      ],
      securityAndTesting: [
        "Concurrent request testing simulating peak order checkouts to verify transaction isolation.",
        "Validation of WebSocket connection drops and client auto-rejoin state recovery.",
        "Role-scoped access ensuring dining kiosks cannot query kitchen administrative metrics.",
      ],
      verifiedImpact: [
        "Sub-second KOT propagation from customer tap to kitchen display.",
        "Zero duplicate ticket generation during simulated peak network retry conditions.",
        "Clear operational visibility across preparation queues with Dockerized infrastructure.",
      ],
      status: "Production Architecture & Tested",
      tags: ["Python", "FastAPI", "PostgreSQL", "Redis", "WebSockets", "Docker Compose", "Nginx"],
    ),
  ];

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      company: "SPI Equipments India Pvt. Ltd.",
      role: "Software Developer, R&D",
      location: "Coimbatore, Tamil Nadu",
      period: "2024 – Present",
      employmentType: "Full-time (3 Yrs Combined Software & Manufacturing Exp)",
      description:
          "Core R&D developer responsible for engineering cross-platform business applications using Flutter, building high-concurrency Python & FastAPI backends, and developing industrial automation software.",
      contributions: [
        "Develop and maintain cross-platform business applications using Flutter and Dart.",
        "Build REST APIs and backend services using Python and FastAPI with PostgreSQL and MySQL databases.",
        "Implement JWT authentication and role-based access control; build real-time workflows using WebSockets and asynchronous programming.",
        "Containerize backend services with Docker and Docker Compose, and configure Nginx as a reverse proxy.",
        "Use Git, GitHub, and GitHub Actions to manage source code and support CI/CD workflows.",
      ],
    ),
  ];

  static const Map<String, List<SkillItem>> competencies = {
    'backend': [
      SkillItem(name: "Python", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "FastAPI", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Django", level: "Working Knowledge", years: "2 yrs"),
      SkillItem(name: "Flask", level: "Working Knowledge", years: "1+ yr"),
      SkillItem(name: "REST API Development", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Async Programming", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "SQLAlchemy & Pydantic", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Celery & Pytest", level: "Core Production", years: "2 yrs"),
    ],
    'database': [
      SkillItem(name: "PostgreSQL", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "MySQL", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Redis", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "SQLite / SQLite FFI", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Hive (NoSQL Key-Value)", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Database Design & Migrations", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Query Optimization & Indexing", level: "Core Production", years: "2+ yrs"),
    ],
    'architectureSecurity': [
      SkillItem(name: "Microservices Architecture", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "MVVM Architecture", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "System Design & DSA", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "JWT & OAuth 2.0", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Role-Based Access Control (RBAC)", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "RSA Encryption & Security", level: "Core Production", years: "1+ yr"),
      SkillItem(name: "WebSockets & MQTT", level: "Core Production", years: "2+ yrs"),
    ],
    'cloudDevops': [
      SkillItem(name: "Docker & Docker Compose", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "Linux (Ubuntu)", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Nginx Reverse Proxy", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Git & GitHub", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "GitHub Actions (CI/CD)", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "AWS & Hostinger VPS", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Postman API Automation", level: "Core Production", years: "3 yrs"),
    ],
    'frontendApp': [
      SkillItem(name: "Flutter & Dart", level: "Core Production", years: "3 yrs"),
      SkillItem(name: "Provider & GoRouter", level: "Core Production", years: "2+ yrs"),
      SkillItem(name: "RS-232 Serial Telemetry", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "Multithreading (Dart Isolates)", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "fl_chart Data Plotting", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "PDF & Excel Generation", level: "Core Production", years: "2 yrs"),
      SkillItem(name: "HTML & CSS", level: "Core Production", years: "3 yrs"),
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
