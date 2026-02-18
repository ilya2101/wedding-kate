<!-- Home.vue -->
<template>
  <div class="main-page">
    <!-- Основной контент главной страницы -->
    <div class="main-content">
      <!-- Приветственный блок -->
      <div class="welcome-block glass-card">
        <h2>Добро пожаловать в мир идеальных свадеб</h2>
        <p>Профессиональная организация свадебных торжеств в Санкт-Петербурге и Ленинградской области</p>
      </div>

      <!-- География работы -->
      <div class="geo-block glass-card">
        <div class="geo-icon">📍</div>
        <div class="geo-text">
          <h3>Работаю в Санкт-Петербурге и ЛО</h3>
          <p>Провожу свадьбы в лучших locations города и области</p>
        </div>
      </div>

      <!-- Известные клиенты -->
      <div class="clients-block glass-card">
        <h3>Работала со звездами</h3>
        <div class="clients-grid">
          <div class="client-item" v-for="client in clients" :key="client.id">
            <div class="client-avatar">{{ client.emoji }}</div>
            <span class="client-name">{{ client.name }}</span>
          </div>
        </div>
      </div>

      <!-- Услуги -->
      <div class="services-block glass-card">
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
      </div>

      <!-- Галерея -->
      <div class="gallery-block glass-card">
        <h3>Мои работы</h3>
        <div class="gallery-grid">
          <div class="photo-item" v-for="photo in photos" :key="photo.id">
            <img :src="photo.src" :alt="photo.alt" class="gallery-photo">
          </div>
        </div>
      </div>

      <!-- Статистика -->
      <div class="stats-block glass-card">
        <div class="stat-item" v-for="stat in stats" :key="stat.id">
          <div class="stat-number">{{ stat.number }}+</div>
          <div class="stat-label">{{ stat.label }}</div>
        </div>
      </div>

      <!-- Форма обратной связи (теперь внизу) -->
      <div class="contact-form glass-card">
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
                placeholder="Номер для связи"
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

          <button type="submit" class="submit-form-btn">Отправить заявку</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      contactForm: {
        name: '',
        phone: '',
        weddingDate: ''
      },
      clients: [
        { id: 1, name: 'Клава Кока', emoji: '🎤' },
        { id: 2, name: 'Стас Михайлов', emoji: '🎹' },
        { id: 3, name: 'Ваня Дмитриенко', emoji: '🌟' },
        { id: 4, name: 'Егор Крид', emoji: '🎵' },
        { id: 5, name: 'Ольга Бузова', emoji: '✨' },
        { id: 6, name: 'Филипп Киркоров', emoji: '👑' }
      ],
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
      alert('Спасибо за заявку! Я свяжусь с вами в ближайшее время.')
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
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@300;400;500;600;700&family=Montserrat:wght@300;400;500;600&display=swap');

.main-page {
  min-height: 100vh;
  padding: 2rem;
  background: linear-gradient(
      135deg,
      #3d2c2c 0%,
      #5d4037 25%,
      #8d6e63 50%,
      #a1887f 75%,
      #d7ccc8 100%
  );
  font-family: 'Montserrat', sans-serif;
}

.main-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.glass-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border-radius: 24px;
  padding: 2.5rem;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  transition: all 0.4s ease;
}

.glass-card:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.15);
}

/* Стили для приветственного блока */
.welcome-block h2 {
  font-family: 'Playfair Display', serif;
  font-size: 2.8rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
  letter-spacing: 1px;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.welcome-block p {
  color: #d7ccc8;
  font-size: 1.3rem;
  font-weight: 300;
  line-height: 1.6;
}

/* Стили для гео-блока */
.geo-block {
  display: flex;
  align-items: center;
  gap: 2rem;
}

.geo-icon {
  font-size: 3rem;
}

.geo-text h3 {
  font-family: 'Playfair Display', serif;
  color: #d4af37;
  font-size: 1.8rem;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.geo-text p {
  color: #d7ccc8;
  font-size: 1.1rem;
  font-weight: 300;
}

/* Стили для формы */
.contact-form h3 {
  font-family: 'Playfair Display', serif;
  color: #fff8e1;
  font-size: 2.2rem;
  margin-bottom: 1rem;
  font-weight: 400;
  letter-spacing: 1px;
}

.contact-form p {
  color: #d7ccc8;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
  font-weight: 300;
}

.contact-form-fields {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
}

.form-input {
  width: 100%;
  padding: 1rem 1.2rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1rem;
  font-family: 'Montserrat', sans-serif;
  font-weight: 300;
  transition: all 0.3s ease;
}

.form-input:focus {
  outline: none;
  border-color: #d4af37;
  background: rgba(255, 255, 255, 0.1);
}

.form-input::placeholder {
  color: rgba(215, 204, 200, 0.6);
  font-weight: 300;
}

.submit-form-btn {
  grid-column: 1 / -1;
  padding: 1rem 1.5rem;
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid #d4af37;
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1.1rem;
  font-family: 'Montserrat', sans-serif;
  font-weight: 400;
  letter-spacing: 1px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-form-btn:hover {
  background: rgba(212, 175, 55, 0.3);
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(212, 175, 55, 0.2);
}

/* Стили для клиентов */
.clients-block h3 {
  font-family: 'Playfair Display', serif;
  color: #fff8e1;
  font-size: 2.2rem;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
  letter-spacing: 1px;
}

.clients-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 2rem;
  margin-top: 1rem;
}

.client-item {
  text-align: center;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 16px;
  transition: all 0.3s ease;
}

.client-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-3px);
}

