document.addEventListener('DOMContentLoaded', function() {
  // Mobile menu toggle
  const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
  const navLinks = document.querySelector('.nav-links');
  
  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', function() {
      this.classList.toggle('active');
      navLinks.classList.toggle('active');
      
      // Toggle menu button appearance
      const spans = this.querySelectorAll('span');
      if (this.classList.contains('active')) {
        spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
        spans[1].style.opacity = '0';
        spans[2].style.transform = 'rotate(-45deg) translate(7px, -7px)';
      } else {
        spans[0].style.transform = 'none';
        spans[1].style.opacity = '1';
        spans[2].style.transform = 'none';
      }
    });
  }
  
  // Initialize ClipboardJS for copy buttons
  if (typeof ClipboardJS !== 'undefined') {
    const clipboard = new ClipboardJS('.copy-btn');
    
    clipboard.on('success', function(e) {
      const originalText = e.trigger.innerHTML;
      e.trigger.innerHTML = '<i class="fas fa-check"></i>';
      
      setTimeout(function() {
        e.trigger.innerHTML = originalText;
      }, 2000);
      
      e.clearSelection();
    });
  }
  
  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      e.preventDefault();
      
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;
      
      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop - 80,
          behavior: 'smooth'
        });
        
        // Close mobile menu if open
        if (mobileMenuBtn && mobileMenuBtn.classList.contains('active')) {
          mobileMenuBtn.click();
        }
      }
    });
  });
  
  // Add active class to nav links based on scroll position
  const sections = document.querySelectorAll('section[id]');
  
  function highlightNavLink() {
    const scrollPosition = window.scrollY + 100;
    
    sections.forEach(section => {
      const sectionTop = section.offsetTop;
      const sectionHeight = section.offsetHeight;
      const sectionId = section.getAttribute('id');
      
      if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
        document.querySelector(`.nav-links a[href="#${sectionId}"]`)?.classList.add('active');
      } else {
        document.querySelector(`.nav-links a[href="#${sectionId}"]`)?.classList.remove('active');
      }
    });
  }
  
  window.addEventListener('scroll', highlightNavLink);
  
  // Add CSS for active nav links
  const style = document.createElement('style');
  style.textContent = `
    .nav-links a.active {
      color: var(--primary-color);
    }
    .nav-links a.active::after {
      width: 100%;
    }
    .nav-links.active {
      display: flex;
      flex-direction: column;
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background-color: var(--bg-color);
      padding: 1rem 2rem;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      z-index: 20;
      border-bottom: 1px solid var(--border-color);
    }
  `;
  document.head.appendChild(style);
  
  // Add animations with intersection observer
  const animateOnScroll = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate');
      }
    });
  }, { threshold: 0.1 });
  
  // Animate feature cards
  document.querySelectorAll('.feature-card').forEach((card, index) => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = `opacity 0.5s ease, transform 0.5s ease ${index * 0.1}s`;
    animateOnScroll.observe(card);
  });
  
  // Animate docs cards
  document.querySelectorAll('.docs-card').forEach((card, index) => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = `opacity 0.5s ease, transform 0.5s ease ${index * 0.1}s`;
    animateOnScroll.observe(card);
  });
  
  // Animate steps
  document.querySelectorAll('.step').forEach((step, index) => {
    step.style.opacity = '0';
    step.style.transform = 'translateX(-20px)';
    step.style.transition = `opacity 0.5s ease, transform 0.5s ease ${index * 0.2}s`;
    animateOnScroll.observe(step);
  });
  
  // Add CSS for animations
  const animationStyle = document.createElement('style');
  animationStyle.textContent = `
    .animate {
      opacity: 1 !important;
      transform: none !important;
    }
  `;
  document.head.appendChild(animationStyle);
  
  // Add dark mode toggle
  const footer = document.querySelector('footer');
  const darkModeToggle = document.createElement('button');
  darkModeToggle.className = 'dark-mode-toggle';
  darkModeToggle.innerHTML = '<i class="fas fa-moon"></i>';
  darkModeToggle.setAttribute('aria-label', 'Toggle dark mode');
  
  // Add dark mode toggle styles
  const darkModeStyles = document.createElement('style');
  darkModeStyles.textContent = `
    .dark-mode-toggle {
      position: fixed;
      bottom: 2rem;
      right: 2rem;
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
      background-color: var(--card-bg);
      color: var(--text-color);
      border: 1px solid var(--border-color);
      box-shadow: var(--card-shadow);
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      z-index: 100;
      transition: all 0.3s ease;
    }
    
    .dark-mode-toggle:hover {
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }
    
    body.dark-mode {
      --primary-color: #3B82F6;
      --primary-hover: #60A5FA;
      --secondary-color: #E5E7EB;
      --text-color: #F9FAFB;
      --text-light: #D1D5DB;
      --text-lighter: #9CA3AF;
      --bg-color: #111827;
      --bg-secondary: #1F2937;
      --border-color: #374151;
      --card-bg: #1F2937;
      --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.2), 0 2px 4px -1px rgba(0, 0, 0, 0.1);
    }
  `;
  document.head.appendChild(darkModeStyles);
  
  document.body.appendChild(darkModeToggle);
  
  // Check for saved theme preference or system preference
  const savedTheme = localStorage.getItem('theme');
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  
  if (savedTheme === 'dark' || (!savedTheme && prefersDark)) {
    document.body.classList.add('dark-mode');
    darkModeToggle.innerHTML = '<i class="fas fa-sun"></i>';
  }
  
  // Toggle dark mode
  darkModeToggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
    
    if (document.body.classList.contains('dark-mode')) {
      localStorage.setItem('theme', 'dark');
      darkModeToggle.innerHTML = '<i class="fas fa-sun"></i>';
    } else {
      localStorage.setItem('theme', 'light');
      darkModeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    }
  });
});
