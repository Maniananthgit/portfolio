import React, { useState } from 'react';
import { portfolioData } from '../data/portfolioData';
import { 
  Cpu, 
  Server, 
  Database, 
  Smartphone, 
  ShieldCheck, 
  Sparkles, 
  Cloud, 
  Code
} from 'lucide-react';

export const CompetencyMatrix = () => {
  const { competencies } = portfolioData;
  const [activeFilter, setActiveFilter] = useState('all');

  const categories = [
    { key: 'all', label: 'All Domains' },
    { key: 'backend', label: 'Backend Development', icon: Server },
    { key: 'database', label: 'Databases & Data Management', icon: Database },
    { key: 'aiGenAi', label: 'AI & Generative AI', icon: Sparkles },
    { key: 'cloudDevops', label: 'Cloud & DevOps', icon: Cloud },
    { key: 'testingQuality', label: 'Testing & Software Quality', icon: ShieldCheck },
    { key: 'frontendApp', label: 'Frontend & Application', icon: Smartphone },
    { key: 'softwareEng', label: 'Software Engineering', icon: Code },
  ];

  const getFilteredGroups = () => {
    if (activeFilter === 'all') {
      return [
        { title: 'Backend Development', items: competencies.backend, icon: Server },
        { title: 'Databases & Data Management', items: competencies.database, icon: Database },
        { title: 'AI & Generative AI', items: competencies.aiGenAi, icon: Sparkles },
        { title: 'Cloud & DevOps', items: competencies.cloudDevops, icon: Cloud },
        { title: 'Testing & Software Quality', items: competencies.testingQuality, icon: ShieldCheck },
        { title: 'Frontend & Application Development', items: competencies.frontendApp, icon: Smartphone },
        { title: 'Software Engineering Principles', items: competencies.softwareEng, icon: Code },
      ];
    }

    const match = categories.find(c => c.key === activeFilter);
    return [
      { title: match.label, items: competencies[activeFilter] || [], icon: match.icon }
    ];
  };

  return (
    <section id="skills" className="section-wrapper" style={{ borderTop: '1px solid var(--border-subtle)' }}>
      <div className="container">
        
        {/* Section Header */}
        <div className="reveal-on-scroll" style={{ maxWidth: '750px', marginBottom: '2.5rem' }}>
          <div className="section-badge">
            <Cpu size={14} />
            <span>Technical Competency Matrix</span>
          </div>
          <h2 className="section-title">
            Structured Stack Breakdown
          </h2>
          <p className="section-subtitle">
            Comprehensive breakdown of backend architecture, database optimization, Generative AI & vector search, DevOps, automated testing, and Flutter clients.
          </p>
        </div>

        {/* Filter Pills */}
        <div className="reveal-on-scroll stagger-1" style={{
          display: 'flex',
          flexWrap: 'wrap',
          gap: '0.6rem',
          marginBottom: '2.5rem'
        }}>
          {categories.map((cat) => (
            <button
              key={cat.key}
              onClick={() => setActiveFilter(cat.key)}
              style={{
                padding: '0.45rem 0.95rem',
                borderRadius: 'var(--radius-full)',
                fontSize: '0.825rem',
                fontWeight: 600,
                fontFamily: 'var(--font-mono)',
                backgroundColor: activeFilter === cat.key ? 'var(--accent-primary)' : 'var(--bg-card)',
                color: activeFilter === cat.key ? '#042f2e' : 'var(--text-secondary)',
                border: activeFilter === cat.key ? '1px solid var(--accent-primary)' : '1px solid var(--border-subtle)',
                cursor: 'pointer',
                transition: 'all var(--transition-fast)'
              }}
            >
              {cat.label}
            </button>
          ))}
        </div>

        {/* Competencies Grid */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '2rem' }}>
          {getFilteredGroups().map((group, gIdx) => (
            <div 
              key={gIdx}
              className="card-surface reveal-on-scroll stagger-2"
              style={{
                padding: '1.75rem',
                backgroundColor: '#131722',
                border: '1px solid var(--border-subtle)'
              }}
            >
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', marginBottom: '1.25rem' }}>
                <group.icon size={20} color="var(--accent-primary)" />
                <h3 style={{ fontSize: '1.2rem', fontWeight: 700, color: 'var(--text-primary)' }}>
                  {group.title}
                </h3>
              </div>

              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(auto-fill, minmax(260px, 1fr))',
                gap: '0.85rem'
              }}>
                {group.items.map((skill, sIdx) => {
                  const isCore = skill.level === 'Core Production' || skill.level === 'Core Specialization';
                  return (
                    <div
                      key={sIdx}
                      style={{
                        padding: '0.85rem 1rem',
                        backgroundColor: 'rgba(255, 255, 255, 0.02)',
                        border: isCore ? '1px solid rgba(45, 212, 191, 0.25)' : '1px solid var(--border-subtle)',
                        borderRadius: 'var(--radius-md)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                        transition: 'all 0.2s'
                      }}
                    >
                      <div>
                        <div style={{ fontWeight: 600, fontSize: '0.9rem', color: 'var(--text-primary)' }}>
                          {skill.name}
                        </div>
                        <div style={{ 
                          fontSize: '0.72rem', 
                          fontFamily: 'var(--font-mono)',
                          color: isCore ? 'var(--accent-light)' : 'var(--text-muted)',
                          marginTop: '0.15rem'
                        }}>
                          {skill.level}
                        </div>
                      </div>

                      <span style={{
                        fontFamily: 'var(--font-mono)',
                        fontSize: '0.75rem',
                        color: 'var(--text-secondary)',
                        backgroundColor: 'rgba(255, 255, 255, 0.04)',
                        padding: '0.2rem 0.5rem',
                        borderRadius: '4px'
                      }}>
                        {skill.years}
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>
          ))}
        </div>

        {/* Legend */}
        <div style={{
          display: 'flex',
          flexWrap: 'wrap',
          gap: '2rem',
          marginTop: '1.75rem',
          fontSize: '0.78rem',
          color: 'var(--text-muted)',
          fontFamily: 'var(--font-mono)'
        }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
            <span style={{ width: '8px', height: '8px', borderRadius: '50%', backgroundColor: 'var(--accent-primary)' }} />
            <span><strong>Core Production / Specialization:</strong> Commercial architectural use at SPI Equipments & modern AI stack</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
            <span style={{ width: '8px', height: '8px', borderRadius: '50%', backgroundColor: '#64748b' }} />
            <span><strong>Applied:</strong> Integrated across pipelines, infrastructure & tools</span>
          </div>
        </div>

      </div>
    </section>
  );
};
