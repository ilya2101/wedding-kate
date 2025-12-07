<template>
  <div id="app">
    <!-- Показываем главную страницу ТОЛЬКО на маршруте '/' -->
    <div v-if="$route.path === '/'" class="main-page">
      <!-- Фон с кофейным градиентом -->
      <div class="background-gradient"></div>

      <!-- Верхний контент -->
      <div class="top-content">
        <h1 class="main-title">Wedding with Kate</h1>

        <!-- Навигация сразу под заголовком -->
        <nav class="glass-nav">
          <router-link to="/price" class="nav-link">Прайс</router-link>
          <router-link to="/about" class="nav-link">Обо мне</router-link>
          <router-link to="/reviews" class="nav-link">Отзывы</router-link>
        </nav>
      </div>

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

        <!-- Форма обратной связи -->
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

      </div>
    </div>

    <!-- Контент других страниц -->
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
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
    }// ← правильно закрыт return
  } // ← правильно закрыт data()
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  background: #2a1a1a;
}

#app {
  min-height: 100vh;
}

/* Главная страница */
.main-page {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  overflow-x: hidden;
  overflow-y: auto;
  padding-top: 10vh;
  padding-bottom: 5vh;
}

/* Фон с кофейным градиентом */
.background-gradient {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
      135deg,
      #3d2c2c 0%,    /* Темный кофе */
      #5d4037 25%,   /* Кофе с молоком */
      #8d6e63 50%,   /* Средний кофе */
      #a1887f 75%,   /* Светлый кофе */
      #d7ccc8 100%   /* Кремовый */
  );
  background-size: 400% 400%;
  animation: gradientShift 20s ease infinite;
  z-index: -1;
}

/* Анимация градиента */
@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Верхний контент */
.top-content {
  text-align: center;
  animation: fadeInUp 1.5s ease-out;
  margin-bottom: 5vh;
  width: 100%;
}

.main-title {
  font-size: 4.5rem;
  color: #fff8e1;
  font-weight: 300;
  letter-spacing: 4px;
  margin-bottom: 3rem;
  text-shadow:
      0 2px 10px rgba(0, 0, 0, 0.3),
      0 4px 20px rgba(0, 0, 0, 0.2);
  font-family: 'Playfair Display', serif;
  position: relative;
}

.main-title::after {
  content: '';
  position: absolute;
  bottom: -15px;
  left: 50%;
  transform: translateX(-50%);
  width: 100px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #d7ccc8, transparent);
}

/* Стеклянная навигация в стиле iOS */
.glass-nav {
  display: flex;
  gap: 2rem;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 20px;
  padding: 1rem 2rem;
  box-shadow:
      0 8px 32px rgba(0, 0, 0, 0.1),
      inset 0 1px 0 rgba(255, 255, 255, 0.2);
  justify-content: center;
}

.nav-link {
  color: #fff8e1;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: 400;
  padding: 0.8rem 1.5rem;
  border-radius: 15px;
  transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
  position: relative;
  overflow: hidden;
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.1);
}

/* Эффект стекла при наведении */
.nav-link:hover {
  background: rgba(255, 255, 255, 0.15);
  border: 1px solid rgba(255, 255, 255, 0.3);
  transform: translateY(-2px);
  box-shadow:
      0 10px 25px rgba(0, 0, 0, 0.15),
      0 5px 15px rgba(255, 255, 255, 0.1);
  color: #ffffff;
}

/* Свечение при наведении */
.nav-link::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(
      90deg,
      transparent,
      rgba(255, 255, 255, 0.3),
      transparent
  );
  transition: left 0.6s;
}

.nav-link:hover::before {
  left: 100%;
}

/* Активная ссылка */
.nav-link.router-link-active {
  background: rgba(255, 255, 255, 0.2);
  border: 1px solid rgba(255, 255, 255, 0.4);
  color: #ffffff;
  box-shadow:
      0 5px 15px rgba(255, 255, 255, 0.1),
      inset 0 1px 0 rgba(255, 255, 255, 0.2);
}

/* Основной контент */
.main-content {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Стеклянные карточки */
.glass-card {
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 24px;
  padding: 2.5rem;
  box-shadow:
      0 8px 32px rgba(0, 0, 0, 0.1),
      inset 0 1px 0 rgba(255, 255, 255, 0.1);
  transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.glass-card:hover {
  transform: translateY(-5px);
  background: rgba(255, 255, 255, 0.12);
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow:
      0 15px 40px rgba(0, 0, 0, 0.15),
      inset 0 1px 0 rgba(255, 255, 255, 0.15);
}

/* Приветственный блок */
.welcome-block {
  text-align: center;
}

.welcome-block h2 {
  font-family: 'Playfair Display', serif;
  font-size: 2.5rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
  letter-spacing: 1px;
}

.welcome-block p {
  font-size: 1.3rem;
  color: #d7ccc8;
  line-height: 1.6;
}

/* География */
.geo-block {
  display: flex;
  align-items: center;
  gap: 1.5rem;
}

.geo-icon {
  font-size: 3rem;
}

.geo-text h3 {
  font-family: 'Playfair Display', serif;
  font-size: 1.8rem;
  color: #fff8e1;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.geo-text p {
  color: #d7ccc8;
  font-size: 1.1rem;
}

/* Клиенты */
.clients-block h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
}

.clients-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
}

