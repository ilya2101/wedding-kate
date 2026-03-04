<template>
  <div class="reviews-page">
    <div class="reviews-container">
      <!-- Заголовок -->
      <GlassCard class="reviews-header">
        <h1>Отзывы</h1>
        <p>Что говорят пары о нашей работе</p>
      </GlassCard>

      <!-- Статистика отзывов -->
      <GlassCard class="reviews-stats">
        <div class="stat-item" v-for="stat in stats" :key="stat.id">
          <div class="stat-number">{{ stat.number }}</div>
          <div class="stat-label">{{ stat.label }}</div>
        </div>
      </GlassCard>

      <!-- Сетка отзывов -->
      <div class="reviews-grid">
        <GlassCard class="review-card" v-for="review in reviews" :key="review.id">
          <div class="review-header">
            <div class="reviewer-avatar">{{ review.emoji }}</div>
            <div class="reviewer-info">
              <h3>{{ review.author }}</h3>
              <div class="wedding-date">{{ review.date }}</div>
            </div>
            <div class="rating">
              <span v-for="n in 5" :key="n" class="star">⭐</span>
            </div>
          </div>
          <div class="review-text">
            {{ review.text }}
          </div>
          <div class="review-footer">
            <div class="review-type">{{ review.type }}</div>
          </div>
        </GlassCard>
      </div>

      <!-- Форма для отзыва -->
      <GlassCard class="review-form-section">
        <h2>Оставить отзыв</h2>
        <p>Поделитесь вашими впечатлениями о сотрудничестве</p>

        <form @submit.prevent="submitReview" class="review-form">
          <div class="form-row">
            <div class="form-group">
              <label for="name">Ваше имя *</label>
              <input
                type="text"
                id="name"
                v-model="newReview.name"
                required
                placeholder="Как к вам обращаться?"
                class="form-input"
              >
            </div>

            <div class="form-group">
              <label for="weddingDate">Дата свадьбы</label>
              <input
                type="date"
                id="weddingDate"
                v-model="newReview.weddingDate"
                class="form-input"
              >
            </div>
          </div>

          <div class="form-group">
            <label for="rating">Оценка *</label>
            <div class="rating-select">
              <button
                type="button"
                v-for="n in 5"
                :key="n"
                class="star-btn"
                :class="{ active: newReview.rating >= n }"
                @click="newReview.rating = n"
              >
                ⭐
              </button>
            </div>
          </div>

          <div class="form-group">
            <label for="reviewText">Ваш отзыв *</label>
            <textarea
              id="reviewText"
              v-model="newReview.text"
              required
              placeholder="Расскажите о вашем опыте сотрудничества..."
              rows="5"
              class="form-input"
            ></textarea>
          </div>

          <button type="submit" class="btn btn-primary">Отправить отзыв</button>
        </form>
      </GlassCard>

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
  name: 'Reviews',
  components: {
    GlassCard
  },
  data() {
    return {
      stats: [
        { id: 1, number: '4.9', label: 'средняя оценка' },
        { id: 2, number: '50+', label: 'отзывов' },
        { id: 3, number: '100%', label: 'рекомендуют' },
        { id: 4, number: '24ч', label: 'ответ на отзыв' }
      ],
      reviews: [
        {
          id: 1,
          author: 'Анна и Михаил',
          emoji: '👰‍♀️🤵‍♂️',
          date: '15.08.2023',
          text: 'Кейт - волшебница! Наша свадьба прошла идеально, без единой проблемы. Все гости до сих пор вспоминают, как всё было организовано. Отдельное спасибо за креативные идеи - фотосессия на закате получилась просто сказочной!',
          type: 'Полная организация',
          rating: 5
        },
        {
          id: 2,
          author: 'Елена и Дмитрий',
          emoji: '💑',
          date: '22.07.2023',
          text: 'Работать с Кейт - одно удовольствие! В 20 лет она проявляет такую профессиональную зрелость, которой позавидуют опытные организаторы. Все было продумано до мелочей, мы вообще ни о чем не переживали в свой день.',
          type: 'Организация + фото',
          rating: 5
        },
        {
          id: 3,
          author: 'София и Алексей',
          emoji: '🎉',
          date: '10.06.2023',
          text: 'Искали молодого и современного организатора - и не прогадали! Кейт понимает тренды и знает, что нужно молодым парам. Свадьба в стиле "минимализм с душой" - именно то, о чем мы мечтали.',
          type: 'Концепция и декор',
          rating: 5
        },
        {
          id: 4,
          author: 'Мария и Иван',
          emoji: '✨',
          date: '02.09.2023',
          text: 'Спасибо за безупречную организацию! Особенно впечатлило внимание к деталям - каждая мелочь была продумана. Гости до сих пор спрашивают контакты нашего организатора.',
          type: 'Премиум пакет',
          rating: 5
        },
        {
          id: 5,
          author: 'Кристина и Артем',
          emoji: '🌟',
          date: '18.05.2023',
          text: 'Кейт смогла воплотить в жизнь все наши, даже самые смелые, идеи! Бюджет распланировали идеально, никаких скрытых платежей. Очень понравился спокойный и профессиональный подход.',
          type: 'Полный пакет',
          rating: 5
        },
        {
          id: 6,
          author: 'Алиса и Максим',
          emoji: '💫',
          date: '30.07.2023',
          text: 'Всё было на высшем уровне! От первого звонка до завершения праздника. Кейт всегда на связи, всё объясняет, поддерживает. Свадьба мечты - это про нашу историю!',
          type: 'Организация',
          rating: 5
        }
      ],
      newReview: {
        name: '',
        weddingDate: '',
        rating: 5,
        text: ''
      }
    }
  },
  methods: {
    submitReview() {
      console.log('Новый отзыв:', this.newReview)
      alert('Спасибо за ваш отзыв! После модерации он появится на сайте.')
      this.newReview = {
        name: '',
        weddingDate: '',
        rating: 5,
        text: ''
      }
    }
  }
}
</script>

