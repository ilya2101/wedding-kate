<template>
  <footer class="footer">
    <div class="footer-container">
      <!-- Основной контент -->
      <div class="footer-content">
        <!-- Логотип и описание -->
        <div class="footer-brand">
          <h3 class="footer-logo">Wedding with Kate</h3>
          <p class="footer-tagline">Создаю атмосферные и спокойные свадьбы без стресса</p>
          <p class="footer-location">📍 Санкт-Петербург и Ленинградская область</p>
        </div>

        <!-- Навигация -->
        <div class="footer-nav">
          <h4>Навигация</h4>
          <ul>
            <li><router-link to="/">Главная</router-link></li>
            <li><router-link to="/about">Обо мне</router-link></li>
            <li><router-link to="/price">Прайс</router-link></li>
            <li><router-link to="/reviews">Отзывы</router-link></li>
            <li><router-link to="/contacts">Контакты</router-link></li>
          </ul>
        </div>

        <!-- Контакты -->
        <div class="footer-contacts">
          <h4>Контакты</h4>
          <ul>
            <li>
              <a href="tel:+79932100510">📞 +7 (993) 210-05-10</a>
            </li>
            <li>
              <a href="mailto:kate@weddingwithkate.ru">✉️ kate@weddingwithkate.ru</a>
            </li>
          </ul>
        </div>

        <!-- Соцсети -->
        <div class="footer-social">
          <h4>Я в соцсетях</h4>
          <div class="social-links">
            <a 
              href="https://vk.com/im/convo/307850408?entrypoint=conversations_search" 
              target="_blank" 
              class="social-link"
              aria-label="ВКонтакте"
            >
              ВКонтакте
            </a>
            <a 
              href="https://web.telegram.org/k/#@katerinaaesa" 
              target="_blank" 
              class="social-link"
              aria-label="Telegram"
            >
              Telegram
            </a>
          </div>
        </div>
      </div>

      <!-- Разделитель -->
      <div class="footer-divider"></div>

      <!-- Копирайт -->
      <div class="footer-bottom">
        <p>&copy; {{ currentYear }} Wedding with Kate. Все права защищены.</p>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'Footer',
  computed: {
    currentYear() {
      return new Date().getFullYear()
    }
  }
}
</script>

<style scoped>
.footer {
  background: rgba(45, 30, 30, 0.8);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border-top: 1px solid var(--glass-border);
  padding: 3rem 0 1.5rem;
  margin-top: auto;
}

.footer-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.footer-content {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1.5fr;
  gap: 3rem;
  margin-bottom: 2rem;
}

/* Бренд */
.footer-brand {
  padding-right: 2rem;
}

.footer-logo {
  font-family: var(--font-heading);
  font-size: 1.8rem;
  color: var(--color-cream-light);
  margin-bottom: 1rem;
  font-weight: 400;
}

.footer-tagline {
  color: var(--color-cream);
  margin-bottom: 0.5rem;
  font-size: 1rem;
}

.footer-location {
  color: var(--color-coffee-light);
  font-size: 0.95rem;
}

/* Навигация */
.footer-nav h4,
.footer-contacts h4,
.footer-social h4 {
  font-family: var(--font-heading);
  font-size: 1.1rem;
  color: var(--color-gold);
  margin-bottom: 1rem;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.footer-nav ul,
.footer-contacts ul {
  list-style: none;
  padding: 0;
}

.footer-nav li,
.footer-contacts li {
  margin-bottom: 0.8rem;
}

.footer-nav a,
.footer-contacts a {
  color: var(--color-cream);
  font-size: 0.95rem;
  transition: var(--transition-fast);
}

.footer-nav a:hover,
.footer-contacts a:hover {
  color: var(--color-gold);
  padding-left: 5px;
}

/* Соцсети */
.social-links {
  display: flex;
  flex-direction: column;
  gap: 0.8rem;
}

.social-link {
  display: inline-block;
  padding: 0.6rem 1.2rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: var(--border-radius-sm);
  color: var(--color-cream);
  text-decoration: none;
  transition: var(--transition-fast);
  text-align: center;
}

.social-link:hover {
  background: var(--color-gold-light);
  color: var(--color-cream-light);
  transform: translateX(5px);
}

/* Разделитель */
.footer-divider {
  height: 1px;
  background: var(--glass-border);
  margin: 2rem 0;
}

/* Копирайт */
.footer-bottom {
  text-align: center;
  padding-top: 1.5rem;
}

.footer-bottom p {
  color: var(--color-coffee-light);
  font-size: 0.9rem;
}

/* Адаптивность */
@media (max-width: 768px) {
  .footer {
    padding: 2rem 0 1rem;
  }

  .footer-container {
    padding: 0 1rem;
  }

  .footer-content {
    grid-template-columns: 1fr;
    gap: 2rem;
    text-align: center;
  }

  .footer-brand {
    padding-right: 0;
  }

  .social-links {
    align-items: center;
  }

  .footer-nav a:hover,
  .footer-contacts a:hover {
    padding-left: 0;
  }
}

@media (max-width: 480px) {
  .footer {
    padding: 1.5rem 0 1rem;
  }

  .footer-logo {
    font-size: 1.5rem;
  }

  .footer-tagline {
    font-size: 0.95rem;
  }

  .footer-nav h4,
  .footer-contacts h4,
  .footer-social h4 {
    font-size: 1rem;
  }

  .footer-nav a,
  .footer-contacts a {
    font-size: 0.9rem;
  }

  .social-link {
    padding: 0.5rem 1rem;
    font-size: 0.9rem;
  }
}

@media (max-width: 360px) {
  .footer-container {
    padding: 0 0.75rem;
  }

  .footer-logo {
    font-size: 1.3rem;
  }

  .footer-tagline {
    font-size: 0.85rem;
  }

  .footer-location {
    font-size: 0.85rem;
  }
}
</style>
