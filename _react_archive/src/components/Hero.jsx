import React, { useState } from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  ArrowRight, 
  FileText, 
  CheckCircle2, 
  Zap, 
  Database, 
  Radio, 
  Server, 
  Cpu, 
  RefreshCw, 
  Copy, 
  ExternalLink 
} from 'lucide-react';

export const Hero = ({ onOpenResume }) => {
  const { personal, metrics } = portfolioData;
  const [copied, setCopied] = useState(false);

  // Interactive Architecture Simulation State
  const [activeTab, setActiveTab] = useState('pipeline'); // 'pipeline' | 'metrics'
  const [simulating, setSimulating] = useState(false);
  const [simulationLog, setSimulationLog] = useState([
    { id: 1, type: 'init', text: 'ASGI server initialized: Uvicorn running on uvloop (Python 3.11)', time: '0.00s' },
    { id: 2, type: 'db', text: 'PostgreSQL asyncpg pool established (min=5, max=20)', time: '+12ms' },
    { id: 3, type: 'ws', text: 'WebSocket PubSub broker mounted on /ws/dispatch', time: '+18ms' },
    { id: 4, type: 'ready', text: 'Status: 200 OK — Ready for high-concurrency ingestion', time: '+22ms' }
  ]);
  const [activeStep, setActiveStep] = useState(0);

  const handleCopyEmail = () => {
    navigator.clipboard.writeText(personal.email);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  const triggerSimulation = (scenario) => {
    if (simulating) return;
    setSimulating(true);
    setActiveStep(1);

    const now = new Date().toLocaleTimeString('en-US', { hour12: false, hour: '2-digit', minute: '2-digit', second: '2-digit' });

    let newLogs = [];
    if (scenario === 'fastapi_request') {
      newLogs = [
        { id: Date.now(), type: 'http', text: `[${now}] POST /api/v1/service-tickets (Pydantic validation: 0.8ms)`, time: 'Client' },
        { id: Date.now() + 1, type: 'auth', text: `[${now}] JWT Bearer validated (Role: Field_Dispatcher)`, time: 'FastAPI' },
        { id: Date.now() + 2, type: 'db', text: `[${now}] Async query: INSERT INTO service_tickets ... (4.2ms)`, time: 'Postgres' },
        { id: Date.now() + 3, type: 'ws', text: `[${now}] WebSocket broadcast to 8 technician channels`, time: 'PubSub' }
      ];
    } else if (scenario === 'websocket_event') {
      newLogs = [
        { id: Date.now(), type: 'ws', text: `[${now}] WS /ws/kds/orders: Order #1042 state -> COOKING`, time: 'KDS Client' },
        { id: Date.now() + 1, type: 'idempotent', text: `[${now}] Idempotency key verified: 0 duplicates detected`, time: 'FastAPI' },
        { id: Date.now() + 2, type: 'db', text: `[${now}] Station dispatch: Grill & Fryer screens updated (1.9ms)`, time: 'PubSub' },
        { id: Date.now() + 3, type: 'ready', text: `[${now}] Client ACK received with sub-20ms round-trip`, time: 'Complete' }
      ];
    } else {
      newLogs = [
        { id: Date.now(), type: 'concurrency', text: `[${now}] High-concurrency burst: 50 concurrent requests accepted`, time: 'Uvicorn' },
        { id: Date.now() + 1, type: 'db', text: `[${now}] Async connection pool checked out 14 workers cleanly`, time: 'AsyncPG' },
        { id: Date.now() + 2, type: 'ready', text: `[${now}] 100% requests resolved without thread-lock or blocking`, time: 'Resolved' }
      ];
    }

    let stepTimer = 1;
    const interval = setInterval(() => {
      stepTimer++;
      setActiveStep(stepTimer);
      if (stepTimer >= 4) {
        clearInterval(interval);
        setSimulationLog((prev) => [...newLogs, ...prev.slice(0, 4)]);
        setSimulating(false);
      }
    }, 400);
  };

  return (
    <section className="section-wrapper hero-section" style={{ paddingTop: '8.5rem', paddingBottom: '4.5rem' }}>
      <div className="container">
        <div style={{ display: 'grid', gridTemplateColumns: '1fr', gap: '3.5rem', alignItems: 'center' }} className="hero-grid">
          
          {/* Left Column: Executive Candidate Positioning */}
          <div>
            {/* Verification & Availability Pill */}
            <div style={{ display: 'inline-flex', alignItems: 'center', gap: '0.6rem', marginBottom: '1.25rem' }}>
              <span className="section-badge" style={{ margin: 0, display: 'inline-flex', alignItems: 'center', gap: '0.5rem' }}>
                <span 
                  className="status-pulse-dot"
                  style={{ 
                    width: '8px', 
                    height: '8px', 
                    borderRadius: '50%', 
                    backgroundColor: 'var(--accent-primary)',
                    display: 'inline-block' 
                  }} 
                />
                Available for Senior Backend & Full-Stack Roles
              </span>
            </div>

            {/* Target Role Designation */}
            <div style={{ 
              fontFamily: 'var(--font-mono)', 
              color: 'var(--accent-primary)', 
              fontSize: 'clamp(0.78rem, 2.5vw, 0.95rem)',
              fontWeight: 600,
              letterSpacing: '0.04em',
              textTransform: 'uppercase',
              marginBottom: '0.75rem',
              lineHeight: 1.5
            }}>
              Python Backend Engineer &bull; FastAPI Specialist &bull; Full-Stack Architect
            </div>

            {/* Headline */}
            <h1 style={{ 
              fontSize: 'clamp(1.9rem, 5.5vw, 3.6rem)', 
              fontWeight: 800, 
              lineHeight: 1.18,
              letterSpacing: '-0.03em',
              marginBottom: '1.5rem',
              color: 'var(--text-primary)',
              wordBreak: 'normal',
              overflowWrap: 'break-word'
            }}>
              Engineering high-concurrency <span className="text-gradient">FastAPI microservices</span> & real-time operational systems.
            </h1>

            {/* Executive Bio */}
            <p style={{ 
              fontSize: '1.125rem', 
              color: 'var(--text-secondary)', 
              lineHeight: 1.7,
              marginBottom: '2rem',
              maxWidth: '620px'
            }}>
              Software Engineer with <strong>~3 years of verified production experience</strong> at <strong style={{ color: 'var(--text-primary)' }}>SPI Equipments India</strong>. Specialized in asynchronous Python backends, real-time WebSocket pipelines, PostgreSQL query optimization, and production Flutter client applications.
            </p>

            {/* Verified Credentials Pills */}
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.6rem', marginBottom: '2.5rem' }}>
              <span className="tech-tag tech-tag-accent">
                <CheckCircle2 size={13} />
                SPI Equipments (~3 Yrs)
              </span>
              <span className="tech-tag">
                FastAPI & Python 3.11+
              </span>
              <span className="tech-tag">
                WebSockets & AsyncIO
              </span>
              <span className="tech-tag">
                PostgreSQL & MySQL
              </span>
              <span className="tech-tag">
                Flutter & Dart Clients
              </span>
              <span className="tech-tag">
                GenAI & RAG (pgvector)
              </span>
              <span className="tech-tag">
                Docker & Pytest
              </span>
            </div>

            {/* Action Buttons */}
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '1rem', alignItems: 'center' }}>
              <a href="#projects" className="btn btn-primary" id="hero-view-projects">
                <span>Explore Featured Projects</span>
                <ArrowRight size={16} />
              </a>

              <button 
                onClick={onOpenResume} 
                className="btn btn-secondary"
                id="hero-view-resume"
              >
                <FileText size={16} />
                <span>ATS-Friendly Résumé</span>
              </button>

              <button 
                onClick={handleCopyEmail}
                className="btn btn-outline"
                title="Copy email address"
                id="hero-copy-email"
              >
                {copied ? <CheckCircle2 size={16} color="var(--accent-primary)" /> : <Copy size={16} />}
                <span>{copied ? 'Email Copied!' : 'Copy Email'}</span>
              </button>
            </div>

            {/* Recruiter Meta Strip */}
            <div style={{ 
              display: 'flex', 
              alignItems: 'center', 
              gap: '1.5rem', 
              marginTop: '2rem',
              paddingTop: '1.5rem',
              borderTop: '1px solid var(--border-subtle)',
              fontSize: '0.85rem',
              color: 'var(--text-muted)'
            }}>
              <div>
                <span style={{ color: 'var(--text-secondary)' }}>Location:</span> Coimbatore, Tamil Nadu, India
              </div>
              <div>&bull;</div>
              <a 
                href="https://www.linkedin.com/in/maniananth23" 
                target="_blank" 
                rel="noopener"
                style={{ color: 'var(--accent-primary)', display: 'inline-flex', alignItems: 'center', gap: '0.3rem' }}
              >
                LinkedIn Verified Profile <ExternalLink size={13} />
              </a>
            </div>
          </div>

          {/* Right Column: Architectural Blueprint & Live ASGI Simulation */}
          <div className="hero-simulation">
            <div style={{
              background: 'linear-gradient(180deg, #131722 0%, #0d1017 100%)',
              border: '1px solid rgba(255, 255, 255, 0.1)',
              borderRadius: 'var(--radius-xl)',
              boxShadow: '0 20px 50px -10px rgba(0,0,0,0.7), 0 0 30px rgba(45, 212, 191, 0.08)',
              overflow: 'hidden'
            }}>
              
              {/* Header Bar */}
              <div style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                padding: '0.85rem 1.25rem',
                backgroundColor: 'rgba(255, 255, 255, 0.03)',
                borderBottom: '1px solid var(--border-subtle)'
              }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                  <div style={{ display: 'flex', gap: '6px' }}>
                    <div style={{ width: '10px', height: '10px', borderRadius: '50%', backgroundColor: '#ef4444' }} />
                    <div style={{ width: '10px', height: '10px', borderRadius: '50%', backgroundColor: '#f59e0b' }} />
                    <div style={{ width: '10px', height: '10px', borderRadius: '50%', backgroundColor: '#10b981' }} />
                  </div>
                  <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.78rem', color: 'var(--text-secondary)', marginLeft: '0.4rem' }}>
                    fastapi-system-blueprint.py
                  </span>
                </div>

                <div style={{ display: 'flex', gap: '0.5rem' }}>
                  <button
                    onClick={() => setActiveTab('pipeline')}
                    style={{
                      fontFamily: 'var(--font-mono)',
                      fontSize: '0.75rem',
                      padding: '0.25rem 0.6rem',
                      borderRadius: '4px',
                      backgroundColor: activeTab === 'pipeline' ? 'rgba(45, 212, 191, 0.15)' : 'transparent',
                      color: activeTab === 'pipeline' ? 'var(--accent-primary)' : 'var(--text-muted)',
                      border: activeTab === 'pipeline' ? '1px solid var(--border-accent)' : '1px solid transparent'
                    }}
                  >
                    Architecture Nodes
                  </button>
                  <button
                    onClick={() => setActiveTab('metrics')}
                    style={{
                      fontFamily: 'var(--font-mono)',
                      fontSize: '0.75rem',
                      padding: '0.25rem 0.6rem',
                      borderRadius: '4px',
                      backgroundColor: activeTab === 'metrics' ? 'rgba(45, 212, 191, 0.15)' : 'transparent',
                      color: activeTab === 'metrics' ? 'var(--accent-primary)' : 'var(--text-muted)',
                      border: activeTab === 'metrics' ? '1px solid var(--border-accent)' : '1px solid transparent'
                    }}
                  >
                    Live Telemetry
                  </button>
                </div>
              </div>

              {/* Topology Nodes Diagram */}
              {activeTab === 'pipeline' ? (
                <div style={{ padding: '1.5rem' }}>
                  {/* Animated Connecting Data Stream Bar */}
                  <div style={{ position: 'relative', width: '100%', height: '14px', marginBottom: '0.65rem' }}>
                    <svg width="100%" height="14" style={{ overflow: 'visible' }}>
                      <line 
                        x1="12%" 
                        y1="7" 
                        x2="88%" 
                        y2="7" 
                        stroke="rgba(255, 255, 255, 0.1)" 
                        strokeWidth="2" 
                      />
                      <line 
                        x1="12%" 
                        y1="7" 
                        x2="88%" 
                        y2="7" 
                        stroke="var(--accent-primary)" 
                        strokeWidth="2.5" 
                        className={`data-stream-path ${simulating ? 'accelerated' : ''}`}
                      />
                    </svg>
                  </div>

                  {/* Interactive Nodes Flow */}
                  <div style={{ 
                    display: 'grid', 
                    gridTemplateColumns: 'repeat(4, 1fr)', 
                    gap: '0.75rem',
                    marginBottom: '1.5rem',
                    position: 'relative'
                  }} className="nodes-flow">
                    
                    {/* Node 1: Client Layer */}
                    <div style={{
                      backgroundColor: activeStep === 1 ? 'rgba(45, 212, 191, 0.15)' : 'rgba(255, 255, 255, 0.03)',
                      border: activeStep === 1 ? '1px solid var(--accent-primary)' : '1px solid var(--border-subtle)',
                      borderRadius: 'var(--radius-md)',
                      padding: '0.85rem 0.65rem',
                      textAlign: 'center',
                      transition: 'all 0.2s'
                    }}>
                      <div style={{ color: 'var(--accent-sky)', display: 'flex', justifyContent: 'center', marginBottom: '0.4rem' }}>
                        <Radio size={18} />
                      </div>
                      <div style={{ fontWeight: 600, fontSize: '0.78rem', color: 'var(--text-primary)' }}>Clients</div>
                      <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.68rem', color: 'var(--text-muted)' }}>Flutter / Kiosk</div>
                    </div>

                    {/* Node 2: Gateway */}
                    <div style={{
                      backgroundColor: activeStep === 2 ? 'rgba(45, 212, 191, 0.15)' : 'rgba(255, 255, 255, 0.03)',
                      border: activeStep === 2 ? '1px solid var(--accent-primary)' : '1px solid var(--border-subtle)',
                      borderRadius: 'var(--radius-md)',
                      padding: '0.85rem 0.65rem',
                      textAlign: 'center',
                      transition: 'all 0.2s'
                    }}>
                      <div style={{ color: 'var(--accent-amber)', display: 'flex', justifyContent: 'center', marginBottom: '0.4rem' }}>
                        <Server size={18} />
                      </div>
                      <div style={{ fontWeight: 600, fontSize: '0.78rem', color: 'var(--text-primary)' }}>ASGI Gateway</div>
                      <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.68rem', color: 'var(--text-muted)' }}>Uvicorn / Nginx</div>
                    </div>

                    {/* Node 3: Core Service */}
                    <div style={{
                      backgroundColor: activeStep === 3 ? 'rgba(45, 212, 191, 0.25)' : 'rgba(45, 212, 191, 0.06)',
                      border: activeStep === 3 ? '1px solid var(--accent-primary)' : '1px solid var(--border-accent)',
                      borderRadius: 'var(--radius-md)',
                      padding: '0.85rem 0.65rem',
                      textAlign: 'center',
                      transition: 'all 0.2s',
                      boxShadow: activeStep === 3 ? '0 0 15px rgba(45, 212, 191, 0.3)' : 'none'
                    }}>
                      <div style={{ color: 'var(--accent-primary)', display: 'flex', justifyContent: 'center', marginBottom: '0.4rem' }}>
                        <Cpu size={18} />
                      </div>
                      <div style={{ fontWeight: 600, fontSize: '0.78rem', color: 'var(--accent-primary)' }}>FastAPI Engine</div>
                      <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.68rem', color: 'var(--text-secondary)' }}>AsyncIO & RBAC</div>
                    </div>

                    {/* Node 4: Database / Event Hub */}
                    <div style={{
                      backgroundColor: activeStep === 4 ? 'rgba(45, 212, 191, 0.15)' : 'rgba(255, 255, 255, 0.03)',
                      border: activeStep === 4 ? '1px solid var(--accent-primary)' : '1px solid var(--border-subtle)',
                      borderRadius: 'var(--radius-md)',
                      padding: '0.85rem 0.65rem',
                      textAlign: 'center',
                      transition: 'all 0.2s'
                    }}>
                      <div style={{ color: 'var(--accent-emerald)', display: 'flex', justifyContent: 'center', marginBottom: '0.4rem' }}>
                        <Database size={18} />
                      </div>
                      <div style={{ fontWeight: 600, fontSize: '0.78rem', color: 'var(--text-primary)' }}>Storage & WS</div>
                      <div style={{ fontFamily: 'var(--font-mono)', fontSize: '0.68rem', color: 'var(--text-muted)' }}>PostgreSQL Pool</div>
                    </div>

                  </div>

                  {/* Simulator Trigger Buttons */}
                  <div style={{ 
                    display: 'flex', 
                    alignItems: 'center', 
                    justifyContent: 'space-between',
                    backgroundColor: 'rgba(0, 0, 0, 0.3)',
                    padding: '0.6rem 0.85rem',
                    borderRadius: 'var(--radius-md)',
                    border: '1px solid var(--border-subtle)',
                    marginBottom: '1rem'
                  }}>
                    <span style={{ fontSize: '0.78rem', fontFamily: 'var(--font-mono)', color: 'var(--text-secondary)' }}>
                      Simulate Architecture Flow:
                    </span>
                    <div style={{ display: 'flex', gap: '0.4rem' }}>
                      <button
                        onClick={() => triggerSimulation('fastapi_request')}
                        disabled={simulating}
                        className="btn btn-sm btn-outline"
                        style={{ fontSize: '0.72rem', padding: '0.3rem 0.55rem' }}
                      >
                        <Zap size={12} color="var(--accent-primary)" />
                        FastAPI Request
                      </button>
                      <button
                        onClick={() => triggerSimulation('websocket_event')}
                        disabled={simulating}
                        className="btn btn-sm btn-outline"
                        style={{ fontSize: '0.72rem', padding: '0.3rem 0.55rem' }}
                      >
                        <Radio size={12} color="var(--accent-sky)" />
                        WS Broadcast
                      </button>
                      <button
                        onClick={() => triggerSimulation('concurrency')}
                        disabled={simulating}
                        className="btn btn-sm btn-outline"
                        style={{ fontSize: '0.72rem', padding: '0.3rem 0.55rem' }}
                      >
                        <RefreshCw size={12} color="var(--accent-amber)" />
                        Concurrent Pool
                      </button>
                    </div>
                  </div>

                  {/* Structured Execution Log */}
                  <div style={{
                    backgroundColor: '#07090c',
                    border: '1px solid var(--border-subtle)',
                    borderRadius: 'var(--radius-md)',
                    padding: '0.85rem',
                    fontFamily: 'var(--font-mono)',
                    fontSize: '0.74rem',
                    minHeight: '140px',
                    display: 'flex',
                    flexDirection: 'column',
                    gap: '0.4rem'
                  }}>
                    <div style={{ color: 'var(--text-muted)', fontSize: '0.7rem', display: 'flex', justifyContent: 'space-between', borderBottom: '1px solid rgba(255,255,255,0.06)', paddingBottom: '0.3rem' }}>
                      <span>ASGI PIPELINE TRACE</span>
                      <span>ENV: PRODUCTION-READY</span>
                    </div>
                    {simulationLog.map((log) => (
                      <div key={log.id} style={{ display: 'flex', alignItems: 'baseline', gap: '0.5rem', lineHeight: 1.4 }}>
                        <span style={{ color: 'var(--accent-primary)', fontSize: '0.7rem', minWidth: '45px' }}>{log.time}</span>
                        <span style={{ color: log.type === 'ready' ? 'var(--accent-light)' : 'var(--text-secondary)' }}>
                          {log.text}
                        </span>
                      </div>
                    ))}
                  </div>

                </div>
              ) : (
                /* Live Telemetry Tab */
                <div style={{ padding: '1.5rem' }}>
                  <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem', marginBottom: '1.5rem' }}>
                    <div style={{ backgroundColor: 'rgba(255,255,255,0.02)', padding: '1rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border-subtle)' }}>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>AVG REST RESPONSE</div>
                      <div style={{ fontSize: '1.75rem', fontWeight: 800, color: 'var(--accent-primary)', margin: '0.2rem 0' }}>18.4 ms</div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-secondary)' }}>AsyncIO non-blocking loop</div>
                    </div>
                    <div style={{ backgroundColor: 'rgba(255,255,255,0.02)', padding: '1rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border-subtle)' }}>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>WS LATENCY</div>
                      <div style={{ fontSize: '1.75rem', fontWeight: 800, color: 'var(--accent-light)', margin: '0.2rem 0' }}>&lt; 5 ms</div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-secondary)' }}>Direct memory broadcast</div>
                    </div>
                    <div style={{ backgroundColor: 'rgba(255,255,255,0.02)', padding: '1rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border-subtle)' }}>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>DB POOL UTILIZATION</div>
                      <div style={{ fontSize: '1.75rem', fontWeight: 800, color: 'var(--accent-sky)', margin: '0.2rem 0' }}>14 / 20</div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-secondary)' }}>Zero connection leakage</div>
                    </div>
                    <div style={{ backgroundColor: 'rgba(255,255,255,0.02)', padding: '1rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border-subtle)' }}>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>IDEMPOTENT SAFETY</div>
                      <div style={{ fontSize: '1.75rem', fontWeight: 800, color: 'var(--accent-emerald)', margin: '0.2rem 0' }}>100%</div>
                      <div style={{ fontSize: '0.75rem', color: 'var(--text-secondary)' }}>0 duplicate write states</div>
                    </div>
                  </div>

                  <div style={{ 
                    fontFamily: 'var(--font-mono)', 
                    fontSize: '0.75rem', 
                    color: 'var(--text-muted)', 
                    backgroundColor: 'rgba(0,0,0,0.3)', 
                    padding: '0.75rem', 
                    borderRadius: 'var(--radius-md)',
                    border: '1px solid var(--border-subtle)'
                  }}>
                    &bull; Architecture validated across real industrial servicing and restaurant ordering peak loads.
                  </div>
                </div>
              )}

              {/* Bottom Architectural Spec Footer */}
              <div style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                padding: '0.75rem 1.25rem',
                backgroundColor: 'rgba(0, 0, 0, 0.4)',
                borderTop: '1px solid var(--border-subtle)',
                fontFamily: 'var(--font-mono)',
                fontSize: '0.72rem',
                color: 'var(--text-muted)'
              }}>
                <span>STACK: FASTAPI &bull; UVICORN &bull; POSTGRES &bull; WEBSOCKETS</span>
                <span style={{ color: 'var(--accent-primary)' }}>TESTED VIA PYTEST</span>
              </div>

            </div>
          </div>

        </div>

        {/* Quick Stat Metric Banner */}
        <div style={{
          marginTop: '4rem',
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))',
          gap: '1.25rem'
        }}>
          {metrics.map((item, idx) => (
            <div 
              key={idx}
              style={{
                backgroundColor: 'var(--bg-card)',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-lg)',
                padding: '1.25rem 1.5rem',
                display: 'flex',
                flexDirection: 'column',
                gap: '0.25rem'
              }}
            >
              <div style={{ fontSize: '0.8rem', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>
                {item.label}
              </div>
              <div style={{ fontSize: '1.5rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                {item.value}
              </div>
              <div style={{ fontSize: '0.8rem', color: 'var(--text-secondary)' }}>
                {item.detail}
              </div>
            </div>
          ))}
        </div>

      </div>

      <style>{`
        @media (min-width: 1024px) {
          .hero-grid {
            grid-template-columns: 1.15fr 0.85fr !important;
          }
        }
        @media (max-width: 640px) {
          .nodes-flow {
            grid-template-columns: repeat(2, 1fr) !important;
          }
        }
      `}</style>
    </section>
  );
};