.client-avatar {
  font-size: 3rem;
  margin-bottom: 0.5rem;
}

.client-name {
  color: #d7ccc8;
  font-size: 1.1rem;
  font-weight: 400;
  font-family: 'Montserrat', sans-serif;
}

/* Стили для услуг */
.services-block h3 {
  font-family: 'Playfair Display', serif;
  color: #fff8e1;
  font-size: 2.2rem;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
  letter-spacing: 1px;
}

.services-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  margin-top: 1rem;
}

.service-item {
  display: flex;
  gap: 1.5rem;
  padding: 1.8rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 16px;
  transition: all 0.3s ease;
}

.service-item:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.1);
}

.service-icon {
  font-size: 2.8rem;
  flex-shrink: 0;
}

.service-info h4 {
  font-family: 'Playfair Display', serif;
  color: #fff8e1;
  font-size: 1.4rem;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.service-info p {
  color: #d7ccc8;
  font-size: 1rem;
  font-weight: 300;
  line-height: 1.6;
}

/* Стили для галереи */
.gallery-block h3 {
  font-family: 'Playfair Display', serif;
  color: #fff8e1;
  font-size: 2.2rem;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
  letter-spacing: 1px;
}

.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.photo-item {
  aspect-ratio: 1;
  overflow: hidden;
  border-radius: 16px;
  background: rgba(255, 255, 255, 0.05);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.gallery-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.6s ease;
}

.photo-item:hover .gallery-photo {
  transform: scale(1.1);
}

/* Стили для статистики */
.stats-block {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 2rem;
  text-align: center;
  padding: 2.5rem;
}

.stat-number {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #d4af37;
  font-weight: 300;
  margin-bottom: 0.5rem;
  letter-spacing: 2px;
}

.stat-label {
  color: #d7ccc8;
  font-size: 1.1rem;
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 2px;
}

/* Адаптивность */
@media (max-width: 768px) {
  .main-page {
    padding: 1rem;
  }

  .glass-card {
    padding: 1.5rem;
  }

  .welcome-block h2 {
    font-size: 2rem;
  }

  .welcome-block p {
    font-size: 1.1rem;
  }

  .geo-block {
    flex-direction: column;
    text-align: center;
    gap: 1rem;
  }

  .geo-text h3 {
    font-size: 1.5rem;
  }

  .contact-form h3,
  .clients-block h3,
  .services-block h3,
  .gallery-block h3 {
    font-size: 1.8rem;
  }

  .contact-form-fields {
    grid-template-columns: 1fr;
  }

  .service-item {
    flex-direction: column;
    text-align: center;
  }

  .stats-block {
    grid-template-columns: repeat(2, 1fr);
    gap: 1.5rem;
    padding: 1.5rem;
  }

  .stat-number {
    font-size: 2.2rem;
  }

  .stat-label {
    font-size: 0.9rem;
  }
}

@media (max-width: 480px) {
  .stats-block {
    grid-template-columns: 1fr;
  }
}

/* Анимации */
.glass-card {
  animation: slideUp 0.8s ease-out forwards;
  opacity: 0;
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.glass-card:nth-child(1) { animation-delay: 0.1s; }
.glass-card:nth-child(2) { animation-delay: 0.2s; }
.glass-card:nth-child(3) { animation-delay: 0.3s; }
.glass-card:nth-child(4) { animation-delay: 0.4s; }
.glass-card:nth-child(5) { animation-delay: 0.5s; }
.glass-card:nth-child(6) { animation-delay: 0.6s; }
</style>