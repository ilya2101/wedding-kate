<template>
  <div class="home-page">
    <div class="home-container">
      <!-- Заголовок -->
      <div class="home-header">
        <h1 class="main-title">Wedding with Kate</h1>
        <p class="main-subtitle">Профессиональная организация свадебных торжеств в Санкт-Петербурге и Ленинградской области</p>
      </div>

      <!-- Основной контент -->
      <div class="home-content">
        <!-- Приветственный блок -->
        <GlassCard class="welcome-block">
          <h2>Добро пожаловать в мир идеальных свадеб</h2>
          <p>Профессиональная организация свадебных торжеств в Санкт-Петербурге и Ленинградской области</p>
        </GlassCard>

        <!-- География работы -->
        <GlassCard class="geo-block">
          <div class="geo-icon">📍</div>
          <div class="geo-text">
            <h3>Работаю в Санкт-Петербурге и ЛО</h3>
            <p>Провожу свадьбы в лучших locations города и области</p>
          </div>
        </GlassCard>

        <!-- Услуги -->
        <GlassCard class="services-block">
          <h3>Мои услуги</h3>
          <div class="services-list">
            <div class="service-item" v-for="service in services" :key="service.id">
              <div class="service-icon">{{ service.icon }}</div>
              <div class="service-info">
                <h4>{{ service.title }}</h4>
                <p>{{ service.description }}</p>
              </div>
            </div>
          </div>
        </GlassCard>

        <!-- Форма обратной связи -->
        <GlassCard class="contact-form">
          <h3>Забронируйте дату</h3>
          <p>Оставьте заявку и я свяжусь с вами для консультации</p>

          <form @submit.prevent="submitContactForm" class="contact-form-fields">
            <div class="form-group">
              <input
                type="text"
                v-model="contactForm.name"
                required
                placeholder="Ваше имя"
                class="form-input"
              >
            </div>

            <div class="form-group">
              <input
                type="tel"
                v-model="contactForm.phone"
                required
                placeholder="Номер телефона"
                class="form-input"
              >
            </div>

            <div class="form-group">
              <input
                type="date"
                v-model="contactForm.weddingDate"
                class="form-input"
              >
            </div>

            <button type="submit" class="btn btn-primary">Отправить заявку</button>
          </form>
        </GlassCard>

        <!-- Галерея -->
        <GlassCard class="gallery-block">
          <h3>Мои работы</h3>
          <div class="gallery-grid">
            <div class="photo-item" v-for="photo in photos" :key="photo.id">
              <img :src="photo.src" :alt="photo.alt" class="gallery-photo">
            </div>
          </div>
        </GlassCard>

        <!-- Статистика -->
        <GlassCard class="stats-block">
          <div class="stat-item" v-for="stat in stats" :key="stat.id">
            <div class="stat-number">{{ stat.number }}+</div>
            <div class="stat-label">{{ stat.label }}</div>
          </div>
        </GlassCard>
      </div>
    </div>
  </div>
</template>

<script>
import GlassCard from '@/components/GlassCard.vue'

export default {
  name: 'Home',
  components: {
    GlassCard
  },
  data() {
    return {
      contactForm: {
        name: '',
        phone: '',
        weddingDate: ''
      },
      services: [
        {
          id: 1,
          icon: '💒',
          title: 'Полная организация',
          description: 'От идеи до реализации под ключ'
        },
        {
          id: 2,
          icon: '📸',
          title: 'Свадебная фотосессия',
          description: 'Профессиональная съемка лучших моментов'
        },
        {
          id: 3,
          icon: '🎪',
          title: 'Decoration & Design',
          description: 'Уникальное оформление в выбранном стиле'
        },
        {
          id: 4,
          icon: '🎭',
          title: 'Ведущие и артисты',
          description: 'Подбор профессиональной команды'
        }
      ],
      stats: [
        { id: 1, number: '150', label: 'свадеб' },
        { id: 2, number: '7', label: 'лет опыта' },
        { id: 3, number: '50', label: 'городов' },
        { id: 4, number: '99', label: 'клиентов довольны' }
      ],
      photos: [
        { id: 1, src: require('@/assets/1.jpg'), alt: 'Свадебная церемония' },
        { id: 2, src: require('@/assets/2.jpg'), alt: 'Молодожены' },
        { id: 3, src: require('@/assets/3.jpg'), alt: 'Свадебный банкет' },
        { id: 4, src: require('@/assets/4.jpg'), alt: 'Детали свадьбы' },
        { id: 5, src: require('@/assets/5.jpg'), alt: 'Детали свадьбы' },
        { id: 6, src: require('@/assets/6.jpg'), alt: 'Детали свадьбы' }
      ]
    }
  },
  methods: {
    submitContactForm() {
      console.log('Форма отправлена:', this.contactForm)
      alert('Спасибо за вашу заявку! Я свяжусь с вами в ближайшее время.')
      this.contactForm = {
        name: '',
        phone: '',
        weddingDate: ''
      }
    }
  }
}
</script>

