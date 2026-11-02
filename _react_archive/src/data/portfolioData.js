/**
 * Portfolio Data Store - Maniananth M
 * Centralized single source of truth for portfolio content.
 * Updated with official contact credentials and complete skills taxonomy.
 */

export const portfolioData = {
  personal: {
    name: "Maniananth M",
    initials: "MM",
    role: "Python Backend & Full-Stack Software Engineer",
    targetRoles: [
      "Python Backend Engineer",
      "FastAPI Developer",
      "Full-Stack Software Engineer"
    ],
    experienceSummary: "~3 Years of Commercial Software Engineering Experience",
    location: "Coimbatore, Tamil Nadu, India",
    email: "maniananth93@gmail.com",
    phone: "+91 9787245016",
    linkedin: "https://www.linkedin.com/in/maniananth23",
    github: "https://github.com/maniselmagi",
    status: "Actively interviewing for senior backend & full-stack roles",
    summary:
      "Software Engineer with experience in designing and developing cross-platform mobile applications, web applications, and backend systems using Flutter, FastAPI, and Python at SPI Equipments India. Strong focus on clean architecture, performance, and code quality. Extensive background building enterprise applications, RESTful APIs, and real-time systems using WebSockets. Experienced implementing secure authentication using JWT and RSA encryption, designing database-driven solutions with PostgreSQL, MySQL, and SQLite, and using Docker to simplify deployment and improve application scalability."
  },

  metrics: [
    { label: "Engineering Experience", value: "~3 Years", detail: "SPI Equipments India Private Limited" },
    { label: "Core Backend Stack", value: "FastAPI / Python", detail: "AsyncIO, REST APIs & WebSockets" },
    { label: "Database Specialization", value: "PostgreSQL & MySQL", detail: "Relational Schema, Indexing & ACID" },
    { label: "AI & Full-Stack", value: "LLMs / RAG & Flutter", detail: "Vector Search & Mobile Clients" }
  ],

  engineeringCapabilities: [
    {
      id: "async-apis",
      category: "Backend Architecture",
      title: "Asynchronous High-Throughput APIs",
      description:
        "Building non-blocking, ASGI-compliant RESTful web services using FastAPI, Django, Pydantic v2, and Python AsyncIO. Engineered for low-latency request lifecycles, structured error envelopes, and automated OpenAPI documentation.",
      tags: ["Python", "FastAPI", "Django", "Async/Await", "OAuth 2.0 / JWT", "Uvicorn"],
      highlight: "<25ms avg endpoint latency across critical workflows"
    },
    {
      id: "ai-genai",
      category: "AI & Vector Search",
      title: "Generative AI, RAG & Vector Workflows",
      description:
        "Integrating Large Language Models (LLMs), prompt engineering, embeddings, semantic search, and Retrieval-Augmented Generation (RAG) using pgvector and automated AI tool calling.",
      tags: ["LLM Integration", "RAG", "pgvector", "Embeddings", "Prompt Engineering", "AI Tool Calling"],
      highlight: "Contextual retrieval & semantic vector indexing"
    },
    {
      id: "realtime-websockets",
      category: "Event Streaming",
      title: "Real-Time WebSocket Pipelines",
      description:
        "Designing bidirectional state synchronization channels for live operational dashboards, kitchen display orders, and field dispatch tracking with client heartbeat monitoring and auto-reconnect backoff.",
      tags: ["WebSockets", "Pub/Sub", "ASGI Channels", "State Broadcast", "Provider"],
      highlight: "Sub-second event propagation without polling overhead"
    },
    {
      id: "database-engineering",
      category: "Data & Storage",
      title: "Relational Schema Design & Query Optimization",
      description:
        "Architecting normalized relational schemas, multi-table joins, composite indices, and transaction-safe operations in PostgreSQL, MySQL, and SQLite. Connection pooling and Redis caching for peak concurrent load.",
      tags: ["PostgreSQL", "MySQL", "SQLite", "SQLAlchemy", "Redis", "Migrations"],
      highlight: "Strict relational integrity & concurrency isolation"
    },
    {
      id: "mobile-frontend",
      category: "Full-Stack Clients",
      title: "Production Flutter & Dart Client Development",
      description:
        "Developing cross-platform mobile and tablet applications for field service engineers and restaurant staff with offline resilience, Provider state management, and real-time WebSocket sync.",
      tags: ["Flutter", "Dart", "Provider", "Responsive UI", "REST & WS Integration"],
      highlight: "Unified codebase supporting Android, iOS & Tablet Kiosks"
    },
    {
      id: "devops-testing",
      category: "Reliability & DevOps",
      title: "Docker, Cloud & Automated Testing",
      description:
        "Containerizing backend services with Docker & Compose, configuring Linux environments, automating CI/CD with GitHub Actions, deploying on AWS/Nginx, and testing rigorously via Pytest.",
      tags: ["Docker", "Docker Compose", "AWS", "Linux", "Pytest", "GitHub Actions", "Nginx"],
      highlight: "Repeatable container builds & reproducible test suites"
    }
  ],

  projects: [
    {
      id: "service-management",
      title: "Service Management Application",
      subtitle: "Enterprise Field Equipment Lifecycle & Dispatch System",
      client: "Flutter (Android/iOS/Tablet)",
      backend: "FastAPI, Python 3.11+, WebSockets",
      database: "PostgreSQL, SQLAlchemy",
      deployment: "Docker, Linux (Ubuntu)",
      summary:
        "A full-lifecycle industrial service management platform designed to automate ticket dispatching, field engineer job assignments, service checklists, and real-time maintenance audits for equipment operations.",
      challenge:
        "Legacy servicing workflows suffered from manual communication delays, untracked equipment histories, and lack of real-time visibility into technician dispatch status across distributed customer sites.",
      solution:
        "Engineered an asynchronous FastAPI backend paired with a responsive Flutter mobile/tablet interface. Implemented Role-Based Access Control (RBAC), live WebSocket status sync, and indexed relational models in PostgreSQL for audit logs.",
      keyFeatures: [
        {
          name: "Role-Based Access Control (RBAC)",
          desc: "Multi-tier authorization separating Admin, Service Manager, and Field Technician capabilities with JWT tokens and scoped permission gates."
        },
        {
          name: "Real-Time Ticket Dispatch Pipeline",
          desc: "FastAPI WebSocket endpoints delivering instant job alerts to field engineers upon assignment, bypassing polling latency."
        },
        {
          name: "Comprehensive Audit & Servicing Logs",
          desc: "Relational audit history capturing equipment serial numbers, engineer observations, part replacements, and customer sign-offs."
        },
        {
          name: "Optimized Relational Schema",
          desc: "PostgreSQL schema with foreign key constraints, connection pooling, and indexed composite queries for fast historical reporting."
        }
      ],
      architecture: {
        pattern: "Layered Clean Architecture (Presentation -> Service Layer -> Repository Layer -> PostgreSQL)",
        components: [
          { name: "Client Layer", tech: "Flutter Mobile / Tablet App", role: "UI, Provider State, Offline Cache" },
          { name: "API Gateway / ASGI", tech: "Uvicorn & Nginx", role: "Reverse proxy, SSL termination & rate limiting" },
          { name: "Core Backend Service", tech: "FastAPI & AsyncIO", role: "Business rules, RBAC verification, WebSocket hub" },
          { name: "Persistence Layer", tech: "PostgreSQL via SQLAlchemy", role: "Transactional storage, indexing, audit trail" }
        ]
      },
      engineeringDecisions: [
        {
          decision: "FastAPI over Django",
          rationale: "Selected FastAPI for native ASGI asynchronous capabilities, lightweight memory footprint, and high I/O throughput necessary for concurrent WebSocket connections and mobile sync."
        },
        {
          decision: "WebSockets vs Polling for Dispatch Alerts",
          rationale: "Periodic HTTP polling would create unnecessary server load and delayed push alerts. WebSockets provide immediate delivery with client heartbeat ping/pong to detect disconnects."
        },
        {
          decision: "PostgreSQL Relational Structure",
          rationale: "Strict foreign key constraints ensure that service tickets, technician assignments, and equipment serial numbers remain uncorrupted and auditable."
        }
      ],
      securityAndTesting: [
        "Pytest integration tests verifying RBAC token rejection and valid payload ingestion.",
        "Pydantic schema validation rejecting malformed payloads before database interaction.",
        "Environment-based configuration separating development, staging, and production secrets."
      ],
      verifiedImpact: [
        "Centralized servicing workflow for SPI Equipments operations.",
        "Eliminated manual phone calls for dispatch by providing instant live notifications.",
        "Complete historical service traceability for industrial equipment."
      ],
      status: "Production Deployed (Enterprise Internal)",
      demoUrl: null,
      repoUrl: null,
      isProprietary: true
    },
    {
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
        {
          name: "Sub-Second Kitchen Order Ticket (KOT) Dispatch",
          desc: "Orders created on customer kiosks immediately appear on relevant kitchen station screens via segmented WebSocket channels."
        },
        {
          name: "Idempotent Order Ingestion",
          desc: "Unique client-generated idempotency tokens prevent duplicate charges and duplicate tickets during unstable Wi-Fi retransmissions."
        },
        {
          name: "Multi-Stage Kitchen State Machine",
          desc: "Strict order state transitions (Queued -> In Progress -> Plated -> Collected) with timestamp tracking for kitchen metrics."
        },
        {
          name: "Offline Buffer & Auto-Reconnect",
          desc: "Client-side queuing retaining unsent orders if local connection flickers, synchronizing seamlessly upon WebSocket reconnect."
        }
      ],
      architecture: {
        pattern: "Event-Driven Pub/Sub with State Machine Validation",
        components: [
          { name: "Kiosk & Web Clients", tech: "Flutter / Responsive Web", role: "Menu browsing, cart management & order generation" },
          { name: "Kitchen Displays", tech: "Dedicated KDS Screens", role: "Real-time ticket rendering & one-touch status advance" },
          { name: "Order Core Service", tech: "FastAPI & Python", role: "Idempotency check, state machine validation, dispatch" },
          { name: "Database Engine", tech: "MySQL / PostgreSQL", role: "Menu catalog, order persistence & timestamp logging" }
        ]
      },
      engineeringDecisions: [
        {
          decision: "Idempotency Keys on POST /orders",
          rationale: "In fast-paced restaurant environments, repeated taps or network retries must never submit double orders. Idempotency tokens store request hashes for instant safe de-duplication."
        },
        {
          decision: "Channel Segmentation by Station",
          rationale: "Rather than broadcasting every item to every kitchen screen, orders are parsed and routed by station tag (e.g. fryer vs grill vs cold prep) to minimize kitchen confusion."
        },
        {
          decision: "Optimistic UI Updates with Revert Fallback",
          rationale: "Kitchen staff tapping 'Complete' experience instant feedback on screen; in the rare event of backend sync failure, the ticket state is restored with a clear warning alert."
        }
      ],
      securityAndTesting: [
        "Concurrent request testing simulating 100 simultaneous order checkouts to verify transaction isolation.",
        "Validation of WebSocket connection drops and client auto-rejoin state recovery.",
        "Role-scoped access ensuring dining kiosks cannot query kitchen administrative metrics."
      ],
      verifiedImpact: [
        "Sub-second KOT propagation from customer tap to kitchen display.",
        "Zero duplicate ticket generation during simulated peak network retry conditions.",
        "Clear operational visibility across preparation queues."
      ],
      status: "Production Deployed & Tested",
      demoUrl: null,
      repoUrl: null,
      isProprietary: true
    }
  ],

  experience: [
    {
      company: "SPI Equipments India Private Limited",
      role: "Software Engineer — Backend & Full-Stack",
      location: "India",
      period: "Approx. 3 Years (Verified Timeline)",
      employmentType: "Full-time",
      description:
        "Primary engineer responsible for designing, building, and maintaining core backend services, real-time communication systems, and cross-platform applications powering company manufacturing, service management, and operational workflows.",
      contributions: [
        "Architected scalable asynchronous RESTful APIs using Python and FastAPI, serving internal enterprise operations and client applications.",
        "Designed and implemented real-time WebSocket communication pipelines for instant service ticket dispatch and operational dashboards.",
        "Developed cross-platform mobile and tablet client interfaces using Flutter, Dart, and Provider state management.",
        "Modeled and optimized relational database schemas in PostgreSQL and MySQL with indexed queries, migrations, and ACID transaction safety.",
        "Containerized application components using Docker and Docker Compose for standardized environments across Linux servers.",
        "Conducted automated unit, API, and integration testing using Pytest, improving API reliability and eliminating regression bugs in production."
      ]
    }
  ],

  /**
   * Complete Technical Skills Taxonomy as officially provided
   */
  competencies: {
    backend: [
      { name: "Python", level: "Core Production", years: "3 yrs" },
      { name: "FastAPI", level: "Core Production", years: "3 yrs" },
      { name: "Django", level: "Core Production", years: "2+ yrs" },
      { name: "REST API Development", level: "Core Production", years: "3 yrs" },
      { name: "Async Programming (Async/Await)", level: "Core Production", years: "3 yrs" },
      { name: "WebSockets", level: "Core Production", years: "2+ yrs" },
      { name: "Auth & AuthZ (JWT, OAuth 2.0)", level: "Core Production", years: "2+ yrs" },
      { name: "API Integration", level: "Core Production", years: "3 yrs" }
    ],
    database: [
      { name: "PostgreSQL", level: "Core Production", years: "3 yrs" },
      { name: "MySQL", level: "Core Production", years: "2+ yrs" },
      { name: "SQLite", level: "Core Production", years: "2 yrs" },
      { name: "SQLAlchemy", level: "Core Production", years: "2+ yrs" },
      { name: "Database Design & Optimization", level: "Core Production", years: "3 yrs" },
      { name: "Database Migrations", level: "Core Production", years: "2+ yrs" },
      { name: "Redis", level: "Core Production", years: "2 yrs" },
      { name: "Query Optimization & Indexing", level: "Core Production", years: "2+ yrs" }
    ],
    aiGenAi: [
      { name: "LLM Integration", level: "Core Specialization", years: "1+ yr" },
      { name: "Generative AI App Dev", level: "Core Specialization", years: "1+ yr" },
      { name: "Prompt Engineering", level: "Core Specialization", years: "1+ yr" },
      { name: "Embeddings & Semantic Search", level: "Core Specialization", years: "1+ yr" },
      { name: "RAG (Retrieval-Augmented Gen)", level: "Core Specialization", years: "1+ yr" },
      { name: "Vector Search (pgvector)", level: "Core Specialization", years: "1+ yr" },
      { name: "AI Tool Calling & Automation", level: "Core Specialization", years: "1+ yr" },
      { name: "AI Evaluation & Guardrails", level: "Core Specialization", years: "1+ yr" }
    ],
    cloudDevops: [
      { name: "Docker", level: "Core Production", years: "2+ yrs" },
      { name: "Docker Compose", level: "Core Production", years: "2+ yrs" },
      { name: "Linux", level: "Core Production", years: "3 yrs" },
      { name: "AWS", level: "Applied / Cloud", years: "1+ yr" },
      { name: "Git & GitHub", level: "Core Production", years: "3 yrs" },
      { name: "GitHub Actions (CI/CD)", level: "Core Production", years: "1+ yr" },
      { name: "Nginx", level: "Core Production", years: "2 yrs" },
      { name: "Deployment & Monitoring", level: "Core Production", years: "2+ yrs" }
    ],
    testingQuality: [
      { name: "pytest", level: "Core Production", years: "2+ yrs" },
      { name: "Unit & Integration Testing", level: "Core Production", years: "2+ yrs" },
      { name: "API Testing", level: "Core Production", years: "3 yrs" },
      { name: "Debugging & Logging", level: "Core Production", years: "3 yrs" },
      { name: "Error Handling", level: "Core Production", years: "3 yrs" },
      { name: "Secure API Development", level: "Core Production", years: "2+ yrs" }
    ],
    frontendApp: [
      { name: "Flutter", level: "Core Production", years: "2+ yrs" },
      { name: "Dart", level: "Core Production", years: "2+ yrs" },
      { name: "Provider State Management", level: "Core Production", years: "2+ yrs" },
      { name: "Responsive UI Development", level: "Core Production", years: "2+ yrs" },
      { name: "API Integration (Client)", level: "Core Production", years: "2+ yrs" },
      { name: "WebSocket Integration (Client)", level: "Core Production", years: "2+ yrs" }
    ],
    softwareEng: [
      { name: "Object-Oriented Programming (OOP)", level: "Core Production", years: "3 yrs" },
      { name: "Data Structures & Algorithms", level: "Core Production", years: "3 yrs" },
      { name: "Clean Code & Design Principles", level: "Core Production", years: "3 yrs" },
      { name: "System Design Fundamentals", level: "Core Production", years: "2+ yrs" },
      { name: "Performance Optimization", level: "Core Production", years: "2+ yrs" },
      { name: "Agile Development", level: "Core Production", years: "2+ yrs" }
    ]
  },

  engineeringPrinciples: [
    {
      title: "Predictable API Contracts",
      subtitle: "Strict Schemas & Automated Documentation",
      description:
        "Every endpoint must enforce strict request and response schemas via Pydantic v2 models. Eliminates runtime type errors, guarantees consistent HTTP error envelopes, and delivers self-documenting OpenAPI specs."
    },
    {
      title: "Asynchronous Non-Blocking I/O",
      subtitle: "Maximizing Server Throughput with ASGI",
      description:
        "Network-bound calls (database queries, external APIs, WebSocket pushes) utilize Python's async/await syntax to free thread workers, allowing high concurrency under heavy traffic loads."
    },
    {
      title: "Idempotency & Concurrency Safety",
      subtitle: "Zero Double Submissions Under Network Retries",
      description:
        "Critical write endpoints (e.g. order submission, ticket status progression) employ client-side idempotency keys and transactional database locks to safeguard against duplicate state changes."
    },
    {
      title: "Data Integrity Over Convenience",
      subtitle: "Normalized Relational Schemas & Foreign Constraints",
      description:
        "Business operations require unyielding auditability. Prefer explicit relational models with database-level cascade rules, composite indexes, and connection pools over loose unconstrained data stores."
    },
    {
      title: "Automated Test Coverage as Quality Guard",
      subtitle: "Unit & Integration Verification with Pytest",
      description:
        "Tests are written against live service interfaces and test database instances. Fixtures and mocked services ensure edge cases, authorization failures, and race conditions are caught before production."
    }
  ],

  education: [
    {
      degree: "Bachelor of Engineering (B.E.) in Mechanical Engineering",
      institution: "Adhiyamaan College",
      location: "Tamil Nadu, India",
      duration: "2015 – 2019",
      grade: "GPA: 8.01 / 10",
      description:
        "Strong foundation in engineering mathematics, analytical problem-solving, kinematics, and structured systems analysis that accelerated transition into software engineering and computational architectures."
    }
  ],

  certifications: [
    {
      title: "Python Full Stack Developer",
      issuer: "PUMO TECHNOVATION",
      year: "2023",
      skills: ["Python", "FastAPI / Django", "Full Stack Web Development", "Databases", "REST APIs"]
    }
  ]
};
