<template>
  <div class="about-page">
    <!-- Фон -->
    <div class="background-gradient"></div>

    <div class="about-container">
      <!-- Заголовок -->
      <div class="about-header glass-card">
        <h1>Обо мне</h1>
        <p>Ваш персональный организатор свадеб</p>
      </div>

      <!-- Основной контент -->
      <div class="about-content">
        <!-- Фото и основная инфа -->
        <div class="profile-section glass-card">
          <div class="profile-image">
            <img src="@/assets/kate-photo.jpg" alt="Екатерина" class="kate-photo">
          </div>
          <div class="profile-info">
            <h2>Екатерина</h2>

            <div class="tagline">Создаю атмосферные и спокойные свадьбы без стресса</div>

            <div class="description">
              <p><strong>Wedding with Kate</strong> — проект персональной свадебной организации.</p>
              <p>Создаю атмосферные и спокойные свадьбы без стресса. Помогаю парам наслаждаться
                своим днем без лишних хлопот и переживаний.</p>
            </div>
          </div>
        </div>

        <!-- Преимущества -->
        <div class="advantages-section glass-card">
          <h3>Почему выбирают меня</h3>
          <div class="advantages-grid">
            <div class="advantage-item" v-for="advantage in advantages" :key="advantage.id">
              <div class="advantage-icon">{{ advantage.icon }}</div>
              <div class="advantage-text">
                <h4>{{ advantage.title }}</h4>
                <p>{{ advantage.description }}</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Опыт и философия -->
        <div class="philosophy-section glass-card">
          <h3>Моя философия</h3>
          <div class="philosophy-content">
            <div class="philosophy-text">
              <p>Я верю, что свадьба должна быть не просто мероприятием, а настоящей сказкой,
                где каждая деталь отражает любовь и индивидуальность пары.</p>

              <p>В 20 лет я понимаю современных молодоженов и знаю, что для них важно:
                искренние эмоции, красивые кадры и отсутствие стресса в самый важный день.</p>

              <p>Мой подход — это внимание к деталям, креативные решения и полное погружение
                в вашу историю любви.</p>
            </div>
            <div class="stats">
              <div class="stat" v-for="stat in stats" :key="stat.id">
                <div class="stat-number">{{ stat.number }}</div>
                <div class="stat-label">{{ stat.label }}</div>
              </div>
            </div>
          </div>
        </div>

        <!-- Призыв к действию -->
        <div class="cta-section glass-card">
          <div class="cta-content">
            <h3>Готова создать вашу идеальную свадьбу</h3>
            <p>Давайте познакомимся и обсудим ваши мечты</p>
            <router-link to="/contacts" class="cta-button">Связаться со мной</router-link>
          </div>
        </div>
      </div>

      <!-- Кнопка назад -->
      <div class="back-section">
        <router-link to="/" class="back-btn">← На главную</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'About',
  data() {
    return {
      advantages: [
        {
          id: 1,
          icon: '🎯',
          title: 'Персональный подход',
          description: 'Каждая свадьба уникальна, как и ваша история любви'
        },
        {
          id: 2,
          icon: '😌',
          title: 'Без стресса',
          description: 'Возьму на себя все организационные моменты'
        },
        {
          id: 3,
          icon: '💫',
          title: 'Современное видение',
          description: 'Понимаю тренды и предпочтения молодого поколения'
        },
        {
          id: 4,
          icon: '📞',
          title: 'Полное сопровождение',
          description: 'На связи на всех этапах подготовки и в день свадьбы'
        }
      ],
      stats: [
        { id: 1, number: '50+', label: 'реализованных проектов' },
        { id: 2, number: '100%', label: 'довольных пар' },
        { id: 3, number: '20', label: 'лет энергии' },
        { id: 4, number: '24/7', label: 'поддержка' }
      ]
    }
  }
}
</script>

<style scoped>
.about-page {
  min-height: 100vh;
  padding: 2rem;
  position: relative;
}