<style scoped>
.home-page {
  padding: 3rem 0;
  min-height: calc(100vh - var(--nav-height));
}

.home-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.home-header {
  text-align: center;
  padding: 2rem 0 3rem;
}

.main-title {
  font-size: 4rem;
  color: var(--color-cream-light);
  font-weight: 300;
  letter-spacing: 4px;
  margin-bottom: 1rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3), 0 4px 20px rgba(0, 0, 0, 0.2);
  font-family: var(--font-heading);
}

.main-subtitle {
  font-size: 1.2rem;
  color: var(--color-cream);
  max-width: 700px;
  margin: 0 auto;
}

/* Контент */
.home-content {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Приветственный блок */
.welcome-block {
  text-align: center;
  padding: 2.5rem !important;
}

.welcome-block h2 {
  font-size: 2.2rem;
  margin-bottom: 1rem;
}

.welcome-block p {
  font-size: 1.2rem;
}

/* География */
.geo-block {
  display: flex;
  align-items: center;
  gap: 2rem;
  padding: 2rem !important;
}

.geo-icon {
  font-size: 4rem;
  flex-shrink: 0;
}

.geo-text h3 {
  font-size: 1.6rem;
  margin-bottom: 0.5rem;
}

.geo-text p {
  font-size: 1rem;
}

/* Услуги */
.services-block {
  padding: 2.5rem !important;
}

.services-block h3 {
  text-align: center;
  margin-bottom: 2rem;
  font-size: 2rem;
}

.services-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 1.5rem;
}

.service-item {
  display: flex;
  align-items: flex-start;
  gap: 1.2rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: var(--border-radius-md);
  transition: var(--transition-fast);
}

.service-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-3px);
}

.service-icon {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.service-info h4 {
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
  color: var(--color-cream-light);
}

.service-info p {
  font-size: 0.95rem;
}

/* Форма */
.contact-form {
  text-align: center;
  padding: 2.5rem !important;
}

.contact-form h3 {
  font-size: 1.8rem;
  margin-bottom: 0.8rem;
}

.contact-form p {
  margin-bottom: 1.5rem;
  font-size: 1rem;
}

.contact-form-fields {
  max-width: 400px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

/* Галерея */
.gallery-block {
  padding: 2.5rem !important;
}

.gallery-block h3 {
  text-align: center;
  margin-bottom: 2rem;
  font-size: 2rem;
}

.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
}

.photo-item {
  aspect-ratio: 4/3;
  border-radius: var(--border-radius-md);
  overflow: hidden;
  transition: var(--transition-fast);
}

.gallery-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform var(--transition-fast);
}

.photo-item:hover {
  transform: translateY(-5px);
  box-shadow: var(--shadow-lg);
}

.photo-item:hover .gallery-photo {
  transform: scale(1.05);
}

/* Статистика */
.stats-block {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
  gap: 1.5rem;
  text-align: center;
  padding: 2rem !important;
}

.stat-item {
  padding: 1.5rem 1rem;
}

.stat-number {
  font-size: 2.5rem;
  color: var(--color-cream-light);
  font-weight: 300;
  margin-bottom: 0.5rem;
  font-family: var(--font-heading);
}

