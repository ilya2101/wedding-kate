<template>
  <div class="price-page">
    <!-- Фон -->
    <div class="background-gradient"></div>

    <div class="price-container">
      <!-- Заголовок -->
      <div class="price-header glass-card">
        <h1>Стоимость услуг</h1>
        <p>Индивидуальный подход к каждой паре</p>
      </div>

      <!-- Пакеты услуг -->
      <div class="packages-grid">
        <!-- Базовый пакет -->
        <div class="package-card glass-card">
          <div class="package-header">
            <h3>Координация</h3>
            <div class="price">от 15 000 ₽</div>
          </div>
          <ul class="package-features">
            <li>✅ Консультация и планирование</li>
            <li>✅ Подбор локации</li>
            <li>✅ Базовый декор</li>
            <li>✅ Фотограф на 4 часа</li>
            <li>❌ Ведущий</li>
            <li>❌ Видеосъемка</li>
            <li>❌ Организация выездной церемонии</li>
          </ul>
          <button class="package-btn">Выбрать</button>
        </div>

        <!-- Стандартный пакет -->
        <div class="package-card glass-card featured">
          <div class="popular-badge">Популярный</div>
          <div class="package-header">
            <h3>Частичная организация</h3>
            <div class="price">от 25 0000 ₽</div>
          </div>
          <ul class="package-features">
            <li>✅ Частичное сопровождение</li>
            <li>✅ Подбор локации</li>
            <li>✅ Декор</li>
            <li>✅ Фотограф на 8 часов</li>
            <li>✅ Ведущий </li>
            <li>✅ Свадебный координатор</li>
          </ul>
          <button class="package-btn featured-btn">Выбрать</button>
        </div>

        <!-- Премиум пакет -->
        <div class="package-card glass-card">
          <div class="package-header">
            <h3>Полная организация</h3>
            <div class="price">от 50 000 ₽</div>
          </div>
          <ul class="package-features">
            <li>✅ Персональный менеджер</li>
            <li>✅ Эксклюзивные локации</li>
            <li>✅ Дизайнерский декор</li>
            <li>✅ Два фотографа на 10 часов</li>
            <li>✅ Два видеографа на 8 часов</li>
            <li>✅ Известный ведущий</li>
            <li>✅ Организация выездной церемонии</li>
            <li>✅ Свадебный координатор</li>
            <li>✅ Артисты и шоу-программа</li>
            <li>✅ Трансфер для гостей</li>
          </ul>
          <button class="package-btn">Выбрать</button>
        </div>
      </div>

      <!-- Дополнительные услуги -->
      <div class="extras-section glass-card">
        <h2>Дополнительные услуги</h2>
        <div class="extras-grid">
          <div class="extra-item" v-for="extra in extras" :key="extra.id">
            <div class="extra-icon">{{ extra.icon }}</div>
            <div class="extra-info">
              <h4>{{ extra.name }}</h4>
              <p>{{ extra.price }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Примечание -->
      <div class="disclaimer glass-card">
        <div class="disclaimer-icon">💡</div>
        <div class="disclaimer-text">
          <h3>Важно!</h3>
          <p>Все цены являются ориентировочными. Окончательная стоимость рассчитывается индивидуально
            после консультации и зависит от выбранных услуг, сезона, количества гостей и особенностей мероприятия.</p>
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
  name: 'Price',
  data() {
    return {
      extras: [
        { id: 1, icon: '🎂', name: 'Свадебный торт' },
        { id: 2, icon: '🎵', name: 'Live музыка' },
        { id: 3, icon: '🎆', name: 'Фейерверк' },
        { id: 4, icon: '🚗', name: 'Премиум авто' },
        { id: 5, icon: '💐', name: 'Флористика' },
        { id: 6, icon: '📹', name: 'LoveStory видео' }
      ]
    }
  }
}
</script>

<style scoped>
.price-page {
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

.price-container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.price-header {
  text-align: center;
  padding: 3rem 2rem;
}

.price-header h1 {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.price-header p {
  font-size: 1.3rem;
  color: #d7ccc8;
}

/* Сетка пакетов */
.packages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
  margin: 2rem 0;
}

.package-card {
  padding: 2.5rem;
  position: relative;
  transition: all 0.4s ease;
  border: 2px solid transparent;
}

.package-card:hover {
  transform: translateY(-10px);
  border-color: rgba(212, 175, 55, 0.3);
}

.package-card.featured {
  border-color: #d4af37;
  transform: scale(1.05);
}

.package-card.featured:hover {
  transform: scale(1.05) translateY(-10px);
}

.popular-badge {
  position: absolute;
  top: -12px;
  left: 50%;
  transform: translateX(-50%);
  background: #d4af37;
  color: #2a1a1a;
  padding: 0.5rem 1.5rem;
  border-radius: 20px;
  font-weight: 600;
  font-size: 0.9rem;
}

.package-header {
  text-align: center;
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.package-header h3 {
  font-family: 'Playfair Display', serif;
  font-size: 2rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.price {
  font-size: 2.5rem;
  color: #d4af37;
  font-weight: 300;
}

.package-features {
  list-style: none;
  margin-bottom: 2.5rem;
}

.package-features li {
  color: #d7ccc8;
  padding: 0.8rem 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  font-size: 1.1rem;
}

.package-btn {
  width: 100%;
  padding: 1.2rem;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1.1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.package-btn:hover {
  background: rgba(255, 255, 255, 0.2);
  transform: translateY(-2px);
}

.featured-btn {
  background: rgba(212, 175, 55, 0.2);
  border-color: #d4af37;
}

.featured-btn:hover {
  background: rgba(212, 175, 55, 0.3);
}

/* Дополнительные услуги */
.extras-section h2 {
  font-family: 'Playfair Display', serif;
  font-size: 2.5rem;
  color: #fff8e1;
  text-align: center;
  margin-bottom: 2rem;
  font-weight: 400;
}

.extras-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.extra-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 12px;
  transition: all 0.3s ease;
}

.extra-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}

.extra-icon {
  font-size: 2rem;
}

.extra-info h4 {
  color: #fff8e1;
  font-size: 1.2rem;
  margin-bottom: 0.3rem;
  font-weight: 500;
}

.extra-info p {
  color: #d4af37;
  font-size: 1.1rem;
  font-weight: 500;
}

/* Примечание */
.disclaimer {
  display: flex;
  align-items: flex-start;
  gap: 1.5rem;
  background: rgba(212, 175, 55, 0.1);
  border: 1px solid rgba(212, 175, 55, 0.3);
}

.disclaimer-icon {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.disclaimer-text h3 {
  color: #d4af37;
  font-size: 1.5rem;
  margin-bottom: 1rem;
  font-weight: 500;
}

.disclaimer-text p {
  color: #d7ccc8;
  line-height: 1.6;
  font-size: 1.1rem;
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
  .price-page {
    padding: 1rem;
  }

  .packages-grid {
    grid-template-columns: 1fr;
  }

  .package-card.featured {
    transform: none;
  }

  .package-card.featured:hover {
    transform: translateY(-10px);
  }

  .price-header h1 {
    font-size: 2.2rem;
  }

  .disclaimer {
    flex-direction: column;
    text-align: center;
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

.package-card:nth-child(1) { animation-delay: 0.1s; }
.package-card:nth-child(2) { animation-delay: 0.2s; }
.package-card:nth-child(3) { animation-delay: 0.3s; }
.extras-section { animation-delay: 0.4s; }
.disclaimer { animation-delay: 0.5s; }
</style>