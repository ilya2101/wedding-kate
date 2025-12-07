<template>
  <div class="reviews-page">
    <!-- Фон -->
    <div class="background-gradient"></div>

    <div class="reviews-container">
      <!-- Заголовок -->
      <div class="reviews-header glass-card">
        <h1>Отзывы</h1>
        <p>Что говорят пары о нашей работе</p>
      </div>

      <!-- Статистика отзывов -->
      <div class="reviews-stats glass-card">
        <div class="stat-item" v-for="stat in stats" :key="stat.id">
          <div class="stat-number">{{ stat.number }}</div>
          <div class="stat-label">{{ stat.label }}</div>
        </div>
      </div>

      <!-- Сетка отзывов -->
      <div class="reviews-grid">
        <div class="review-card glass-card" v-for="review in reviews" :key="review.id">
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
        </div>
      </div>

      <!-- Форма для отзыва -->
      <div class="review-form-section glass-card">
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
              >
            </div>

            <div class="form-group">
              <label for="weddingDate">Дата свадьбы</label>
              <input
                  type="date"
                  id="weddingDate"
                  v-model="newReview.weddingDate"
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
            ></textarea>
          </div>

          <button type="submit" class="submit-btn">Отправить отзыв</button>
        </form>
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
  name: 'Reviews',
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
      // Здесь будет логика отправки отзыва
      console.log('Новый отзыв:', this.newReview);
      alert('Спасибо за ваш отзыв! После модерации он появится на сайте.');

      // Очистка формы
      this.newReview = {
        name: '',
        weddingDate: '',
        rating: 5,
        text: ''
      };
    }
  }
}
</script>

<style scoped>
.reviews-page {
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

.reviews-container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.reviews-header {
  text-align: center;
  padding: 3rem 2rem;
}

.reviews-header h1 {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.reviews-header p {
  font-size: 1.3rem;
  color: #d7ccc8;
}

/* Статистика */
.reviews-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 2rem;
  text-align: center;
  padding: 2rem;
}

.stat-item {
  padding: 1.5rem;
}

.stat-number {
  font-family: 'Playfair Display', serif;
  font-size: 2.5rem;
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

/* Сетка отзывов */
.reviews-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
}

.review-card {
  padding: 2rem;
  transition: all 0.3s ease;
}

.review-card:hover {
  transform: translateY(-5px);
  border-color: rgba(212, 175, 55, 0.3);
}

.review-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.reviewer-avatar {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.reviewer-info h3 {
  color: #fff8e1;
  font-size: 1.3rem;
  margin-bottom: 0.3rem;
  font-weight: 500;
}

.wedding-date {
  color: #a1887f;
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
  color: #d7ccc8;
  line-height: 1.6;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

.review-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.review-type {
  background: rgba(212, 175, 55, 0.2);
  color: #d4af37;
  padding: 0.4rem 1rem;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: 500;
}

/* Форма отзыва */
.review-form-section {
  padding: 3rem;
}

.review-form-section h2 {
  font-family: 'Playfair Display', serif;
  font-size: 2.2rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 0.5rem;
  font-weight: 400;
}

.review-form-section p {
  text-align: center;
  color: #d7ccc8;
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
  color: #fff8e1;
  font-weight: 500;
}

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  color: #fff8e1;
  font-size: 1rem;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #d4af37;
  background: rgba(255, 255, 255, 0.08);
}

.form-group textarea {
  resize: vertical;
  min-height: 120px;
}

.rating-select {
  display: flex;
  gap: 0.5rem;
}

.star-btn {
  background: none;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  transition: all 0.3s ease;
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

.submit-btn {
  width: 100%;
  padding: 1.2rem;
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid #d4af37;
  border-radius: 10px;
  color: #fff8e1;
  font-size: 1.1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.submit-btn:hover {
  background: rgba(212, 175, 55, 0.3);
  transform: translateY(-2px);
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
  .reviews-page {
    padding: 1rem;
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

.reviews-stats { animation-delay: 0.1s; }
.review-card:nth-child(1) { animation-delay: 0.2s; }
.review-card:nth-child(2) { animation-delay: 0.3s; }
.review-card:nth-child(3) { animation-delay: 0.4s; }
.review-card:nth-child(4) { animation-delay: 0.5s; }
.review-card:nth-child(5) { animation-delay: 0.6s; }
.review-card:nth-child(6) { animation-delay: 0.7s; }
.review-form-section { animation-delay: 0.8s; }
</style>