.client-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 16px;
  transition: all 0.3s ease;
}

.client-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-3px);
}

.client-avatar {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.client-name {
  color: #fff8e1;
  font-size: 1.1rem;
  font-weight: 500;
}

/* Услуги */
.services-block h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
}

.services-list {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
}

.service-item {
  display: flex;
  align-items: flex-start;
  gap: 1.5rem;
}

.service-icon {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.service-info h4 {
  font-family: 'Playfair Display', serif;
  font-size: 1.4rem;
  color: #fff8e1;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.service-info p {
  color: #d7ccc8;
  line-height: 1.5;
}

/* Галерея */
.gallery-block h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
}

.gallery-placeholder {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
  margin-bottom: 1.5rem;
}

.photo-slot {
  aspect-ratio: 4/3;
  background: rgba(255, 255, 255, 0.05);
  border: 2px dashed rgba(255, 255, 255, 0.2);
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.photo-slot:hover {
  background: rgba(255, 255, 255, 0.08);
  border-color: rgba(255, 255, 255, 0.3);
}

.photo-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
  opacity: 0.7;
}

.photo-slot p {
  color: #d7ccc8;
  font-size: 0.9rem;
}

.gallery-note {
  text-align: center;
  color: #a1887f;
  font-style: italic;
  font-size: 0.9rem;
}

/* Статистика */
.stats-block {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 2rem;
  text-align: center;
}

.stat-item {
  padding: 1.5rem;
}

.stat-number {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #fff8e1;
  font-weight: 300;
  margin-bottom: 0.5rem;
}

.stat-label {
  color: #d7ccc8;
  font-size: 1.1rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* Анимация появления */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Анимации для карточек */
.glass-card {
  animation: slideUp 0.8s ease-out forwards;
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

/* Задержки для последовательного появления */
.glass-card:nth-child(1) { animation-delay: 0.1s; }
.glass-card:nth-child(2) { animation-delay: 0.2s; }
.glass-card:nth-child(3) { animation-delay: 0.3s; }
.glass-card:nth-child(4) { animation-delay: 0.4s; }
.glass-card:nth-child(5) { animation-delay: 0.5s; }
.glass-card:nth-child(6) { animation-delay: 0.6s; }

/* Адаптивность */
@media (max-width: 768px) {
  .main-title {
    font-size: 2.8rem;
    letter-spacing: 2px;
  }

  .glass-nav {
    flex-direction: column;
    gap: 1rem;
    padding: 1.5rem;
  }

  .nav-link {
    font-size: 1.1rem;
    padding: 1rem 1.2rem;
  }

  .main-page {
    padding-top: 8vh;
    padding-bottom: 3vh;
  }

  .main-content {
    padding: 0 1rem;
    gap: 1.5rem;
  }

  .glass-card {
    padding: 1.5rem;
  }

  .welcome-block h2 {
    font-size: 2rem;
  }

  .clients-grid {
    grid-template-columns: repeat(2, 1fr);
  }

  .services-list {
    grid-template-columns: 1fr;
  }

  .service-item {
    flex-direction: column;
    text-align: center;
  }

  .stats-block {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Для очень больших экранов */
@media (min-width: 1200px) {
  .main-title {
    font-size: 5rem;
  }

  .glass-nav {
    gap: 3rem;
    padding: 1.5rem 3rem;
  }
}

/* Галерея с фото */
.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.photo-item {
  aspect-ratio: 4/3;
  border-radius: 16px;
  overflow: hidden;
  transition: all 0.4s ease;
}

.gallery-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.photo-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
}

.photo-item:hover .gallery-photo {
  transform: scale(1.05);
}
/* Форма обратной связи */
.contact-form {
  text-align: center;
  padding: 2.5rem;
}

.contact-form h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.contact-form p {
  color: #d7ccc8;
  margin-bottom: 2rem;
  font-size: 1.1rem;
}

.contact-form-fields {
  max-width: 400px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-input {
  width: 100%;
  padding: 1rem 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1rem;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.form-input:focus {
  outline: none;
  border-color: #d4af37;
  background: rgba(255, 255, 255, 0.08);
}

.form-input::placeholder {
  color: #a1887f;
}

.submit-form-btn {
  width: 100%;
  padding: 1.2rem;
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid #d4af37;
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1.1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.submit-form-btn:hover {
  background: rgba(212, 175, 55, 0.3);
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(212, 175, 55, 0.2);
}
</style>