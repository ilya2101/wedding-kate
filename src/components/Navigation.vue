<template>
  <nav class="navigation" :class="{ 'scrolled': isScrolled, 'mobile-open': isMobileMenuOpen }">
    <div class="nav-container">
      <!-- Логотип -->
      <router-link to="/" class="nav-logo">
        <span class="logo-text">Wedding with Kate</span>
      </router-link>

      <!-- Десктопное меню -->
      <div class="nav-menu">
        <router-link to="/" class="nav-link" active-class="active">Главная</router-link>
        <router-link to="/about" class="nav-link" active-class="active">Обо мне</router-link>
        <router-link to="/price" class="nav-link" active-class="active">Прайс</router-link>
        <router-link to="/reviews" class="nav-link" active-class="active">Отзывы</router-link>
        <router-link to="/contacts" class="nav-link" active-class="active">Контакты</router-link>
      </div>

      <!-- Кнопка мобильного меню -->
      <button class="mobile-toggle" @click="toggleMobileMenu" aria-label="Меню">
        <span class="hamburger"></span>
      </button>
    </div>

    <!-- Мобильное меню -->
    <div class="mobile-menu">
      <router-link to="/" class="mobile-link" @click="closeMobileMenu">Главная</router-link>
      <router-link to="/about" class="mobile-link" @click="closeMobileMenu">Обо мне</router-link>
      <router-link to="/price" class="mobile-link" @click="closeMobileMenu">Прайс</router-link>
      <router-link to="/reviews" class="mobile-link" @click="closeMobileMenu">Отзывы</router-link>
      <router-link to="/contacts" class="mobile-link" @click="closeMobileMenu">Контакты</router-link>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'Navigation',
  data() {
    return {
      isScrolled: false,
      isMobileMenuOpen: false
    }
  },
  mounted() {
    window.addEventListener('scroll', this.handleScroll)
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      this.isScrolled = window.scrollY > 50
    },
    toggleMobileMenu() {
      this.isMobileMenuOpen = !this.isMobileMenuOpen
    },
    closeMobileMenu() {
      this.isMobileMenuOpen = false
    }
  }
}
</script>

<style scoped>
.navigation {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: var(--nav-height);
  background: var(--nav-bg);
  backdrop-filter: blur(var(--nav-blur));
  -webkit-backdrop-filter: blur(var(--nav-blur));
  border-bottom: 1px solid var(--glass-border);
  z-index: 1000;
  transition: var(--transition-fast);
}

.navigation.scrolled {
  background: rgba(255, 255, 255, 0.15);
  box-shadow: var(--shadow-md);
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* Логотип */
.nav-logo {
  font-family: var(--font-heading);
  font-size: 1.5rem;
  color: var(--color-cream-light);
  text-decoration: none;
  transition: var(--transition-fast);
  font-weight: 400;
  letter-spacing: 1px;
}

.nav-logo:hover {
  color: var(--color-gold);
}

/* Десктопное меню */
.nav-menu {
  display: flex;
  gap: 0.5rem;
}

.nav-link {
  color: var(--color-cream);
  text-decoration: none;
  font-size: 1rem;
  font-weight: 400;
  padding: 0.6rem 1.2rem;
  border-radius: var(--border-radius-sm);
  transition: var(--transition-fast);
  background: transparent;
  border: 1px solid transparent;
}

.nav-link:hover {
  background: rgba(255, 255, 255, 0.1);
  border-color: var(--glass-border);
  color: var(--color-cream-light);
}

.nav-link.active {
  background: var(--color-gold-light);
  border-color: var(--color-gold);
  color: var(--color-cream-light);
}

/* Кнопка мобильного меню */
.mobile-toggle {
  display: none;
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 0.5rem;
  z-index: 1001;
}

.hamburger {
  display: block;
  width: 24px;
  height: 2px;
  background: var(--color-cream-light);
  position: relative;
  transition: var(--transition-fast);
}

.hamburger::before,
.hamburger::after {
  content: '';
  position: absolute;
  width: 24px;
  height: 2px;
  background: var(--color-cream-light);
  transition: var(--transition-fast);
}

.hamburger::before {
  top: -7px;
}

.hamburger::after {
  top: 7px;
}

/* Мобильное меню */
.mobile-menu {
  display: none;
  position: absolute;
  top: var(--nav-height);
  left: 0;
  width: 100%;
  background: rgba(61, 44, 44, 0.98);
  backdrop-filter: blur(20px);
  padding: 1rem 0;
  border-bottom: 1px solid var(--glass-border);
  box-shadow: var(--shadow-lg);
}

.mobile-link {
  display: block;
  padding: 1rem 2rem;
  color: var(--color-cream);
  text-decoration: none;
  transition: var(--transition-fast);
  border-left: 3px solid transparent;
}

.mobile-link:hover {
  background: rgba(255, 255, 255, 0.05);
  border-left-color: var(--color-gold);
  color: var(--color-cream-light);
}

/* Адаптивность */
@media (max-width: 768px) {
  :root {
    --nav-height: 60px;
  }

  .nav-container {
    padding: 0 1rem;
  }

  .nav-logo {
    font-size: 1.2rem;
  }

  .mobile-toggle {
    display: block;
    padding: 0.3rem;
  }

  .nav-menu {
    display: none;
  }

  .mobile-menu {
    display: none;
  }

  .navigation.mobile-open .mobile-menu {
    display: block;
    animation: slideDown 0.3s ease-out;
  }

  .navigation.mobile-open .hamburger {
    background: transparent;
  }

  .navigation.mobile-open .hamburger::before {
    top: 0;
    transform: rotate(45deg);
  }

  .navigation.mobile-open .hamburger::after {
    top: 0;
    transform: rotate(-45deg);
  }
}

@media (max-width: 480px) {
  .nav-logo {
    font-size: 1rem;
  }

  .nav-link {
    font-size: 0.9rem;
    padding: 0.5rem 0.8rem;
  }

  .mobile-link {
    padding: 0.8rem 1.5rem;
    font-size: 0.95rem;
  }
}

@media (max-width: 360px) {
  .nav-logo {
    font-size: 0.9rem;
  }

  .nav-container {
    padding: 0 0.75rem;
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