.stat-label {
  color: var(--color-cream);
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* ========================================
   АДАПТИВНОСТЬ
   ======================================== */

/* Планшеты */
@media (max-width: 1024px) {
  .home-container {
    padding: 0 1.5rem;
  }

  .main-title {
    font-size: 3rem;
  }

  .services-list {
    grid-template-columns: repeat(2, 1fr);
  }

  .gallery-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* Мобильные устройства (большие) */
@media (max-width: 768px) {
  .home-page {
    padding: 2rem 0;
  }

  .home-container {
    padding: 0 1rem;
    gap: 1.5rem;
  }

  .home-header {
    padding: 1.5rem 0 2rem;
  }

  .main-title {
    font-size: 2.2rem;
    letter-spacing: 2px;
  }

  .main-subtitle {
    font-size: 1rem;
  }

  .welcome-block {
    padding: 1.5rem !important;
  }

  .welcome-block h2 {
    font-size: 1.5rem;
  }

  .welcome-block p {
    font-size: 1rem;
  }

  /* География на мобильном */
  .geo-block {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
    padding: 1.5rem !important;
  }

  .geo-icon {
    font-size: 3rem;
  }

  .geo-text h3 {
    font-size: 1.3rem;
  }

  .geo-text p {
    font-size: 0.95rem;
  }

  /* Услуги на мобильном */
  .services-block {
    padding: 1.5rem !important;
  }

  .services-block h3 {
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
  }

  .services-list {
    grid-template-columns: 1fr;
    gap: 1rem;
  }

  .service-item {
    flex-direction: row;
    text-align: left;
    padding: 1.2rem;
    gap: 1rem;
  }

  .service-icon {
    font-size: 2rem;
  }

  .service-info h4 {
    font-size: 1.1rem;
  }

  .service-info p {
    font-size: 0.9rem;
  }

  /* Форма на мобильном */
  .contact-form {
    padding: 1.5rem !important;
  }

  .contact-form h3 {
    font-size: 1.4rem;
  }

  .contact-form p {
    font-size: 0.95rem;
  }

  .contact-form-fields {
    gap: 0.8rem;
  }

  .form-input {
    padding: 0.9rem 1.2rem;
    font-size: 0.95rem;
  }

  .btn {
    padding: 0.9rem 1.5rem;
    font-size: 1rem;
  }

  /* Галерея на мобильном */
  .gallery-block {
    padding: 1.5rem !important;
  }

  .gallery-block h3 {
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
  }

  .gallery-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 0.8rem;
  }

  /* Статистика на мобильном */
  .stats-block {
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
    padding: 1.5rem !important;
  }

  .stat-item {
    padding: 1rem 0.5rem;
  }

  .stat-number {
    font-size: 2rem;
  }

  .stat-label {
    font-size: 0.8rem;
  }
}

/* Маленькие мобильные устройства */
@media (max-width: 480px) {
  .main-title {
    font-size: 1.8rem;
    letter-spacing: 1px;
  }

  .main-subtitle {
    font-size: 0.9rem;
  }

  .welcome-block h2 {
    font-size: 1.3rem;
  }

  .geo-icon {
    font-size: 2.5rem;
  }

  .geo-text h3 {
    font-size: 1.2rem;
  }

  .services-block h3,
  .gallery-block h3 {
    font-size: 1.3rem;
  }

  .service-item {
    padding: 1rem;
    gap: 0.8rem;
  }

  .service-icon {
    font-size: 1.8rem;
  }

  .service-info h4 {
    font-size: 1rem;
  }

  .service-info p {
    font-size: 0.85rem;
  }

  .gallery-grid {
    grid-template-columns: 1fr;
  }

  .stats-block {
    grid-template-columns: 1fr 1fr;
  }

  .stat-number {
    font-size: 1.8rem;
  }

  .stat-label {
    font-size: 0.75rem;
  }
}

/* Очень маленькие устройства */
@media (max-width: 360px) {
  .home-container {
    padding: 0 0.75rem;
  }

  .main-title {
    font-size: 1.5rem;
  }

  .main-subtitle {
    font-size: 0.8rem;
  }

  .stat-number {
    font-size: 1.5rem;
  }
}
</style>
