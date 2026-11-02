import React, { useState } from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  Layers, 
  ArrowRight, 
  CheckCircle2, 
  Clock, 
  Maximize2
} from 'lucide-react';
import { CaseStudyModal } from './CaseStudyModal';

export const ProjectShowcase = () => {
  const { projects } = portfolioData;
  const [selectedProject, setSelectedProject] = useState(null);

  return (
    <section id="projects" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <Layers size={14} />
            <span>Featured Case Studies</span>
          </div>
          <h2 className="section-title">
            Production Engineering Work
          </h2>
          <p className="section-subtitle">
            Deep-dive into production systems built at SPI Equipments India. Each case study details real technical trade-offs, architecture diagrams, and concurrency solutions.
          </p>
        </div>

        {/* Projects List */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '4rem' }}>
          
          {/* =========================================================================
              PROJECT 1: SERVICE MANAGEMENT APPLICATION
              ========================================================================= */}
          <div 
            className="card-surface project-card reveal-on-scroll stagger-1"
            style={{
              padding: '0',
              overflow: 'hidden',
              background: 'linear-gradient(160deg, #161b26 0%, #0f121a 100%)',
              border: '1px solid rgba(255, 255, 255, 0.1)'
            }}
          >
            <div style={{
              display: 'grid',
              gridTemplateColumns: '1fr',
              gap: '0'
            }} className="project-grid">
              
              {/* Left Details Column */}
              <div style={{ padding: '2.5rem', display: 'flex', flexDirection: 'column', justifyContent: 'space-between' }}>
                <div>
                  {/* Category & Status */}
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem', flexWrap: 'wrap' }}>
                    <span style={{
                      fontFamily: 'var(--font-mono)',
                      fontSize: '0.75rem',
                      color: 'var(--accent-primary)',
                      backgroundColor: 'rgba(45, 212, 191, 0.1)',
                      padding: '0.2rem 0.65rem',
                      borderRadius: 'var(--radius-full)',
                      border: '1px solid var(--border-accent)'
                    }}>
                      Enterprise Industrial Service
                    </span>
                    <span style={{ fontSize: '0.75rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)' }}>
                      Flutter &bull; FastAPI &bull; PostgreSQL
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.85rem', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '0.5rem' }}>
                    {projects[0].title}
                  </h3>
                  <p style={{ color: 'var(--accent-light)', fontSize: '0.95rem', fontWeight: 500, marginBottom: '1.25rem' }}>
                    {projects[0].subtitle}
                  </p>

                  <p style={{ color: 'var(--text-secondary)', fontSize: '0.95rem', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                    {projects[0].summary}
                  </p>

                  {/* Highlight Bullets */}
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '0.6rem', marginBottom: '2rem' }}>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-primary)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Role-Based Access (RBAC):</strong> Strict token gates isolating Service Managers, Dispatchers, and Field Techs.</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-primary)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Live Ticket Dispatch:</strong> FastAPI WebSockets delivering instant job alerts directly to technician tablets.</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-primary)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Audit & Servicing Log:</strong> Normalized PostgreSQL schema preserving complete historical equipment logs.</span>
                    </div>
                  </div>
                </div>

                <div>
                  {/* Tech Tags */}
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.45rem', marginBottom: '1.75rem' }}>
                    {["FastAPI", "Python", "Flutter", "Dart", "PostgreSQL", "WebSockets", "Docker", "Pytest"].map((t, idx) => (
                      <span key={idx} className="tech-tag">{t}</span>
                    ))}
                  </div>

                  {/* Actions */}
                  <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                    <button
                      onClick={() => setSelectedProject(projects[0])}
                      className="btn btn-primary"
                      id="view-case-study-service"
                    >
                      <span>Examine Case Study & Architecture</span>
                      <ArrowRight size={16} />
                    </button>
                  </div>
                </div>
              </div>

              {/* Right Visual Column: Realistic Service Dispatch Tablet Interface */}
              <div style={{
                backgroundColor: '#0c0f16',
                borderLeft: '1px solid var(--border-subtle)',
                padding: '2rem',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center',
                position: 'relative'
              }}>
                
                {/* Tablet Frame */}
                <div style={{
                  width: '100%',
                  maxWidth: '460px',
                  backgroundColor: '#121620',
                  borderRadius: '16px',
                  border: '1px solid rgba(255, 255, 255, 0.15)',
                  boxShadow: '0 20px 40px rgba(0, 0, 0, 0.6), 0 0 30px rgba(45, 212, 191, 0.08)',
                  overflow: 'hidden'
                }}>
                  {/* Mock Device Header */}
                  <div style={{
                    backgroundColor: '#191f2c',
                    padding: '0.65rem 1rem',
                    borderBottom: '1px solid var(--border-subtle)',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    fontSize: '0.75rem',
                    fontFamily: 'var(--font-mono)'
                  }}>
                    <span style={{ color: 'var(--text-muted)' }}>SPI-TECH-CLIENT // FLUTTER</span>
                    <span style={{ display: 'inline-flex', alignItems: 'center', gap: '0.35rem', color: 'var(--accent-primary)' }}>
                      <span style={{ width: '6px', height: '6px', borderRadius: '50%', backgroundColor: 'var(--accent-primary)', display: 'inline-block' }} />
                      WS LIVE (14ms)
                    </span>
                  </div>

                  {/* Mock UI Body */}
                  <div style={{ padding: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.85rem' }}>
                    
                    {/* Active Dispatch Ticket Card */}
                    <div style={{
                      backgroundColor: 'rgba(45, 212, 191, 0.05)',
                      border: '1px solid var(--border-accent)',
                      borderRadius: '8px',
                      padding: '0.85rem'
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.4rem' }}>
                        <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.72rem', color: 'var(--accent-primary)', fontWeight: 600 }}>
                          TICKET #SPI-8842
                        </span>
                        <span style={{ 
                          fontSize: '0.68rem', 
                          backgroundColor: 'rgba(239, 68, 68, 0.2)', 
                          color: '#f87171', 
                          padding: '0.15rem 0.45rem', 
                          borderRadius: '4px',
                          fontWeight: 600
                        }}>
                          HIGH PRIORITY
                        </span>
                      </div>
                      <div style={{ fontWeight: 600, fontSize: '0.85rem', color: 'var(--text-primary)' }}>
                        Hydraulic Compressor Inspection & Calibration
                      </div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-secondary)', marginTop: '0.2rem' }}>
                        Asset SN: HD-990-TX &bull; Client: Unit 4 Fabrication
                      </div>

                      {/* Action Row */}
                      <div style={{ marginTop: '0.65rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderTop: '1px solid rgba(255,255,255,0.06)', paddingTop: '0.5rem' }}>
                        <span style={{ fontSize: '0.72rem', color: 'var(--text-muted)' }}>Assigned: Tech M. Ananth</span>
                        <span style={{ fontSize: '0.72rem', color: 'var(--accent-light)', fontFamily: 'var(--font-mono)' }}>STATUS: DISPATCHED</span>
                      </div>
                    </div>

                    {/* Secondary Queued Ticket */}
                    <div style={{
                      backgroundColor: 'rgba(255, 255, 255, 0.02)',
                      border: '1px solid var(--border-subtle)',
                      borderRadius: '8px',
                      padding: '0.75rem'
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.2rem' }}>
                        <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.7rem', color: 'var(--text-muted)' }}>
                          TICKET #SPI-8843
                        </span>
                        <span style={{ fontSize: '0.68rem', color: 'var(--accent-sky)' }}>SCHEDULED</span>
                      </div>
                      <div style={{ fontSize: '0.8rem', color: 'var(--text-primary)', fontWeight: 500 }}>
                        Routine Preventive Maintenance (Monthly)
                      </div>
                    </div>

                    {/* Backend Telemetry Bar */}
                    <div style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      fontSize: '0.7rem',
                      fontFamily: 'var(--font-mono)',
                      color: 'var(--text-muted)',
                      backgroundColor: '#090b10',
                      padding: '0.5rem 0.75rem',
                      borderRadius: '6px'
                    }}>
                      <span>AUTH: JWT SCOPE: SERVICE_MGR</span>
                      <span style={{ color: 'var(--accent-emerald)' }}>DB: ASYNC-PG POOL OK</span>
                    </div>

                  </div>
                </div>

                <button
                  onClick={() => setSelectedProject(projects[0])}
                  style={{
                    marginTop: '1rem',
                    fontSize: '0.78rem',
                    color: 'var(--accent-primary)',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.35rem',
                    background: 'none',
                    cursor: 'pointer'
                  }}
                >
                  <Maximize2 size={13} />
                  <span>Click to expand full architecture diagram</span>
                </button>

              </div>

            </div>
          </div>


          {/* =========================================================================
              PROJECT 2: RESTAURANT SELF-ORDERING & KDS
              ========================================================================= */}
          <div 
            className="card-surface project-card reveal-on-scroll stagger-2"
            style={{
              padding: '0',
              overflow: 'hidden',
              background: 'linear-gradient(160deg, #161b26 0%, #0f121a 100%)',
              border: '1px solid rgba(255, 255, 255, 0.1)'
            }}
          >
            <div style={{
              display: 'grid',
              gridTemplateColumns: '1fr',
              gap: '0'
            }} className="project-grid">
              
              {/* Left Details Column */}
              <div style={{ padding: '2.5rem', display: 'flex', flexDirection: 'column', justifyContent: 'space-between' }}>
                <div>
                  {/* Category & Status */}
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem', flexWrap: 'wrap' }}>
                    <span style={{
                      fontFamily: 'var(--font-mono)',
                      fontSize: '0.75rem',
                      color: 'var(--accent-light)',
                      backgroundColor: 'rgba(56, 189, 248, 0.1)',
                      padding: '0.2rem 0.65rem',
                      borderRadius: 'var(--radius-full)',
                      border: '1px solid rgba(56, 189, 248, 0.3)'
                    }}>
                      Real-Time Concurrency System
                    </span>
                    <span style={{ fontSize: '0.75rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)' }}>
                      FastAPI &bull; WebSockets &bull; MySQL/Postgres
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.85rem', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '0.5rem' }}>
                    {projects[1].title}
                  </h3>
                  <p style={{ color: 'var(--accent-sky)', fontSize: '0.95rem', fontWeight: 500, marginBottom: '1.25rem' }}>
                    {projects[1].subtitle}
                  </p>

                  <p style={{ color: 'var(--text-secondary)', fontSize: '0.95rem', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                    {projects[1].summary}
                  </p>

                  {/* Highlight Bullets */}
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '0.6rem', marginBottom: '2rem' }}>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-sky)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Sub-Second KOT Propagation:</strong> Orders created on customer kiosks broadcast directly to kitchen screens via WebSocket channels.</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-sky)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Idempotent Order Handling:</strong> Client-generated UUID tokens prevent duplicate charges and orders during peak network retries.</span>
                    </div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem', fontSize: '0.875rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-sky)" style={{ flexShrink: 0, marginTop: '0.15rem' }} />
                      <span><strong>Kitchen State Machine:</strong> Strict transitions (Queued &rarr; Cooking &rarr; Plated &rarr; Ready) with station segmentation.</span>
                    </div>
                  </div>
                </div>

                <div>
                  {/* Tech Tags */}
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.45rem', marginBottom: '1.75rem' }}>
                    {["FastAPI", "Python", "WebSockets", "Pub/Sub", "PostgreSQL", "MySQL", "Idempotency", "Docker"].map((t, idx) => (
                      <span key={idx} className="tech-tag">{t}</span>
                    ))}
                  </div>

                  {/* Actions */}
                  <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                    <button
                      onClick={() => setSelectedProject(projects[1])}
                      className="btn btn-primary"
                      id="view-case-study-restaurant"
                    >
                      <span>Examine Case Study & Architecture</span>
                      <ArrowRight size={16} />
                    </button>
                  </div>
                </div>
              </div>

              {/* Right Visual Column: Realistic Kitchen Display Screen (KDS) */}
              <div style={{
                backgroundColor: '#0c0f16',
                borderLeft: '1px solid var(--border-subtle)',
                padding: '2rem',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center',
                position: 'relative'
              }}>
                
                {/* KDS Monitor Frame */}
                <div style={{
                  width: '100%',
                  maxWidth: '460px',
                  backgroundColor: '#121620',
                  borderRadius: '16px',
                  border: '1px solid rgba(255, 255, 255, 0.15)',
                  boxShadow: '0 20px 40px rgba(0, 0, 0, 0.6), 0 0 30px rgba(56, 189, 248, 0.08)',
                  overflow: 'hidden'
                }}>
                  {/* KDS Station Header */}
                  <div style={{
                    backgroundColor: '#181f2d',
                    padding: '0.65rem 1rem',
                    borderBottom: '1px solid var(--border-subtle)',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    fontSize: '0.75rem',
                    fontFamily: 'var(--font-mono)'
                  }}>
                    <span style={{ color: '#38bdf8', fontWeight: 600 }}>STATION: GRILL & HOT PREP</span>
                    <span style={{ display: 'inline-flex', alignItems: 'center', gap: '0.45rem', color: '#10b981' }}>
                      <span 
                        className="status-pulse-dot" 
                        style={{ width: '7px', height: '7px', borderRadius: '50%', backgroundColor: '#10b981', display: 'inline-block' }} 
                      />
                      <Clock size={12} />
                      ACTIVE QUEUE: 3
                    </span>
                  </div>

                  {/* KDS Ticket Cards */}
                  <div style={{ padding: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.85rem' }}>
                    
                    {/* Active Order Ticket */}
                    <div style={{
                      backgroundColor: 'rgba(56, 189, 248, 0.06)',
                      border: '1px solid rgba(56, 189, 248, 0.3)',
                      borderRadius: '8px',
                      padding: '0.85rem'
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.4rem' }}>
                        <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.75rem', color: '#38bdf8', fontWeight: 700 }}>
                          ORDER #1042 [KIOSK-02]
                        </span>
                        <span style={{ 
                          fontFamily: 'var(--font-mono)',
                          fontSize: '0.7rem', 
                          backgroundColor: 'rgba(245, 158, 11, 0.2)', 
                          color: '#fbbf24', 
                          padding: '0.15rem 0.45rem', 
                          borderRadius: '4px',
                          fontWeight: 600
                        }}>
                          COOKING [02:45]
                        </span>
                      </div>

                      <div style={{ fontSize: '0.825rem', color: 'var(--text-primary)', lineHeight: 1.5 }}>
                        <div>&bull; 2x Double Artisan Patty (Medium Rare)</div>
                        <div>&bull; 1x Rosemary Garlic Fries (Crispy)</div>
                      </div>

                      <div style={{ marginTop: '0.65rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderTop: '1px solid rgba(255,255,255,0.06)', paddingTop: '0.5rem', fontSize: '0.7rem' }}>
                        <span style={{ color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>IDEMPOTENCY: 9e2a...c01f</span>
                        <span style={{ color: '#38bdf8', fontWeight: 600 }}>TAP TO PLATE &rarr;</span>
                      </div>
                    </div>

                    {/* Queued Next Ticket */}
                    <div style={{
                      backgroundColor: 'rgba(255, 255, 255, 0.02)',
                      border: '1px solid var(--border-subtle)',
                      borderRadius: '8px',
                      padding: '0.75rem'
                    }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.2rem' }}>
                        <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.72rem', color: 'var(--text-muted)' }}>
                          ORDER #1043 [MOBILE-WEB]
                        </span>
                        <span style={{ fontSize: '0.7rem', color: 'var(--text-secondary)' }}>QUEUED [00:30]</span>
                      </div>
                      <div style={{ fontSize: '0.8rem', color: 'var(--text-primary)' }}>
                        &bull; 1x Grilled Chicken Wrap + Herb Sauce
                      </div>
                    </div>

                    {/* Channel Broadcast Info */}
                    <div style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      fontSize: '0.7rem',
                      fontFamily: 'var(--font-mono)',
                      color: 'var(--text-muted)',
                      backgroundColor: '#090b10',
                      padding: '0.5rem 0.75rem',
                      borderRadius: '6px'
                    }}>
                      <span>BROADCAST: WS /kds/grill</span>
                      <span style={{ color: '#10b981' }}>SUB-SECOND LATENCY</span>
                    </div>

                  </div>
                </div>

                <button
                  onClick={() => setSelectedProject(projects[1])}
                  style={{
                    marginTop: '1rem',
                    fontSize: '0.78rem',
                    color: '#38bdf8',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.35rem',
                    background: 'none',
                    cursor: 'pointer'
                  }}
                >
                  <Maximize2 size={13} />
                  <span>Click to expand full architecture diagram</span>
                </button>

              </div>

            </div>
          </div>

        </div>

      </div>

      {/* Case Study Deep-Dive Modal */}
      {selectedProject && (
        <CaseStudyModal 
          project={selectedProject} 
          onClose={() => setSelectedProject(null)} 
        />
      )}

      <style>{`
        @media (min-width: 960px) {
          .project-grid {
            grid-template-columns: 1.15fr 0.85fr !important;
          }
        }
      `}</style>
    </section>
  );
};
