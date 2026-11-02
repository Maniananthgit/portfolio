import React from 'react';
import { portfolioData } from '../data/portfolioData';
import { User, GraduationCap, Award, MapPin, CheckCircle2 } from 'lucide-react';

export const AboutEducation = () => {
  const { education, certifications } = portfolioData;

  return (
    <section id="about" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <User size={14} />
            <span>Profile & Background</span>
          </div>
          <h2 className="section-title">
            About & Education
          </h2>
          <p className="section-subtitle">
            Rigorous engineering background combined with specialized full-stack and backend software development credentials.
          </p>
        </div>

        {/* Content Grid */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))',
          gap: '2rem'
        }}>
          
          {/* Engineering Background & Mindset */}
          <div 
            className="card-surface reveal-on-scroll stagger-1"
            style={{
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              background: 'linear-gradient(145deg, #161b26 0%, #11141c 100%)'
            }}
          >
            <div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '1.25rem' }}>
                <div style={{
                  width: '38px',
                  height: '38px',
                  borderRadius: 'var(--radius-md)',
                  backgroundColor: 'rgba(45, 212, 191, 0.1)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  color: 'var(--accent-primary)'
                }}>
                  <User size={18} />
                </div>
                <h3 style={{ fontSize: '1.3rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                  Professional Profile
                </h3>
              </div>

              <p style={{ color: 'var(--text-secondary)', fontSize: '0.95rem', lineHeight: 1.7, marginBottom: '1.25rem' }}>
                I am a backend-oriented Software Engineer based in <strong>Coimbatore, Tamil Nadu, India</strong>. Over approximately 3 years at <strong>SPI Equipments India</strong>, I have spearheaded the design and development of production-grade microservices and real-time operational applications using <strong>Python, FastAPI, WebSockets, PostgreSQL, and Flutter</strong>.
              </p>

              <p style={{ color: 'var(--text-secondary)', fontSize: '0.95rem', lineHeight: 1.7, marginBottom: '1.5rem' }}>
                My engineering transition from Mechanical Engineering into Computational Software Engineering provides a strong mathematical, structural, and systems-level foundation. I prioritize clean code architecture, deterministic database transactions, and high-concurrency non-blocking I/O over quick ephemeral hacks.
              </p>

              {/* Verified Attributes */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: '0.65rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', fontSize: '0.875rem', color: 'var(--text-primary)' }}>
                  <CheckCircle2 size={16} color="var(--accent-primary)" />
                  <span>Analytical systems & performance optimization mindset</span>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', fontSize: '0.875rem', color: 'var(--text-primary)' }}>
                  <CheckCircle2 size={16} color="var(--accent-primary)" />
                  <span>Full-lifecycle ownership: API, Database, Client, Deployment</span>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', fontSize: '0.875rem', color: 'var(--text-primary)' }}>
                  <CheckCircle2 size={16} color="var(--accent-primary)" />
                  <span>Committed to automated test suites with Pytest</span>
                </div>
              </div>
            </div>

            <div style={{
              marginTop: '1.75rem',
              paddingTop: '1rem',
              borderTop: '1px solid var(--border-subtle)',
              display: 'flex',
              alignItems: 'center',
              gap: '0.5rem',
              fontSize: '0.825rem',
              color: 'var(--text-muted)'
            }}>
              <MapPin size={14} />
              <span>Location: Coimbatore, Tamil Nadu, India (Open to Remote / Relocation)</span>
            </div>
          </div>

          {/* Education & Official Certification */}
          <div className="reveal-on-scroll stagger-2" style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
            
            {/* Degree Card */}
            {education.map((edu, idx) => (
              <div 
                key={idx}
                className="card-surface"
                style={{
                  padding: '1.75rem',
                  background: 'linear-gradient(145deg, #151922 0%, #10131b 100%)'
                }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '1rem' }}>
                  <div style={{
                    width: '36px',
                    height: '36px',
                    borderRadius: 'var(--radius-md)',
                    backgroundColor: 'rgba(56, 189, 248, 0.1)',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: 'var(--accent-sky)'
                  }}>
                    <GraduationCap size={18} />
                  </div>
                  <div>
                    <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.72rem', color: 'var(--accent-sky)' }}>
                      ACADEMIC DEGREE
                    </span>
                    <h4 style={{ fontSize: '1.1rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                      {edu.institution}
                    </h4>
                  </div>
                </div>

                <div style={{ fontWeight: 600, fontSize: '0.95rem', color: 'var(--text-primary)', marginBottom: '0.25rem' }}>
                  {edu.degree}
                </div>
                <div style={{ display: 'flex', gap: '1rem', fontSize: '0.8rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.75rem' }}>
                  <span>{edu.duration}</span>
                  <span>&bull;</span>
                  <span style={{ color: 'var(--accent-primary)', fontWeight: 600 }}>{edu.grade}</span>
                </div>

                <p style={{ fontSize: '0.85rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                  {edu.description}
                </p>
              </div>
            ))}

            {/* Certification Card */}
            {certifications.map((cert, idx) => (
              <div 
                key={idx}
                className="card-surface"
                style={{
                  padding: '1.75rem',
                  background: 'linear-gradient(145deg, #151922 0%, #10131b 100%)',
                  borderLeft: '4px solid var(--accent-light)'
                }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '0.85rem' }}>
                  <div style={{
                    width: '36px',
                    height: '36px',
                    borderRadius: 'var(--radius-md)',
                    backgroundColor: 'rgba(45, 212, 191, 0.1)',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: 'var(--accent-primary)'
                  }}>
                    <Award size={18} />
                  </div>
                  <div>
                    <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.72rem', color: 'var(--accent-light)' }}>
                      VERIFIED PROFESSIONAL CERTIFICATION
                    </span>
                    <h4 style={{ fontSize: '1.1rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                      {cert.issuer} ({cert.year})
                    </h4>
                  </div>
                </div>

                <div style={{ fontWeight: 700, fontSize: '1rem', color: 'var(--accent-primary)', marginBottom: '0.75rem' }}>
                  {cert.title}
                </div>

                <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.4rem' }}>
                  {cert.skills.map((skill, sIdx) => (
                    <span key={sIdx} className="tech-tag">{skill}</span>
                  ))}
                </div>
              </div>
            ))}

          </div>

        </div>

      </div>
    </section>
  );
};
