import React, { useState } from 'react';
import { 
  X, 
  Layers, 
  ShieldCheck, 
  AlertTriangle, 
  CheckCircle2, 
  Workflow, 
  Cpu
} from 'lucide-react';

export const CaseStudyModal = ({ project, onClose }) => {
  const [activeTab, setActiveTab] = useState('overview'); // 'overview' | 'architecture' | 'decisions' | 'security'

  if (!project) return null;

  return (
    <div 
      style={{
        position: 'fixed',
        inset: 0,
        backgroundColor: 'rgba(5, 7, 10, 0.88)',
        backdropFilter: 'blur(10px)',
        zIndex: 100,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '1.5rem'
      }}
      className="case-study-modal-backdrop"
      onClick={onClose}
    >
      <div 
        style={{
          width: '100%',
          maxWidth: '920px',
          maxHeight: '90vh',
          backgroundColor: '#121620',
          border: '1px solid rgba(255, 255, 255, 0.12)',
          borderRadius: 'var(--radius-xl)',
          boxShadow: '0 25px 60px -15px rgba(0, 0, 0, 0.8), 0 0 40px rgba(45, 212, 191, 0.1)',
          display: 'flex',
          flexDirection: 'column',
          overflow: 'hidden'
        }}
        onClick={(e) => e.stopPropagation()}
        role="dialog"
        aria-labelledby="case-study-title"
      >
        
        {/* Header Bar */}
        <div style={{
          display: 'flex',
          alignItems: 'flex-start',
          justifyContent: 'space-between',
          padding: '1.75rem 2rem 1.25rem',
          borderBottom: '1px solid var(--border-subtle)',
          backgroundColor: '#161b27'
        }}>
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '0.4rem' }}>
              <span className="section-badge" style={{ margin: 0, padding: '0.2rem 0.6rem', fontSize: '0.72rem' }}>
                Engineering Deep-Dive Case Study
              </span>
              <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.75rem', color: 'var(--text-muted)' }}>
                {project.status}
              </span>
            </div>
            <h2 id="case-study-title" style={{ fontSize: '1.65rem', fontWeight: 800, color: 'var(--text-primary)' }}>
              {project.title}
            </h2>
            <p style={{ color: 'var(--accent-primary)', fontSize: '0.9rem', marginTop: '0.2rem' }}>
              {project.subtitle}
            </p>
          </div>

          <button
            onClick={onClose}
            style={{
              padding: '0.5rem',
              borderRadius: 'var(--radius-sm)',
              backgroundColor: 'rgba(255, 255, 255, 0.05)',
              color: 'var(--text-secondary)',
              border: '1px solid var(--border-subtle)',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center'
            }}
            aria-label="Close modal"
          >
            <X size={20} />
          </button>
        </div>

        {/* Tab Navigation */}
        <div style={{
          display: 'flex',
          borderBottom: '1px solid var(--border-subtle)',
          backgroundColor: '#0f131c',
          padding: '0 2rem',
          gap: '1.5rem',
          overflowX: 'auto'
        }}>
          {[
            { id: 'overview', label: 'Problem & Solution', icon: Layers },
            { id: 'architecture', label: 'System Topology', icon: Workflow },
            { id: 'decisions', label: 'Decisions & Trade-offs', icon: Cpu },
            { id: 'security', label: 'Testing & Concurrency', icon: ShieldCheck }
          ].map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: '0.5rem',
                padding: '0.9rem 0',
                fontSize: '0.875rem',
                fontWeight: 600,
                color: activeTab === tab.id ? 'var(--accent-primary)' : 'var(--text-secondary)',
                borderBottom: activeTab === tab.id ? '2px solid var(--accent-primary)' : '2px solid transparent',
                cursor: 'pointer',
                whiteSpace: 'nowrap'
              }}
            >
              <tab.icon size={16} />
              <span>{tab.label}</span>
            </button>
          ))}
        </div>

        {/* Content Body (Scrollable) */}
        <div style={{
          padding: '2rem',
          overflowY: 'auto',
          flex: 1,
          display: 'flex',
          flexDirection: 'column',
          gap: '1.75rem'
        }}>
          
          {/* TAB 1: OVERVIEW */}
          {activeTab === 'overview' && (
            <>
              {/* Stack Spec Grid */}
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
                gap: '1rem',
                padding: '1.25rem',
                backgroundColor: 'rgba(255, 255, 255, 0.02)',
                borderRadius: 'var(--radius-md)',
                border: '1px solid var(--border-subtle)'
              }}>
                <div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>BACKEND ENGINE</div>
                  <div style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--text-primary)' }}>{project.backend}</div>
                </div>
                <div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>CLIENT STACK</div>
                  <div style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--text-primary)' }}>{project.client}</div>
                </div>
                <div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>DATABASE</div>
                  <div style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--text-primary)' }}>{project.database}</div>
                </div>
                <div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>DEPLOYMENT</div>
                  <div style={{ fontSize: '0.9rem', fontWeight: 600, color: 'var(--text-primary)' }}>{project.deployment}</div>
                </div>
              </div>

              {/* Challenge & Solution */}
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1.5rem' }} className="modal-two-col">
                <div style={{ backgroundColor: '#161922', padding: '1.25rem', borderRadius: 'var(--radius-md)', border: '1px solid rgba(239, 68, 68, 0.2)' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#f87171', fontWeight: 600, marginBottom: '0.6rem' }}>
                    <AlertTriangle size={18} />
                    <span>The Engineering Problem</span>
                  </div>
                  <p style={{ fontSize: '0.9rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                    {project.challenge}
                  </p>
                </div>

                <div style={{ backgroundColor: '#161922', padding: '1.25rem', borderRadius: 'var(--radius-md)', border: '1px solid rgba(45, 212, 191, 0.2)' }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: 'var(--accent-primary)', fontWeight: 600, marginBottom: '0.6rem' }}>
                    <CheckCircle2 size={18} />
                    <span>Architectural Solution</span>
                  </div>
                  <p style={{ fontSize: '0.9rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                    {project.solution}
                  </p>
                </div>
              </div>

              {/* Key Features Implemented */}
              <div>
                <h3 style={{ fontSize: '1.1rem', fontWeight: 700, marginBottom: '1rem', color: 'var(--text-primary)' }}>
                  Core Implemented Features
                </h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '1rem' }}>
                  {project.keyFeatures.map((feat, i) => (
                    <div 
                      key={i}
                      style={{
                        padding: '1rem',
                        backgroundColor: 'rgba(255, 255, 255, 0.02)',
                        border: '1px solid var(--border-subtle)',
                        borderRadius: 'var(--radius-md)'
                      }}
                    >
                      <div style={{ fontWeight: 600, fontSize: '0.9rem', color: 'var(--text-primary)', marginBottom: '0.35rem' }}>
                        {feat.name}
                      </div>
                      <div style={{ fontSize: '0.825rem', color: 'var(--text-secondary)', lineHeight: 1.55 }}>
                        {feat.desc}
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Verified Impact */}
              <div>
                <h3 style={{ fontSize: '1.1rem', fontWeight: 700, marginBottom: '0.85rem', color: 'var(--text-primary)' }}>
                  Verified Operational Impact
                </h3>
                <ul style={{ listStyle: 'none', display: 'flex', flexDirection: 'column', gap: '0.6rem' }}>
                  {project.verifiedImpact.map((impact, i) => (
                    <li key={i} style={{ display: 'flex', alignItems: 'flex-start', gap: '0.6rem', fontSize: '0.9rem', color: 'var(--text-secondary)' }}>
                      <CheckCircle2 size={16} color="var(--accent-primary)" style={{ flexShrink: 0, marginTop: '0.2rem' }} />
                      <span>{impact}</span>
                    </li>
                  ))}
                </ul>
              </div>
            </>
          )}

          {/* TAB 2: ARCHITECTURE TOPOLOGY */}
          {activeTab === 'architecture' && (
            <>
              <div style={{
                backgroundColor: '#0a0d14',
                padding: '1.5rem',
                borderRadius: 'var(--radius-md)',
                border: '1px solid var(--border-subtle)'
              }}>
                <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.75rem', color: 'var(--accent-primary)', marginBottom: '0.5rem' }}>
                  PATTERN: {project.architecture.pattern}
                </div>
                <div style={{ fontSize: '0.95rem', color: 'var(--text-primary)', fontWeight: 600, marginBottom: '1.5rem' }}>
                  End-to-End System Component Pipeline
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                  {project.architecture.components.map((comp, idx) => (
                    <div 
                      key={idx}
                      style={{
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                        padding: '1rem 1.25rem',
                        backgroundColor: 'rgba(255, 255, 255, 0.03)',
                        border: '1px solid var(--border-subtle)',
                        borderRadius: 'var(--radius-md)'
                      }}
                      className="topology-row"
                    >
                      <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                        <span style={{
                          fontFamily: 'var(--font-mono)',
                          fontSize: '0.75rem',
                          backgroundColor: 'rgba(45, 212, 191, 0.1)',
                          color: 'var(--accent-primary)',
                          padding: '0.2rem 0.5rem',
                          borderRadius: '4px'
                        }}>
                          0{idx + 1}
                        </span>
                        <div>
                          <div style={{ fontWeight: 600, color: 'var(--text-primary)', fontSize: '0.9rem' }}>
                            {comp.name}
                          </div>
                          <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.75rem', color: 'var(--accent-light)' }}>
                            {comp.tech}
                          </div>
                        </div>
                      </div>
                      <div style={{ fontSize: '0.825rem', color: 'var(--text-secondary)', textAlign: 'right' }}>
                        {comp.role}
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Data Flow Insight */}
              <div style={{
                padding: '1.25rem',
                backgroundColor: 'rgba(45, 212, 191, 0.04)',
                border: '1px solid var(--border-accent)',
                borderRadius: 'var(--radius-md)'
              }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: 'var(--accent-primary)', fontWeight: 600, marginBottom: '0.5rem' }}>
                  <Workflow size={16} />
                  <span>Asynchronous Execution Flow</span>
                </div>
                <p style={{ fontSize: '0.875rem', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                  Requests flow into Nginx reverse proxy with SSL termination and rate limiting, directed into Uvicorn ASGI workers. FastAPI handlers parse JSON through Pydantic v2 validation models. Database operations utilize asynchronous connection pools preventing blocking I/O, while state changes publish events into in-process WebSocket connection hubs for immediate client UI reflection.
                </p>
              </div>
            </>
          )}

          {/* TAB 3: DECISIONS & TRADE-OFFS */}
          {activeTab === 'decisions' && (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
              <div style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', marginBottom: '0.5rem' }}>
                Engineering rationale behind fundamental stack and structural choices:
              </div>

              {project.engineeringDecisions.map((item, idx) => (
                <div 
                  key={idx}
                  style={{
                    backgroundColor: '#151924',
                    border: '1px solid var(--border-subtle)',
                    borderRadius: 'var(--radius-md)',
                    padding: '1.25rem'
                  }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.6rem' }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      borderRadius: '50%',
                      backgroundColor: 'rgba(45, 212, 191, 0.15)',
                      color: 'var(--accent-primary)',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: '0.75rem',
                      fontFamily: 'var(--font-mono)',
                      fontWeight: 700
                    }}>
                      {idx + 1}
                    </div>
                    <h4 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                      {item.decision}
                    </h4>
                  </div>
                  <p style={{ fontSize: '0.875rem', color: 'var(--text-secondary)', lineHeight: 1.6, paddingLeft: '2rem' }}>
                    {item.rationale}
                  </p>
                </div>
              ))}
            </div>
          )}

          {/* TAB 4: TESTING & CONCURRENCY */}
          {activeTab === 'security' && (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
              <div>
                <h4 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '0.75rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                  <ShieldCheck size={18} color="var(--accent-emerald)" />
                  Automated Testing & Security Controls
                </h4>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                  {project.securityAndTesting.map((item, idx) => (
                    <div 
                      key={idx}
                      style={{
                        padding: '0.85rem 1rem',
                        backgroundColor: 'rgba(255, 255, 255, 0.02)',
                        border: '1px solid var(--border-subtle)',
                        borderRadius: 'var(--radius-md)',
                        fontSize: '0.875rem',
                        color: 'var(--text-secondary)',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '0.6rem'
                      }}
                    >
                      <CheckCircle2 size={15} color="var(--accent-primary)" style={{ flexShrink: 0 }} />
                      <span>{item}</span>
                    </div>
                  ))}
                </div>
              </div>

              {/* Code snippet of testing/validation */}
              <div style={{
                backgroundColor: '#0a0d14',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '1.25rem',
                fontFamily: 'var(--font-mono)',
                fontSize: '0.78rem'
              }}>
                <div style={{ color: 'var(--text-muted)', fontSize: '0.7rem', marginBottom: '0.5rem' }}>
                  # Pytest Asynchronous Integration Test Pattern
                </div>
                <div style={{ color: '#f43f5e' }}>@pytest.mark.asyncio</div>
                <div><span style={{ color: '#60a5fa' }}>async def</span> <span style={{ color: '#fbbf24' }}>test_unauthorized_ticket_dispatch_fails</span>(client: AsyncClient):</div>
                <div style={{ paddingLeft: '1.25rem', color: '#94a3b8' }}>
                  {'headers = {"Authorization": "Bearer invalid_token"}'}
                </div>
                <div style={{ paddingLeft: '1.25rem', color: '#94a3b8' }}>
                  {'response = '}<span style={{ color: '#60a5fa' }}>await</span>{' client.post("/api/v1/tickets", json={"id": 8842}, headers=headers)'}
                </div>
                <div style={{ paddingLeft: '1.25rem', color: '#2dd4bf' }}>
                  assert response.status_code == 401
                </div>
                <div style={{ paddingLeft: '1.25rem', color: '#2dd4bf' }}>
                  {'assert response.json()["detail"] == "Could not validate credentials"'}
                </div>
              </div>

              {/* Intellectual Property & Confidentiality Notice */}
              <div style={{
                fontSize: '0.75rem',
                color: 'var(--text-muted)',
                backgroundColor: 'rgba(0, 0, 0, 0.3)',
                padding: '0.85rem',
                borderRadius: 'var(--radius-md)',
                border: '1px solid var(--border-subtle)'
              }}>
                <strong>Confidentiality Note:</strong> Proprietary internal business schemas, enterprise credentials, and SPI Equipments client data have been sanitized. Architecture and engineering methodologies described represent verified individual engineering contributions.
              </div>
            </div>
          )}

        </div>

        {/* Footer Actions */}
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          padding: '1.25rem 2rem',
          borderTop: '1px solid var(--border-subtle)',
          backgroundColor: '#161b27'
        }}>
          <span style={{ fontSize: '0.8rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>
            STATUS: VERIFIED PRODUCTION CODE
          </span>

          <button
            onClick={onClose}
            className="btn btn-secondary btn-sm"
          >
            Close Deep-Dive
          </button>
        </div>

      </div>

      <style>{`
        @media (max-width: 768px) {
          .modal-two-col {
            grid-template-columns: 1fr !important;
          }
          .topology-row {
            flex-direction: column !important;
            align-items: flex-start !important;
            gap: 0.5rem !important;
          }
        }
      `}</style>
    </div>
  );
};
