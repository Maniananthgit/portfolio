import React, { useState, useEffect } from 'react';
import { portfolioData } from '../data/portfolioData';
import { ArrowUp, Clock } from 'lucide-react';

const currentYear = new Date().getFullYear();

export const Footer = ({ onOpenResume }) => {
  const [time, setTime] = useState('');

  useEffect(() => {
    const updateTime = () => {
      // Indian Standard Time (UTC+5:30)
      const options = {
        timeZone: 'Asia/Kolkata',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: true
      };
      const formatter = new Intl.DateTimeFormat([], options);
      setTime(formatter.format(new Date()));
    };

    updateTime();
    const interval = setInterval(updateTime, 1000);
    return () => clearInterval(interval);
  }, []);

  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <footer 
      style={{
        backgroundColor: '#07080c',
        borderTop: '1px solid var(--border-subtle)',
        padding: '4rem 0 2.5rem',
        marginTop: 'auto'
      }}
      className="no-print"
    >
      <div className="container">
        
        {/* Top Footer Grid */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))',
          gap: '2.5rem',
          paddingBottom: '3rem',
          borderBottom: '1px solid var(--border-subtle)'
        }}>
          
          {/* Brand Col */}
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem', marginBottom: '0.75rem' }}>
              <div style={{
                width: '32px',
                height: '32px',
                borderRadius: '6px',
                backgroundColor: '#151922',
                border: '1px solid var(--border-accent)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: 'var(--accent-primary)',
                fontFamily: 'var(--font-mono)',
                fontWeight: 700,
                fontSize: '0.85rem'
              }}>
                MM
              </div>
              <span style={{ fontWeight: 800, fontSize: '1.1rem', color: 'var(--text-primary)' }}>
                {portfolioData.personal.name}
              </span>
            </div>

            <p style={{ fontSize: '0.875rem', color: 'var(--text-secondary)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
              Python Backend & Full-Stack Software Engineer specializing in FastAPI microservices, real-time WebSockets, and Flutter clients.
            </p>

            {/* Time Indicator */}
            <div style={{
              display: 'inline-flex',
              alignItems: 'center',
              gap: '0.5rem',
              fontFamily: 'var(--font-mono)',
              fontSize: '0.75rem',
              color: 'var(--text-muted)',
              backgroundColor: 'rgba(255, 255, 255, 0.03)',
              padding: '0.35rem 0.75rem',
              borderRadius: 'var(--radius-full)',
              border: '1px solid var(--border-subtle)'
            }}>
              <span 
                className="status-pulse-dot" 
                style={{ width: '6px', height: '6px', borderRadius: '50%', backgroundColor: 'var(--accent-primary)', display: 'inline-block' }} 
              />
              <Clock size={12} color="var(--accent-primary)" />
              <span>Coimbatore, IN: {time} (IST)</span>
            </div>
          </div>

          {/* Recruiter Navigation */}
          <div>
            <div style={{ fontWeight: 700, fontSize: '0.9rem', color: 'var(--text-primary)', marginBottom: '1rem', textTransform: 'uppercase', fontFamily: 'var(--font-mono)', letterSpacing: '0.05em' }}>
              Portfolio Sections
            </div>
            <ul style={{ listStyle: 'none', display: 'flex', flexDirection: 'column', gap: '0.6rem', fontSize: '0.875rem' }}>
              <li><a href="#projects" style={{ color: 'var(--text-secondary)' }}>Featured Projects</a></li>
              <li><a href="#capabilities" style={{ color: 'var(--text-secondary)' }}>System Capabilities</a></li>
              <li><a href="#experience" style={{ color: 'var(--text-secondary)' }}>SPI Equipments Experience</a></li>
              <li><a href="#skills" style={{ color: 'var(--text-secondary)' }}>Competency Matrix</a></li>
              <li><a href="#principles" style={{ color: 'var(--text-secondary)' }}>Engineering Principles</a></li>
              <li><a href="#about" style={{ color: 'var(--text-secondary)' }}>About & Education</a></li>
            </ul>
          </div>

          {/* Direct Actions */}
          <div>
            <div style={{ fontWeight: 700, fontSize: '0.9rem', color: 'var(--text-primary)', marginBottom: '1rem', textTransform: 'uppercase', fontFamily: 'var(--font-mono)', letterSpacing: '0.05em' }}>
              Candidate Verification
            </div>
            <ul style={{ listStyle: 'none', display: 'flex', flexDirection: 'column', gap: '0.65rem', fontSize: '0.875rem' }}>
              <li>
                <button 
                  onClick={onOpenResume}
                  style={{ color: 'var(--accent-primary)', cursor: 'pointer', background: 'none', padding: 0, font: 'inherit', fontWeight: 600 }}
                >
                  &rarr; View & Print ATS Résumé
                </button>
              </li>
              <li>
                <a 
                  href={portfolioData.personal.linkedin} 
                  target="_blank" 
                  rel="noopener"
                  style={{ color: 'var(--text-secondary)' }}
                >
                  LinkedIn Profile &bull; maniananth23
                </a>
              </li>
              <li>
                <a 
                  href={portfolioData.personal.github} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  style={{ color: 'var(--text-secondary)' }}
                >
                  GitHub Repositories
                </a>
              </li>
              <li>
                <a 
                  href={`mailto:${portfolioData.personal.email}`} 
                  style={{ color: 'var(--text-secondary)' }}
                >
                  Email: {portfolioData.personal.email}
                </a>
              </li>
            </ul>
          </div>

        </div>

        {/* Bottom Bar */}
        <div style={{
          display: 'flex',
          flexWrap: 'wrap',
          alignItems: 'center',
          justifyContent: 'space-between',
          paddingTop: '2rem',
          fontSize: '0.8rem',
          color: 'var(--text-muted)'
        }}>
          <div>
            &copy; {currentYear} {portfolioData.personal.name}. All verified engineering content belongs to author.
          </div>

          <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
            <span>Verified for Senior Backend & Full-Stack Roles</span>
            <button
              onClick={scrollToTop}
              className="btn btn-sm btn-secondary"
              style={{ padding: '0.35rem 0.75rem', display: 'flex', alignItems: 'center', gap: '0.35rem' }}
              aria-label="Scroll back to top"
            >
              <span>Back to Top</span>
              <ArrowUp size={13} />
            </button>
          </div>
        </div>

      </div>
    </footer>
  );
};