.background-gradient {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
      135deg,
      #3d2c2c 0%,
      #5d4037 25%,
      #8d6e63 50%,
      #a1887f 75%,
      #d7ccc8 100%
  );
  background-size: 400% 400%;
  animation: gradientShift 20s ease infinite;
  z-index: -1;
}

@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.about-container {
  max-width: 1000px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.about-header {
  text-align: center;
  padding: 3rem 2rem;
}

.about-header h1 {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.about-header p {
  font-size: 1.3rem;
  color: #d7ccc8;
}

/* Профиль */
.profile-section {
  display: grid;
  grid-template-columns: 300px 1fr;
  gap: 3rem;
  align-items: start;
}

.profile-image {
  text-align: center;
}

.kate-photo {
  width: 100%;
  max-width: 280px;
  height: 350px;
  object-fit: cover;
  border-radius: 20px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
}

.profile-info h2 {
  font-family: 'Playfair Display', serif;
  font-size: 2.5rem;
  color: #fff8e1;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.age {
  font-size: 1.3rem;
  color: #d4af37;
  margin-bottom: 1rem;
  font-weight: 500;
}

.tagline {
  font-size: 1.4rem;
  color: #d7ccc8;
  font-style: italic;
  margin-bottom: 2rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.description p {
  color: #d7ccc8;
  line-height: 1.7;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

/* Преимущества */
.advantages-section h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2.2rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
}

.advantages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
}

.advantage-item {
  display: flex;
  align-items: flex-start;
  gap: 1.5rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 16px;
  transition: all 0.3s ease;
}

.advantage-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-5px);
}

.advantage-icon {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.advantage-text h4 {
  color: #fff8e1;
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
  font-weight: 500;
}

.advantage-text p {
  color: #d7ccc8;
  line-height: 1.5;
}

/* Философия */
.philosophy-section h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2.2rem;
  color: #fff8e1;
  margin-bottom: 2rem;
  font-weight: 400;
}

.philosophy-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 3rem;
}

.philosophy-text p {
  color: #d7ccc8;
  line-height: 1.7;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

.stats {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.stat {
  text-align: center;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 12px;
}

.stat-number {
  font-size: 2.2rem;
  color: #d4af37;
  font-weight: 300;
  margin-bottom: 0.5rem;
}

.stat-label {
  color: #d7ccc8;
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* CTA секция */
.cta-section {
  text-align: center;
  padding: 3rem;
}

.cta-content h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2.2rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.cta-content p {
  color: #d7ccc8;
  font-size: 1.2rem;
  margin-bottom: 2rem;
}

.cta-button {
  display: inline-block;
  padding: 1.2rem 2.5rem;
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid #d4af37;
  border-radius: 12px;
  color: #fff8e1;
  text-decoration: none;
  font-size: 1.2rem;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.cta-button:hover {
  background: rgba(212, 175, 55, 0.3);
  transform: translateY(-3px);
  box-shadow: 0 10px 25px rgba(212, 175, 55, 0.2);
}

/* Кнопка назад */
.back-section {
  text-align: center;
  margin-top: 2rem;
}

.back-btn {
  display: inline-block;
  padding: 1rem 2rem;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 12px;
  color: #fff8e1;
  text-decoration: none;
  font-size: 1.1rem;
  transition: all 0.3s ease;
}

.back-btn:hover {
  background: rgba(255, 255, 255, 0.2);
  transform: translateY(-2px);
}

/* Адаптивность */
@media (max-width: 768px) {
  .about-page {
    padding: 1rem;
  }

  .profile-section {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 2rem;
  }

  .kate-photo {
    max-width: 250px;
    height: 300px;
  }

  .philosophy-content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }

  .stats {
    flex-direction: row;
    flex-wrap: wrap;
  }

  .stat {
    flex: 1;
    min-width: 120px;
  }

  .advantages-grid {
    grid-template-columns: 1fr;
  }
}

/* Анимации */
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

.profile-section { animation-delay: 0.1s; }
.advantages-section { animation-delay: 0.2s; }
.philosophy-section { animation-delay: 0.3s; }
.cta-section { animation-delay: 0.4s; }
</style>