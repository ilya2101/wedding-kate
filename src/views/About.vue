<template>
  <div class="about-page">
    <div class="about-container">
      <!-- Заголовок -->
      <GlassCard class="about-header">
        <h1>Обо мне</h1>
        <p>Ваш персональный организатор свадеб</p>
      </GlassCard>

      <!-- Основной контент -->
      <div class="about-content">
        <!-- Фото и основная инфа -->
        <GlassCard class="profile-section">
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
        </GlassCard>

        <!-- Преимущества -->
        <GlassCard class="advantages-section">
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
        </GlassCard>

        <!-- Опыт и философия -->
        <GlassCard class="philosophy-section">
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
        </GlassCard>

        <!-- Призыв к действию -->
        <GlassCard class="cta-section">
          <div class="cta-content">
            <h3>Готова создать вашу идеальную свадьбу</h3>
            <p>Давайте познакомимся и обсудим ваши мечты</p>
            <router-link to="/contacts" class="btn btn-primary">Связаться со мной</router-link>
          </div>
        </GlassCard>
      </div>

      <!-- Кнопка назад -->
      <div class="back-section">
        <router-link to="/" class="btn btn-secondary">← На главную</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import GlassCard from '@/components/GlassCard.vue'

export default {
  name: 'About',
  components: {
    GlassCard
  },
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
  padding: 3rem 0;
  min-height: calc(100vh - var(--nav-height));
}

.about-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.about-header {
  text-align: center;
  padding: 3rem 2rem !important;
}

.about-header h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.about-header p {
  font-size: 1.3rem;
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
  border-radius: var(--border-radius-lg);
  box-shadow: var(--shadow-lg);
}

.profile-info h2 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}

.tagline {
  font-size: 1.4rem;
  font-style: italic;
  margin-bottom: 2rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--glass-border);
}

.description p {
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

/* Преимущества */
.advantages-section h3 {
  text-align: center;
  margin-bottom: 2rem;
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
  border-radius: var(--border-radius-md);
  transition: var(--transition-fast);
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
  color: var(--color-cream-light);
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
  font-weight: 500;
}

.advantage-text p {
  font-size: 1rem;
}

/* Философия */
.philosophy-section h3 {
  margin-bottom: 2rem;
}

.philosophy-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 3rem;
}

.philosophy-text p {
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
  border-radius: var(--border-radius-sm);
}

.stat-number {
  font-size: 2.2rem;
  color: var(--color-gold);
  font-weight: 300;
  margin-bottom: 0.5rem;
}

.stat-label {
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* CTA секция */
.cta-section {
  text-align: center;
  padding: 3rem !important;
}

.cta-content h3 {
  margin-bottom: 1rem;
}

.cta-content p {
  margin-bottom: 2rem;
  font-size: 1.2rem;
}

/* Кнопка назад */
.back-section {
  text-align: center;
  margin-top: 2rem;
}

/* Адаптивность */
@media (max-width: 768px) {
  .about-page {
    padding: 2rem 0;
  }

  .about-container {
    padding: 0 1rem;
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

  .about-header h1 {
    font-size: 2.2rem;
  }
}
</style>
