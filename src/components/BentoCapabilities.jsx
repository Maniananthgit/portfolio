import React from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  Terminal, 
  Radio, 
  Database, 
  Smartphone, 
  ShieldCheck, 
  Cpu, 
  Activity, 
  Workflow
} from 'lucide-react';

export const BentoCapabilities = () => {
  const { engineeringCapabilities } = portfolioData;

  const getIcon = (id) => {
    switch (id) {
      case 'async-apis':
        return <Terminal size={24} color="var(--accent-primary)" />;
      case 'realtime-websockets':
        return <Radio size={24} color="var(--accent-light)" />;
      case 'database-engineering':
        return <Database size={24} color="var(--accent-sky)" />;
      case 'mobile-frontend':
        return <Smartphone size={24} color="var(--accent-emerald)" />;
      case 'devops-testing':
        return <ShieldCheck size={24} color="var(--accent-amber)" />;
      default:
        return <Cpu size={24} color="var(--accent-primary)" />;
    }
  };

  return (
    <section id="capabilities" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '3.5rem' }}>
          <div className="section-badge">
            <Workflow size={14} />
            <span>Architecture & Competencies</span>
          </div>
          <h2 className="section-title">
            Engineering Capabilities & Systems Mastery
          </h2>
          <p className="section-subtitle">
            Not just technology buzzwords, but concrete architectural competencies developed across production deployments at SPI Equipments India.
          </p>
        </div>

        {/* Asymmetric Bento Grid */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(12, 1fr)',
          gap: '1.5rem'
        }} className="bento-grid">
          
          {/* Card 1: Asynchronous High-Throughput APIs (Span 7 col) */}
          <div 
            className="card-surface bento-item-large reveal-on-scroll stagger-1"
            style={{
              gridColumn: 'span 7',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              background: 'linear-gradient(145deg, #161b26 0%, #11141c 100%)',
              border: '1px solid rgba(45, 212, 191, 0.25)',
              boxShadow: '0 10px 30px rgba(0, 0, 0, 0.4)'
            }}
          >
            <div>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '1.25rem' }}>
                <div style={{
                  width: '48px',
                  height: '48px',
                  borderRadius: 'var(--radius-md)',
                  backgroundColor: 'rgba(45, 212, 191, 0.12)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center'
                }}>
                  {getIcon('async-apis')}
                </div>
                <span style={{ 
                  fontFamily: 'var(--font-mono)', 
                  fontSize: '0.75rem', 
                  color: 'var(--accent-primary)',
                  backgroundColor: 'rgba(45, 212, 191, 0.08)',
                  padding: '0.25rem 0.65rem',
                  borderRadius: 'var(--radius-full)',
                  border: '1px solid var(--border-accent)'
                }}>
                  Core Specialization
                </span>
              </div>

              <div style={{ fontSize: '0.85rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.4rem' }}>
                ASGI & MICROSERVICES
              </div>
              <h3 style={{ fontSize: '1.5rem', fontWeight: 700, marginBottom: '0.85rem', color: 'var(--text-primary)' }}>
                {engineeringCapabilities[0].title}
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.975rem', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                {engineeringCapabilities[0].description}
              </p>

              {/* Concrete Architectural Code / Specs Snapshot */}
              <div style={{
                backgroundColor: '#0a0d14',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '1rem',
                fontFamily: 'var(--font-mono)',
                fontSize: '0.78rem',
                color: '#a5b4fc',
                marginBottom: '1.5rem',
                lineHeight: 1.5
              }}>
                <div style={{ color: 'var(--text-muted)', fontSize: '0.7rem', marginBottom: '0.3rem' }}># FastAPI Async Endpoint Paradigm</div>
                <div><span style={{ color: '#f43f5e' }}>@router.post</span>(<span style={{ color: '#2dd4bf' }}>"/tickets"</span>, response_model=TicketOut, status_code=201)</div>
                <div><span style={{ color: '#60a5fa' }}>async def</span> <span style={{ color: '#fbbf24' }}>create_ticket</span>(payload: TicketCreate, db: AsyncSession = Depends(get_db)):</div>
                <div style={{ paddingLeft: '1.25rem', color: '#94a3b8' }}>result = <span style={{ color: '#60a5fa' }}>await</span> service_layer.dispatch_job(db, payload)</div>
                <div style={{ paddingLeft: '1.25rem', color: '#94a3b8' }}><span style={{ color: '#60a5fa' }}>await</span> websocket_hub.broadcast_event(result)</div>
                <div style={{ paddingLeft: '1.25rem', color: '#60a5fa' }}>return <span style={{ color: '#f8fafc' }}>result</span></div>
              </div>
            </div>

            <div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.5rem', marginBottom: '1rem' }}>
                {engineeringCapabilities[0].tags.map((tag, i) => (
                  <span key={i} className="tech-tag tech-tag-accent">{tag}</span>
                ))}
              </div>
              <div style={{ fontSize: '0.825rem', color: 'var(--accent-light)', display: 'flex', alignItems: 'center', gap: '0.4rem', fontFamily: 'var(--font-mono)' }}>
                <Activity size={14} />
                <span>{engineeringCapabilities[0].highlight}</span>
              </div>
            </div>
          </div>

          {/* Card 2: Real-time WebSockets & Event Streaming (Span 5 col) */}
          <div 
            className="card-surface bento-item-medium reveal-on-scroll stagger-2"
            style={{
              gridColumn: 'span 5',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              background: 'linear-gradient(145deg, #141822 0%, #10131b 100%)'
            }}
          >
            <div>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '1.25rem' }}>
                <div style={{
                  width: '48px',
                  height: '48px',
                  borderRadius: 'var(--radius-md)',
                  backgroundColor: 'rgba(56, 189, 248, 0.1)',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center'
                }}>
                  {getIcon('realtime-websockets')}
                </div>
                <span style={{ fontFamily: 'var(--font-mono)', fontSize: '0.72rem', color: 'var(--accent-sky)' }}>
                  SUB-SECOND SYNC
                </span>
              </div>

              <div style={{ fontSize: '0.85rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.4rem' }}>
                REAL-TIME EVENT BUS
              </div>
              <h3 style={{ fontSize: '1.35rem', fontWeight: 700, marginBottom: '0.75rem', color: 'var(--text-primary)' }}>
                {engineeringCapabilities[1].title}
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.925rem', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                {engineeringCapabilities[1].description}
              </p>

              {/* Architecture highlights bullet */}
              <div style={{
                backgroundColor: 'rgba(255, 255, 255, 0.02)',
                border: '1px solid var(--border-subtle)',
                borderRadius: 'var(--radius-md)',
                padding: '0.85rem',
                fontSize: '0.8rem',
                color: 'var(--text-secondary)',
                marginBottom: '1.25rem',
                lineHeight: 1.5
              }}>
                <div>&bull; Client heartbeat monitoring & automatic reconnect backoff</div>
                <div>&bull; Channel segmentation by station & technician queue</div>
                <div>&bull; In-memory state persistence buffer during disconnects</div>
              </div>
            </div>

            <div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.4rem', marginBottom: '0.85rem' }}>
                {engineeringCapabilities[1].tags.map((tag, i) => (
                  <span key={i} className="tech-tag">{tag}</span>
                ))}
              </div>
              <div style={{ fontSize: '0.8rem', color: 'var(--accent-sky)', fontFamily: 'var(--font-mono)' }}>
                {engineeringCapabilities[1].highlight}
              </div>
            </div>
          </div>

          {/* Card 3: Relational Schema Design & Query Optimization (Span 4 col) */}
          <div 
            className="card-surface bento-item-small reveal-on-scroll stagger-3"
            style={{
              gridColumn: 'span 4',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between'
            }}
          >
            <div>
              <div style={{
                width: '44px',
                height: '44px',
                borderRadius: 'var(--radius-md)',
                backgroundColor: 'rgba(16, 185, 129, 0.1)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                marginBottom: '1.2rem'
              }}>
                {getIcon('database-engineering')}
              </div>

              <div style={{ fontSize: '0.8rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.3rem' }}>
                DATA ARCHITECTURE
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: '0.75rem', color: 'var(--text-primary)' }}>
                {engineeringCapabilities[2].title}
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                {engineeringCapabilities[2].description}
              </p>
            </div>

            <div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.4rem', marginBottom: '0.85rem' }}>
                {engineeringCapabilities[2].tags.map((tag, i) => (
                  <span key={i} className="tech-tag">{tag}</span>
                ))}
              </div>
              <div style={{ fontSize: '0.78rem', color: 'var(--accent-emerald)', fontFamily: 'var(--font-mono)' }}>
                {engineeringCapabilities[2].highlight}
              </div>
            </div>
          </div>

          {/* Card 4: Production Flutter & Dart Client Development (Span 4 col) */}
          <div 
            className="card-surface bento-item-small reveal-on-scroll stagger-4"
            style={{
              gridColumn: 'span 4',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between'
            }}
          >
            <div>
              <div style={{
                width: '44px',
                height: '44px',
                borderRadius: 'var(--radius-md)',
                backgroundColor: 'rgba(56, 189, 248, 0.1)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                marginBottom: '1.2rem'
              }}>
                {getIcon('mobile-frontend')}
              </div>

              <div style={{ fontSize: '0.8rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.3rem' }}>
                CROSS-PLATFORM CLIENTS
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: '0.75rem', color: 'var(--text-primary)' }}>
                {engineeringCapabilities[3].title}
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                {engineeringCapabilities[3].description}
              </p>
            </div>

            <div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.4rem', marginBottom: '0.85rem' }}>
                {engineeringCapabilities[3].tags.map((tag, i) => (
                  <span key={i} className="tech-tag">{tag}</span>
                ))}
              </div>
              <div style={{ fontSize: '0.78rem', color: 'var(--accent-light)', fontFamily: 'var(--font-mono)' }}>
                {engineeringCapabilities[3].highlight}
              </div>
            </div>
          </div>

          {/* Card 5: Containerized Environments & Automated Testing (Span 4 col) */}
          <div 
            className="card-surface bento-item-small reveal-on-scroll stagger-5"
            style={{
              gridColumn: 'span 4',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between'
            }}
          >
            <div>
              <div style={{
                width: '44px',
                height: '44px',
                borderRadius: 'var(--radius-md)',
                backgroundColor: 'rgba(245, 158, 11, 0.1)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                marginBottom: '1.2rem'
              }}>
                {getIcon('devops-testing')}
              </div>

              <div style={{ fontSize: '0.8rem', fontFamily: 'var(--font-mono)', color: 'var(--text-muted)', marginBottom: '0.3rem' }}>
                DEVOPS & RELIABILITY
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 700, marginBottom: '0.75rem', color: 'var(--text-primary)' }}>
                {engineeringCapabilities[4].title}
              </h3>
              <p style={{ color: 'var(--text-secondary)', fontSize: '0.9rem', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                {engineeringCapabilities[4].description}
              </p>
            </div>

            <div>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.4rem', marginBottom: '0.85rem' }}>
                {engineeringCapabilities[4].tags.map((tag, i) => (
                  <span key={i} className="tech-tag">{tag}</span>
                ))}
              </div>
              <div style={{ fontSize: '0.78rem', color: 'var(--accent-amber)', fontFamily: 'var(--font-mono)' }}>
                {engineeringCapabilities[4].highlight}
              </div>
            </div>
          </div>

        </div>

      </div>

      <style>{`
        @media (max-width: 1024px) {
          .bento-grid {
            grid-template-columns: repeat(6, 1fr) !important;
          }
          .bento-item-large {
            grid-column: span 6 !important;
          }
          .bento-item-medium {
            grid-column: span 6 !important;
          }
          .bento-item-small {
            grid-column: span 3 !important;
          }
        }
        @media (max-width: 768px) {
          .bento-grid {
            grid-template-columns: 1fr !important;
          }
          .bento-item-large, .bento-item-medium, .bento-item-small {
            grid-column: span 1 !important;
          }
        }
      `}</style>
    </section>
  );
};
