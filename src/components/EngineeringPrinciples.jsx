import React from 'react';
import { portfolioData } from '../data/portfolioData';
import { Terminal, Shield, Zap, Database, CheckCircle, Lock, Code2 } from 'lucide-react';

export const EngineeringPrinciples = () => {
  const { engineeringPrinciples } = portfolioData;

  const icons = [Code2, Zap, Lock, Database, Shield];

  return (
    <section id="principles" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <Terminal size={14} />
            <span>Architecture & Design Philosophy</span>
          </div>
          <h2 className="section-title">
            Engineering Principles
          </h2>
          <p className="section-subtitle">
            How I approach backend systems design, fault tolerance, and API reliability when building software meant to run without intervention.
          </p>
        </div>

        {/* Principles Cards */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))',
          gap: '1.5rem'
        }}>
          {engineeringPrinciples.map((item, idx) => {
            const IconComponent = icons[idx % icons.length];
            return (
              <div
                key={idx}
                className={`card-surface reveal-on-scroll stagger-${(idx % 4) + 1}`}
                style={{
                  display: 'flex',
                  flexDirection: 'column',
                  justifyContent: 'space-between',
                  background: 'linear-gradient(145deg, #151922 0%, #10131b 100%)',
                  border: '1px solid var(--border-subtle)'
                }}
              >
                <div>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    marginBottom: '1.25rem'
                  }}>
                    <div style={{
                      width: '42px',
                      height: '42px',
                      borderRadius: 'var(--radius-md)',
                      backgroundColor: 'rgba(45, 212, 191, 0.1)',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      color: 'var(--accent-primary)'
                    }}>
                      <IconComponent size={20} />
                    </div>

                    <span style={{
                      fontFamily: 'var(--font-mono)',
                      fontSize: '0.75rem',
                      color: 'var(--text-muted)'
                    }}>
                      0{idx + 1} // RULE
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.2rem', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '0.35rem' }}>
                    {item.title}
                  </h3>
                  <div style={{ fontSize: '0.8rem', fontFamily: 'var(--font-mono)', color: 'var(--accent-light)', marginBottom: '1rem' }}>
                    {item.subtitle}
                  </div>

                  <p style={{ fontSize: '0.9rem', color: 'var(--text-secondary)', lineHeight: 1.65 }}>
                    {item.description}
                  </p>
                </div>

                <div style={{
                  marginTop: '1.5rem',
                  paddingTop: '0.85rem',
                  borderTop: '1px solid rgba(255, 255, 255, 0.05)',
                  fontSize: '0.75rem',
                  fontFamily: 'var(--font-mono)',
                  color: 'var(--text-muted)',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '0.4rem'
                }}>
                  <CheckCircle size={13} color="var(--accent-primary)" />
                  <span>Enforced across production codebases</span>
                </div>
              </div>
            );
          })}
        </div>

      </div>
    </section>
  );
};
