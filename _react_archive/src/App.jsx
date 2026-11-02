import React, { useState, useEffect } from 'react';
import { Header } from './components/Header';
import { Hero } from './components/Hero';
import { BentoCapabilities } from './components/BentoCapabilities';
import { ProjectShowcase } from './components/ProjectShowcase';
import { ExperienceTimeline } from './components/ExperienceTimeline';
import { CompetencyMatrix } from './components/CompetencyMatrix';
import { EngineeringPrinciples } from './components/EngineeringPrinciples';
import { AboutEducation } from './components/AboutEducation';
import { ContactSection } from './components/ContactSection';
import { Footer } from './components/Footer';
import { AtsResumeModal } from './components/AtsResumeModal';
import './App.css';

function App() {
  const [showResumeModal, setShowResumeModal] = useState(false);
  const [activeSection, setActiveSection] = useState('hero');

  // Track active section for header highlighting
  useEffect(() => {
    const handleScroll = () => {
      const sections = ['projects', 'capabilities', 'experience', 'skills', 'principles', 'about', 'contact'];
      const scrollPosition = window.scrollY + 200;

      for (const sectionId of sections) {
        const element = document.getElementById(sectionId);
        if (element) {
          const top = element.offsetTop;
          const height = element.offsetHeight;
          if (scrollPosition >= top && scrollPosition < top + height) {
            setActiveSection(sectionId);
            break;
          }
        }
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  // Ambient mouse spotlight tracker
  useEffect(() => {
    let frameId;
    const handlePointerMove = (e) => {
      cancelAnimationFrame(frameId);
      frameId = requestAnimationFrame(() => {
        document.documentElement.style.setProperty('--mouse-x', `${e.clientX}px`);
        document.documentElement.style.setProperty('--mouse-y', `${e.clientY}px`);
      });
    };

    window.addEventListener('pointermove', handlePointerMove, { passive: true });
    return () => {
      window.removeEventListener('pointermove', handlePointerMove);
      cancelAnimationFrame(frameId);
    };
  }, []);

  // Card spotlight position tracker
  useEffect(() => {
    const handleCardSpotlight = (e) => {
      const cards = document.querySelectorAll('.card-surface');
      cards.forEach((card) => {
        const rect = card.getBoundingClientRect();
        // Only update if card is visible near cursor
        if (
          e.clientX >= rect.left - 100 &&
          e.clientX <= rect.right + 100 &&
          e.clientY >= rect.top - 100 &&
          e.clientY <= rect.bottom + 100
        ) {
          card.style.setProperty('--card-mouse-x', `${e.clientX - rect.left}px`);
          card.style.setProperty('--card-mouse-y', `${e.clientY - rect.top}px`);
        }
      });
    };

    window.addEventListener('mousemove', handleCardSpotlight, { passive: true });
    return () => window.removeEventListener('mousemove', handleCardSpotlight);
  }, []);

  // Automated Scroll-Driven Reveal Observer
  useEffect(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-revealed');
        }
      });
    }, {
      threshold: 0.1,
      rootMargin: '0px 0px -40px 0px'
    });

    const elements = document.querySelectorAll('.reveal-on-scroll');
    elements.forEach((el) => observer.observe(el));

    return () => observer.disconnect();
  }, []);

  // Close modals on Escape key
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === 'Escape') {
        setShowResumeModal(false);
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  return (
    <div className="portfolio-app">
      {/* Background Ambient Glowing Orbs */}
      <div 
        className="ambient-glow-orb" 
        style={{ top: '8%', left: '15%' }} 
        aria-hidden="true" 
      />
      <div 
        className="ambient-glow-orb" 
        style={{ top: '45%', right: '10%', animationDelay: '-7s', background: 'radial-gradient(circle, rgba(56, 189, 248, 0.05) 0%, transparent 70%)' }} 
        aria-hidden="true" 
      />
      <div 
        className="ambient-glow-orb" 
        style={{ top: '75%', left: '25%', animationDelay: '-12s' }} 
        aria-hidden="true" 
      />

      {/* Premium Sticky Navigation */}
      <Header 
        onOpenResume={() => setShowResumeModal(true)} 
        activeSection={activeSection}
      />

      <main>
        {/* Executive Hero with Live ASGI Blueprint */}
        <Hero 
          onOpenResume={() => setShowResumeModal(true)} 
        />

        {/* Featured Projects with Deep-Dive Case Studies */}
        <ProjectShowcase />

        {/* Engineering Capabilities Asymmetric Bento Grid */}
        <BentoCapabilities />

        {/* Verified Commercial Experience Timeline */}
        <ExperienceTimeline />

        {/* Technical Competency Matrix */}
        <CompetencyMatrix />

        {/* Architectural Principles & Decisions */}
        <EngineeringPrinciples />

        {/* Candidate Profile, Background & Education */}
        <AboutEducation />

        {/* Recruiter Contact Channel */}
        <ContactSection 
          onOpenResume={() => setShowResumeModal(true)} 
        />
      </main>

      {/* Recruiter-Focused Footer */}
      <Footer 
        onOpenResume={() => setShowResumeModal(true)} 
      />

      {/* ATS-Standard Printable Résumé Modal */}
      {showResumeModal && (
        <AtsResumeModal 
          onClose={() => setShowResumeModal(false)} 
        />
      )}
    </div>
  );
}

export default App;