<style scoped>
.reviews-page {
  padding: 3rem 0;
  min-height: calc(100vh - var(--nav-height));
}

.reviews-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.reviews-header {
  text-align: center;
  padding: 3rem 2rem !important;
}

.reviews-header h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.reviews-header p {
  font-size: 1.3rem;
}

/* Статистика */
.reviews-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 2rem;
  text-align: center;
  padding: 2rem !important;
}

.stat-item {
  padding: 1.5rem;
}

.stat-number {
  font-size: 2.5rem;
  color: var(--color-gold);
  font-weight: 300;
  margin-bottom: 0.5rem;
  font-family: var(--font-heading);
}

.stat-label {
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

/* Сетка отзывов */
.reviews-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
}

.review-card {
  padding: 2rem !important;
  transition: var(--transition-fast);
}

.review-card:hover {
  transform: translateY(-5px);
  border-color: var(--color-gold-medium);
}

.review-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--glass-border);
}

.reviewer-avatar {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.reviewer-info h3 {
  font-size: 1.3rem;
  margin-bottom: 0.3rem;
  font-weight: 500;
}

.wedding-date {
  color: var(--color-coffee-light);
  font-size: 0.9rem;
}

.rating {
  margin-left: auto;
}

.star {
  font-size: 1.1rem;
  margin: 0 1px;
}

.review-text {
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

.review-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.review-type {
  background: var(--color-gold-light);
  color: var(--color-gold);
  padding: 0.4rem 1rem;
  border-radius: var(--border-radius-lg);
  font-size: 0.9rem;
  font-weight: 500;
}

/* Форма отзыва */
.review-form-section {
  padding: 3rem !important;
}

.review-form-section h2 {
  text-align: center;
  margin-bottom: 0.5rem;
}

.review-form-section p {
  text-align: center;
  margin-bottom: 2rem;
  font-size: 1.1rem;
}

.review-form {
  max-width: 600px;
  margin: 0 auto;
}

.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
}

.rating-select {
  display: flex;
  gap: 0.5rem;
}

.star-btn {
  background: transparent;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  transition: var(--transition-fast);
  opacity: 0.5;
}

.star-btn.active {
  opacity: 1;
  transform: scale(1.2);
}

.star-btn:hover {
  opacity: 1;
  transform: scale(1.1);
}

/* Кнопка назад */
.back-section {
  text-align: center;
  margin-top: 2rem;
}

/* Адаптивность */
@media (max-width: 768px) {
  .reviews-page {
    padding: 2rem 0;
  }

  .reviews-container {
    padding: 0 1rem;
  }

  .form-row {
    grid-template-columns: 1fr;
  }

  .reviews-grid {
    grid-template-columns: 1fr;
  }

  .reviews-stats {
    grid-template-columns: repeat(2, 1fr);
  }

  .review-header {
    flex-wrap: wrap;
  }

  .reviews-header h1 {
    font-size: 2.2rem;
  }
}
</style>
