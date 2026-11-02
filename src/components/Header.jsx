import React, { useState, useEffect } from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  FileText, 
  Menu, 
  X, 
  Terminal, 
  Layers, 
  Briefcase, 
  Cpu, 
  User, 
  Mail,
  ExternalLink
} from 'lucide-react';

export const Header = ({ onOpenResume, activeSection }) => {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: 'Projects', href: '#projects', icon: Layers },
    { name: 'Architecture', href: '#capabilities', icon: Terminal },
    { name: 'Experience', href: '#experience', icon: Briefcase },
    { name: 'Competencies', href: '#skills', icon: Cpu },
    { name: 'Principles', href: '#principles', icon: Terminal },
    { name: 'About', href: '#about', icon: User },
    { name: 'Contact', href: '#contact', icon: Mail },
  ];

  return (
    <header 
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        zIndex: 50,
        transition: 'all 0.25s cubic-bezier(0.16, 1, 0.3, 1)',
        backgroundColor: scrolled ? 'rgba(10, 12, 16, 0.92)' : 'rgba(10, 12, 16, 0.7)',
        backdropFilter: 'blur(12px)',
        borderBottom: scrolled ? '1px solid rgba(255, 255, 255, 0.08)' : '1px solid transparent',
        padding: scrolled ? '0.75rem 0' : '1.1rem 0'
      }}
      className="no-print"
    >
      <div className="container" style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
        {/* Brand Wordmark */}
        <a 
          href="#" 
          style={{ 
            display: 'flex', 
            alignItems: 'center', 
            gap: '0.75rem',
            textDecoration: 'none'
          }}
          aria-label="Maniananth M - Portfolio Home"
        >
          <div style={{
            width: '38px',
            height: '38px',
            borderRadius: '8px',
            backgroundColor: '#151922',
            border: '1px solid rgba(45, 212, 191, 0.4)',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            color: 'var(--accent-primary)',
            fontFamily: 'var(--font-mono)',
            fontWeight: 700,
            fontSize: '0.9rem',
            boxShadow: '0 0 15px rgba(45, 212, 191, 0.15)'
          }}>
            MM
          </div>
          <div>
            <div style={{ 
              fontWeight: 700, 
              fontSize: '1.05rem', 
              color: 'var(--text-primary)',
              letterSpacing: '-0.02em',
              lineHeight: 1.2
            }}>
              {portfolioData.personal.name}
            </div>
            <div style={{ 
              fontFamily: 'var(--font-mono)', 
              fontSize: '0.72rem', 
              color: 'var(--accent-primary)',
              letterSpacing: '0.02em'
            }}>
              Python Backend & Full-Stack
            </div>
          </div>
        </a>

        {/* Desktop Navigation */}
        <nav 
          style={{ 
            display: 'none', 
            alignItems: 'center', 
            gap: '1.5rem' 
          }}
          className="desktop-nav"
        >
          {navLinks.map((link) => (
            <a
              key={link.name}
              href={link.href}
              style={{
                fontSize: '0.875rem',
                fontWeight: 500,
                color: activeSection === link.href.substring(1) ? 'var(--accent-primary)' : 'var(--text-secondary)',
                transition: 'color 0.2s',
                padding: '0.35rem 0.2rem',
                position: 'relative'
              }}
              onMouseEnter={(e) => e.currentTarget.style.color = 'var(--text-primary)'}
              onMouseLeave={(e) => {
                if (activeSection !== link.href.substring(1)) {
                  e.currentTarget.style.color = 'var(--text-secondary)';
                }
              }}
            >
              {link.name}
            </a>
          ))}

          {/* Résumé Action Button */}
          <button
            onClick={onOpenResume}
            className="btn btn-primary btn-sm"
            style={{ 
              marginLeft: '0.5rem',
              display: 'inline-flex',
              alignItems: 'center',
              gap: '0.4rem',
              cursor: 'pointer'
            }}
            id="nav-resume-btn"
          >
            <FileText size={15} />
            <span>ATS Résumé</span>
          </button>
        </nav>

        {/* Mobile Menu Toggle Button */}
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }} className="mobile-actions">
          <button
            onClick={onOpenResume}
            className="btn btn-primary btn-sm mobile-resume-btn"
            style={{ display: 'none', fontSize: '0.75rem', padding: '0.4rem 0.75rem' }}
          >
            <FileText size={14} />
            <span>Résumé</span>
          </button>

          <button
            onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
            style={{
              padding: '0.5rem',
              color: 'var(--text-primary)',
              backgroundColor: 'var(--bg-card)',
              border: '1px solid var(--border-subtle)',
              borderRadius: '6px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}
            aria-label="Toggle navigation menu"
            className="mobile-toggle-btn"
          >
            {mobileMenuOpen ? <X size={20} /> : <Menu size={20} />}
          </button>
        </div>
      </div>

      {/* Mobile Drawer */}
      {mobileMenuOpen && (
        <div 
          style={{
            position: 'absolute',
            top: '100%',
            left: 0,
            right: 0,
            backgroundColor: 'rgba(14, 17, 24, 0.98)',
            borderBottom: '1px solid var(--border-subtle)',
            padding: '1.25rem 1.5rem 2rem',
            backdropFilter: 'blur(20px)',
            display: 'flex',
            flexDirection: 'column',
            gap: '1rem',
            boxShadow: '0 10px 30px rgba(0,0,0,0.5)'
          }}
          className="nav-drawer"
        >
          {navLinks.map((link) => (
            <a
              key={link.name}
              href={link.href}
              onClick={() => setMobileMenuOpen(false)}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '0.75rem',
                padding: '0.6rem 0',
                fontSize: '1rem',
                color: 'var(--text-primary)',
                borderBottom: '1px solid rgba(255, 255, 255, 0.05)'
              }}
            >
              <link.icon size={16} color="var(--accent-primary)" />
              {link.name}
            </a>
          ))}

          <div style={{ marginTop: '0.75rem', display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
            <button
              onClick={() => {
                setMobileMenuOpen(false);
                onOpenResume();
              }}
              className="btn btn-primary"
              style={{ width: '100%' }}
            >
              <FileText size={16} />
              <span>View & Print ATS Résumé</span>
            </button>
            
            <a
              href="https://www.linkedin.com/in/maniananth23"
              target="_blank"
              rel="noopener"
              className="btn btn-secondary"
              style={{ width: '100%', textAlign: 'center' }}
            >
              <span>LinkedIn Profile</span>
              <ExternalLink size={15} />
            </a>
          </div>
        </div>
      )}

      {/* Media query styling for responsive desktop nav */}
      <style>{`
        @media (min-width: 900px) {
          .desktop-nav {
            display: flex !important;
          }
          .mobile-toggle-btn {
            display: none !important;
          }
          .mobile-resume-btn {
            display: none !important;
          }
        }
        @media (max-width: 899px) and (min-width: 500px) {
          .mobile-resume-btn {
            display: inline-flex !important;
          }
        }
        @media (max-width: 499px) {
          .mobile-resume-btn {
            display: none !important;
          }
        }
      `}</style>
    </header>
  );
};
