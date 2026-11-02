import React from 'react';
import { portfolioData } from '../data/portfolioData';
import { Printer, X, ArrowLeft } from 'lucide-react';

export const AtsResumeModal = ({ onClose }) => {
  const { personal, experience, projects, education, certifications } = portfolioData;

  const handlePrint = () => {
    window.print();
  };

  return (
    <div 
      style={{
        position: 'fixed',
        inset: 0,
        backgroundColor: 'rgba(5, 7, 10, 0.92)',
        backdropFilter: 'blur(12px)',
        zIndex: 200,
        overflowY: 'auto',
        padding: '2rem 1rem'
      }}
      className="ats-modal-wrapper"
    >
      <div 
        style={{
          maxWidth: '850px',
          margin: '0 auto',
          position: 'relative'
        }}
      >
        {/* Floating Top Control Bar (Hidden during print) */}
        <div 
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            padding: '1rem 1.5rem',
            backgroundColor: '#161b26',
            border: '1px solid rgba(255, 255, 255, 0.12)',
            borderRadius: 'var(--radius-lg)',
            marginBottom: '1.5rem',
            boxShadow: '0 10px 30px rgba(0, 0, 0, 0.5)'
          }}
          className="no-print"
        >
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
            <button
              onClick={onClose}
              className="btn btn-sm btn-secondary"
              style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}
            >
              <ArrowLeft size={15} />
              <span>Back to Portfolio</span>
            </button>
            <span style={{ fontSize: '0.85rem', color: 'var(--accent-primary)', fontFamily: 'var(--font-mono)' }}>
              ATS-Standard Single-Column Format
            </span>
          </div>

          <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
            <button
              onClick={handlePrint}
              className="btn btn-sm btn-primary"
              id="print-resume-btn"
            >
              <Printer size={15} />
              <span>Print / Save as PDF</span>
            </button>
            
            <button
              onClick={onClose}
              style={{
                padding: '0.45rem',
                borderRadius: 'var(--radius-sm)',
                backgroundColor: 'rgba(255, 255, 255, 0.05)',
                color: 'var(--text-secondary)',
                border: '1px solid var(--border-subtle)',
                cursor: 'pointer'
              }}
              aria-label="Close résumé preview"
            >
              <X size={18} />
            </button>
          </div>
        </div>

        {/* =========================================================================
            PURE ATS-OPTIMIZED DOCUMENT BODY
            High contrast, semantic headings, single-column, 100% selectable text
            ========================================================================= */}
        <div 
          style={{
            backgroundColor: '#ffffff',
            color: '#111827',
            padding: '3rem 3.5rem',
            borderRadius: 'var(--radius-md)',
            boxShadow: '0 15px 45px rgba(0, 0, 0, 0.7)',
            fontFamily: 'Arial, Helvetica, sans-serif',
            lineHeight: 1.45,
            fontSize: '10.5pt'
          }}
          id="ats-resume-document"
          className="ats-document"
        >
          {/* Header Block */}
          <div style={{ textAlign: 'center', borderBottom: '2px solid #1f2937', paddingBottom: '1rem', marginBottom: '1.25rem' }}>
            <h1 style={{ fontSize: '22pt', fontWeight: 'bold', color: '#111827', margin: '0 0 4px', textTransform: 'uppercase', letterSpacing: '0.5px' }}>
              {personal.name}
            </h1>
            <div style={{ fontSize: '11.5pt', fontWeight: 'bold', color: '#2563eb', marginBottom: '8px' }}>
              Python Backend Engineer &bull; FastAPI Specialist &bull; Full-Stack Software Engineer
            </div>
            
            <div style={{ fontSize: '9pt', color: '#4b5563', display: 'flex', flexWrap: 'wrap', justifyContent: 'center', gap: '10px', marginTop: '6px' }}>
              <span>Location: {personal.location}</span>
              <span>&bull;</span>
              <span>Phone: <a href={`tel:${personal.phone}`} style={{ color: '#111827', textDecoration: 'none' }}>{personal.phone}</a></span>
              <span>&bull;</span>
              <span>Email: <a href={`mailto:${personal.email}`} style={{ color: '#111827', textDecoration: 'none' }}>{personal.email}</a></span>
              <span>&bull;</span>
              <span>LinkedIn: <a href={personal.linkedin} target="_blank" rel="noopener" style={{ color: '#2563eb' }}>linkedin.com/in/maniananth23</a></span>
              <span>&bull;</span>
              <span>GitHub: <a href={personal.github} target="_blank" rel="noopener" style={{ color: '#2563eb' }}>github.com/maniselmagi</a></span>
            </div>
          </div>

          {/* Section: Professional Summary */}
          <div style={{ marginBottom: '1.25rem' }}>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Professional Summary
            </h2>
            <p style={{ margin: 0, color: '#1f2937', textAlign: 'justify' }}>
              {personal.summary}
            </p>
          </div>

          {/* Section: Technical Skills Matrix */}
          <div style={{ marginBottom: '1.25rem' }}>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Technical Core Competencies
            </h2>
            <div style={{ display: 'flex', flexDirection: 'column', gap: '5px', fontSize: '9.5pt' }}>
              <div>
                <strong>Backend Development:</strong> Python, FastAPI, Django, REST API Development, Asynchronous Programming (Async/Await), WebSockets, Authentication & Authorization (JWT, OAuth 2.0), API Integration.
              </div>
              <div>
                <strong>Databases & Data Management:</strong> PostgreSQL, MySQL, SQLite, SQLAlchemy, Database Design & Optimization, Database Migrations, Redis, Query Optimization & Indexing.
              </div>
              <div>
                <strong>AI & Generative AI:</strong> Large Language Model (LLM) Integration, Generative AI Application Development, Prompt Engineering, Embeddings & Semantic Search, Retrieval-Augmented Generation (RAG), Vector Search (pgvector), AI Tool Calling & Workflow Automation, AI Evaluation & Guardrails.
              </div>
              <div>
                <strong>Cloud & DevOps:</strong> Docker, Docker Compose, Linux, AWS, Git & GitHub, GitHub Actions (CI/CD), Nginx, Application Deployment & Monitoring.
              </div>
              <div>
                <strong>Testing & Software Quality:</strong> pytest, Unit & Integration Testing, API Testing, Debugging & Logging, Error Handling, Secure API Development.
              </div>
              <div>
                <strong>Frontend & Application Development:</strong> Flutter, Dart, Provider State Management, Responsive UI Development, API Integration, WebSocket Integration.
              </div>
              <div>
                <strong>Software Engineering:</strong> Object-Oriented Programming (OOP), Data Structures & Algorithms, Clean Code & Design Principles, System Design Fundamentals, Performance Optimization, Agile Development.
              </div>
            </div>
          </div>

          {/* Section: Professional Experience */}
          <div style={{ marginBottom: '1.25rem' }}>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Professional Experience
            </h2>

            {experience.map((exp, idx) => (
              <div key={idx} style={{ marginBottom: '1rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <div style={{ fontSize: '11pt', fontWeight: 'bold', color: '#111827' }}>
                    {exp.role}
                  </div>
                  <div style={{ fontSize: '10pt', fontWeight: 'bold', color: '#374151' }}>
                    {exp.period}
                  </div>
                </div>

                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', fontStyle: 'italic', color: '#4b5563', marginBottom: '6px' }}>
                  <div>{exp.company}</div>
                  <div>{exp.location}</div>
                </div>

                <ul style={{ margin: '4px 0 0 18px', padding: 0, color: '#1f2937', display: 'flex', flexDirection: 'column', gap: '4px' }}>
                  {exp.contributions.map((bullet, bIdx) => (
                    <li key={bIdx}>{bullet}</li>
                  ))}
                </ul>
              </div>
            ))}
          </div>

          {/* Section: Featured Projects */}
          <div style={{ marginBottom: '1.25rem' }}>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Key Production Projects
            </h2>

            {projects.map((proj, idx) => (
              <div key={idx} style={{ marginBottom: '0.85rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <div style={{ fontSize: '10.5pt', fontWeight: 'bold', color: '#111827' }}>
                    {proj.title}
                  </div>
                  <div style={{ fontSize: '9.5pt', color: '#4b5563', fontStyle: 'italic' }}>
                    {proj.backend} | {proj.client}
                  </div>
                </div>

                <p style={{ margin: '3px 0 4px', color: '#374151', fontSize: '10pt' }}>
                  {proj.summary}
                </p>

                <ul style={{ margin: '2px 0 0 18px', padding: 0, color: '#1f2937', fontSize: '9.5pt' }}>
                  {proj.keyFeatures.slice(0, 3).map((feat, fIdx) => (
                    <li key={fIdx}>
                      <strong>{feat.name}:</strong> {feat.desc}
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>

          {/* Section: Education */}
          <div style={{ marginBottom: '1.25rem' }}>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Education
            </h2>

            {education.map((edu, idx) => (
              <div key={idx}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                  <div style={{ fontSize: '10.5pt', fontWeight: 'bold', color: '#111827' }}>
                    {edu.degree}
                  </div>
                  <div style={{ fontSize: '10pt', color: '#374151', fontWeight: 'bold' }}>
                    {edu.duration}
                  </div>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between', color: '#4b5563', fontSize: '9.5pt', fontStyle: 'italic' }}>
                  <div>{edu.institution}, {edu.location}</div>
                  <div style={{ fontWeight: 'bold', color: '#111827' }}>{edu.grade}</div>
                </div>
              </div>
            ))}
          </div>

          {/* Section: Certifications */}
          <div>
            <h2 style={{ fontSize: '12pt', fontWeight: 'bold', textTransform: 'uppercase', borderBottom: '1px solid #9ca3af', paddingBottom: '3px', marginBottom: '6px', color: '#111827' }}>
              Certifications & Professional Training
            </h2>

            {certifications.map((cert, idx) => (
              <div key={idx} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
                <div>
                  <strong>{cert.title}</strong> &bull; {cert.issuer}
                </div>
                <div style={{ fontSize: '9.5pt', color: '#4b5563' }}>
                  {cert.year}
                </div>
              </div>
            ))}
          </div>

        </div>

        {/* Bottom Helper Bar */}
        <div 
          style={{
            marginTop: '1.5rem',
            textAlign: 'center',
            color: 'var(--text-muted)',
            fontSize: '0.8rem',
            fontFamily: 'var(--font-mono)'
          }}
          className="no-print"
        >
          Click "Print / Save as PDF" &bull; In the print dialog, select "Save as PDF" to generate an ATS-compatible PDF file.
        </div>

      </div>

      <style>{`
        @media print {
          .ats-modal-wrapper {
            position: static !important;
            padding: 0 !important;
            background: transparent !important;
            backdrop-filter: none !important;
            overflow: visible !important;
          }
          .ats-document {
            box-shadow: none !important;
            padding: 0 !important;
            margin: 0 !important;
            width: 100% !important;
            max-width: 100% !important;
          }
          .no-print {
            display: none !important;
          }
        }
      `}</style>
    </div>
  );
};
