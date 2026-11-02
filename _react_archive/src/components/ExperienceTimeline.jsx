import React from 'react';
import { portfolioData } from '../data/portfolioData';
import { Briefcase, Calendar, MapPin, CheckCircle2, Building, ShieldCheck } from 'lucide-react';

export const ExperienceTimeline = () => {
  const { experience } = portfolioData;

  return (
    <section id="experience" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <Briefcase size={14} />
            <span>Professional Experience</span>
          </div>
          <h2 className="section-title">
            Verified Engineering History
          </h2>
          <p className="section-subtitle">
            Direct commercial software development experience designing, deploying, and maintaining high-throughput backend services and enterprise client applications.
          </p>
        </div>

        {/* Timeline Container */}
        <div style={{ maxWidth: '900px', margin: '0 auto' }}>
          {experience.map((item, idx) => (
            <div 
              key={idx}
              className="card-surface reveal-on-scroll stagger-1"
              style={{
                padding: '2.25rem',
                borderLeft: '4px solid var(--accent-primary)',
                background: 'linear-gradient(145deg, #151922 0%, #10131b 100%)',
                boxShadow: '0 10px 30px rgba(0, 0, 0, 0.4)'
              }}
            >
              {/* Header Info */}
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                justifyContent: 'space-between',
                alignItems: 'flex-start',
                gap: '1rem',
                marginBottom: '1.25rem',
                borderBottom: '1px solid var(--border-subtle)',
                paddingBottom: '1.25rem'
              }}>
                <div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '0.3rem' }}>
                    <Building size={18} color="var(--accent-primary)" />
                    <span style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--text-primary)' }}>
                      {item.company}
                    </span>
                  </div>
                  <div style={{ fontSize: '1.05rem', color: 'var(--accent-light)', fontWeight: 600 }}>
                    {item.role}
                  </div>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-start', gap: '0.35rem' }}>
                  <div style={{ 
                    display: 'inline-flex', 
                    alignItems: 'center', 
                    gap: '0.4rem', 
                    fontFamily: 'var(--font-mono)', 
                    fontSize: '0.8rem',
                    color: 'var(--text-primary)',
                    backgroundColor: 'rgba(45, 212, 191, 0.1)',
                    border: '1px solid var(--border-accent)',
                    padding: '0.25rem 0.65rem',
                    borderRadius: 'var(--radius-full)'
                  }}>
                    <Calendar size={13} color="var(--accent-primary)" />
                    <span>{item.period}</span>
                  </div>
                  <div style={{ display: 'inline-flex', alignItems: 'center', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--text-muted)' }}>
                    <MapPin size={12} />
                    <span>{item.location} &bull; {item.employmentType}</span>
                  </div>
                </div>
              </div>

              {/* Context Summary */}
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.95rem', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                {item.description}
              </p>

              {/* Bulleted Core Responsibilities */}
              <div style={{ marginBottom: '1.75rem' }}>
                <div style={{ fontSize: '0.825rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.85rem' }}>
                  KEY RESPONSIBILITIES & SYSTEM IMPACT:
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.85rem' }}>
                  {item.contributions.map((bullet, i) => (
                    <div key={i} style={{ display: 'flex', alignItems: 'flex-start', gap: '0.75rem' }}>
                      <CheckCircle2 size={17} color="var(--accent-primary)" style={{ flexShrink: 0, marginTop: '0.2rem' }} />
                      <span style={{ fontSize: '0.925rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                        {bullet}
                      </span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Verified Production Tech Stack */}
              <div style={{
                display: 'flex',
                flexWrap: 'wrap',
                alignItems: 'center',
                gap: '0.5rem',
                paddingTop: '1.25rem',
                borderTop: '1px solid var(--border-subtle)'
              }}>
                <span style={{ fontSize: '0.75rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginRight: '0.5rem' }}>
                  VERIFIED STACK:
                </span>
                {["Python", "FastAPI", "AsyncIO", "WebSockets", "Flutter", "Dart", "PostgreSQL", "MySQL", "Docker", "Pytest", "Linux"].map((tech, idx) => (
                  <span key={idx} className="tech-tag tech-tag-accent">
                    {tech}
                  </span>
                ))}
              </div>

            </div>
          ))}

          {/* Verification Notice for Recruiters */}
          <div style={{
            marginTop: '1.5rem',
            padding: '1rem 1.25rem',
            backgroundColor: 'rgba(255, 255, 255, 0.02)',
            border: '1px solid var(--border-subtle)',
            borderRadius: 'var(--radius-md)',
            display: 'flex',
            alignItems: 'center',
            gap: '0.75rem',
            fontSize: '0.825rem',
            color: 'var(--text-muted)'
          }}>
            <ShieldCheck size={18} color="var(--accent-primary)" style={{ flexShrink: 0 }} />
            <span>
              <strong>Recruiter Verification:</strong> Employment dates and technical scope reflect actual commercial engineering contributions at SPI Equipments India. References and employment verification can be facilitated upon request.
            </span>
          </div>
        </div>

      </div>
    </section>
  );
};
