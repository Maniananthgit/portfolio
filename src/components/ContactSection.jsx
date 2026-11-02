import React, { useState } from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  Mail, 
  MapPin, 
  ExternalLink, 
  CheckCircle2, 
  Copy, 
  FileText, 
  Phone,
  ShieldCheck
} from 'lucide-react';

const LinkedInIcon = () => (
  <svg width="20" height="20" viewBox="0 0 24 24" fill="#0a66c2">
    <path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.28 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.75M6.46 10.9h2.76v8.37H6.46V10.9M7.84 6.7a1.6 1.6 0 0 0-1.61 1.6 1.6 1.6 0 0 0 1.61 1.6 1.6 1.6 0 0 0 1.6-1.6 1.6 1.6 0 0 0-1.6-1.6Z"/>
  </svg>
);

const GitHubIcon = () => (
  <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
    <path fillRule="evenodd" clipRule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.53 1.032 1.53 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
  </svg>
);

export const ContactSection = ({ onOpenResume }) => {
  const { personal } = portfolioData;
  const [copiedEmail, setCopiedEmail] = useState(false);
  const [copiedPhone, setCopiedPhone] = useState(false);

  const handleCopyEmail = () => {
    navigator.clipboard.writeText(personal.email);
    setCopiedEmail(true);
    setTimeout(() => setCopiedEmail(false), 2500);
  };

  const handleCopyPhone = () => {
    navigator.clipboard.writeText(personal.phone);
    setCopiedPhone(true);
    setTimeout(() => setCopiedPhone(false), 2500);
  };

  const mailtoSubject = encodeURIComponent("Hiring Inquiry: Python Backend / Full-Stack Engineer — Maniananth M");
  const mailtoBody = encodeURIComponent(
    `Hello Maniananth,\n\nI reviewed your portfolio and engineering case studies (SPI Equipments, FastAPI microservices, Flutter applications, and Generative AI workflows). We have an open role that matches your background.\n\nLet's connect for an exploratory discussion.`
  );

  return (
    <section id="contact" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)', backgroundColor: '#090b0f' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <Mail size={14} />
            <span>Recruiter Direct Channel</span>
          </div>
          <h2 className="section-title">
            Get in Touch
          </h2>
          <p className="section-subtitle">
            Currently based in Coimbatore and interviewing for Python Backend Engineer, FastAPI Developer, and Full-Stack Software Engineering roles.
          </p>
        </div>

        {/* Contact Grid */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))',
          gap: '2rem',
          maxWidth: '1000px',
          margin: '0 auto'
        }}>
          
          {/* Left Card: Direct Contact Channels */}
          <div 
            className="card-surface reveal-on-scroll stagger-1"
            style={{
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              background: 'linear-gradient(150deg, #151922 0%, #0d1017 100%)',
              border: '1px solid rgba(45, 212, 191, 0.25)'
            }}
          >
            <div>
              <h3 style={{ fontSize: '1.3rem', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '0.5rem' }}>
                Direct Communication
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', marginBottom: '1.75rem', lineHeight: 1.6 }}>
                Fastest response via direct phone call, email, and LinkedIn message. Available for technical discussions and code walkthroughs.
              </p>

              {/* Email Block */}
              <div style={{
                backgroundColor: 'rgba(255, 255, 255, 0.03)',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '1rem 1.25rem',
                marginBottom: '1rem',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                gap: '1rem'
              }}>
                <div style={{ overflow: 'hidden' }}>
                  <div style={{ fontSize: '0.72rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)' }}>PRIMARY EMAIL</div>
                  <a 
                    href={`mailto:${personal.email}`}
                    style={{ fontWeight: 600, color: 'var(--text-primary)', fontSize: '0.95rem', textOverflow: 'ellipsis', overflow: 'hidden', display: 'block' }}
                  >
                    {personal.email}
                  </a>
                </div>

                <button
                  onClick={handleCopyEmail}
                  className="btn btn-sm btn-secondary"
                  style={{ flexShrink: 0 }}
                  title="Copy email to clipboard"
                  id="contact-copy-email-btn"
                >
                  {copiedEmail ? <CheckCircle2 size={14} color="var(--accent-primary)" /> : <Copy size={14} />}
                  <span>{copiedEmail ? 'Copied' : 'Copy'}</span>
                </button>
              </div>

              {/* Phone Block */}
              <div style={{
                backgroundColor: 'rgba(255, 255, 255, 0.03)',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '1rem 1.25rem',
                marginBottom: '1rem',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                gap: '1rem'
              }}>
                <div>
                  <div style={{ fontSize: '0.72rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)' }}>DIRECT PHONE / WHATSAPP</div>
                  <a 
                    href={`tel:${personal.phone}`}
                    style={{ fontWeight: 600, color: 'var(--accent-primary)', fontSize: '0.95rem', display: 'flex', alignItems: 'center', gap: '0.4rem' }}
                  >
                    <Phone size={14} />
                    <span>{personal.phone}</span>
                  </a>
                </div>

                <button
                  onClick={handleCopyPhone}
                  className="btn btn-sm btn-secondary"
                  style={{ flexShrink: 0 }}
                  title="Copy phone number"
                  id="contact-copy-phone-btn"
                >
                  {copiedPhone ? <CheckCircle2 size={14} color="var(--accent-primary)" /> : <Copy size={14} />}
                  <span>{copiedPhone ? 'Copied' : 'Copy'}</span>
                </button>
              </div>

              {/* Location Block */}
              <div style={{
                backgroundColor: 'rgba(255, 255, 255, 0.03)',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '1rem 1.25rem',
                display: 'flex',
                alignItems: 'center',
                gap: '0.85rem'
              }}>
                <MapPin size={20} color="var(--accent-primary)" style={{ flexShrink: 0 }} />
                <div>
                  <div style={{ fontSize: '0.72rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)' }}>CURRENT LOCATION</div>
                  <div style={{ fontWeight: 600, color: 'var(--text-primary)', fontSize: '0.95rem' }}>
                    {personal.location}
                  </div>
                </div>
              </div>
            </div>

            {/* Email Trigger CTA */}
            <div style={{ marginTop: '2rem' }}>
              <a
                href={`mailto:${personal.email}?subject=${mailtoSubject}&body=${mailtoBody}`}
                className="btn btn-primary"
                style={{ width: '100%', textAlign: 'center' }}
                id="contact-send-email-btn"
              >
                <Mail size={16} />
                <span>Send Hiring Inquiry Email</span>
              </a>
            </div>
          </div>

          {/* Right Card: Professional Links & Résumé */}
          <div 
            className="card-surface reveal-on-scroll stagger-2"
            style={{
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              background: 'linear-gradient(150deg, #151922 0%, #0d1017 100%)'
            }}
          >
            <div>
              <h3 style={{ fontSize: '1.3rem', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '0.5rem' }}>
                Profiles & Credentials
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', marginBottom: '1.75rem', lineHeight: 1.6 }}>
                Review verified LinkedIn history, official GitHub code repositories, and download an ATS-formatted printable résumé.
              </p>

              {/* Links List */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: '0.85rem' }}>
                
                {/* LinkedIn Link */}
                <a
                  href={personal.linkedin}
                  target="_blank"
                  rel="noopener"
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    padding: '1rem 1.25rem',
                    backgroundColor: 'rgba(255, 255, 255, 0.03)',
                    border: '1px solid var(--border-subtle)',
                    borderRadius: 'var(--radius-md)',
                    transition: 'all 0.2s'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.borderColor = 'var(--accent-primary)'}
                  onMouseLeave={(e) => e.currentTarget.style.borderColor = 'var(--border-subtle)'}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <LinkedInIcon />
                    <div>
                      <div style={{ fontWeight: 600, color: 'var(--text-primary)', fontSize: '0.9rem' }}>
                        LinkedIn Profile
                      </div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>
                        linkedin.com/in/maniananth23
                      </div>
                    </div>
                  </div>
                  <ExternalLink size={16} color="var(--accent-primary)" />
                </a>

                {/* GitHub Link */}
                <a
                  href={personal.github}
                  target="_blank"
                  rel="noopener noreferrer"
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    padding: '1rem 1.25rem',
                    backgroundColor: 'rgba(255, 255, 255, 0.03)',
                    border: '1px solid var(--border-subtle)',
                    borderRadius: 'var(--radius-md)',
                    transition: 'all 0.2s'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.borderColor = 'var(--accent-primary)'}
                  onMouseLeave={(e) => e.currentTarget.style.borderColor = 'var(--border-subtle)'}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <GitHubIcon />
                    <div>
                      <div style={{ fontWeight: 600, color: 'var(--text-primary)', fontSize: '0.9rem' }}>
                        GitHub Profile
                      </div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>
                        github.com/maniselmagi
                      </div>
                    </div>
                  </div>
                  <ExternalLink size={16} color="var(--text-secondary)" />
                </a>

              </div>
            </div>

            {/* ATS Résumé Download Button */}
            <div style={{ marginTop: '2rem' }}>
              <button
                onClick={onOpenResume}
                className="btn btn-secondary"
                style={{ width: '100%', textAlign: 'center' }}
                id="contact-resume-modal-btn"
              >
                <FileText size={16} />
                <span>View & Print ATS Résumé</span>
              </button>
            </div>
          </div>

        </div>

        {/* Verified Notice */}
        <div style={{
          maxWidth: '1000px',
          margin: '2rem auto 0',
          padding: '0.85rem 1.25rem',
          backgroundColor: 'rgba(255, 255, 255, 0.02)',
          border: '1px solid var(--border-subtle)',
          borderRadius: 'var(--radius-md)',
          display: 'flex',
          alignItems: 'center',
          gap: '0.65rem',
          fontSize: '0.8rem',
          color: 'var(--text-muted)'
        }}>
          <ShieldCheck size={16} color="var(--accent-primary)" style={{ flexShrink: 0 }} />
          <span>
            <strong>Official Verified Profile:</strong> Coimbatore, Tamil Nadu, India &bull; Email: <code>maniananth93@gmail.com</code> &bull; Phone: <code>+91 9787245016</code> &bull; GitHub: <code>github.com/maniselmagi</code>.
          </span>
        </div>

      </div>
    </section>
  );
};
