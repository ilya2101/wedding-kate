<template>
  <div class="price-page">
    <div class="price-container">
      <!-- Заголовок -->
      <GlassCard class="price-header">
        <h1>Стоимость услуг</h1>
        <p>Индивидуальный подход к каждой паре</p>
      </GlassCard>

      <!-- Пакеты услуг -->
      <div class="packages-grid">
        <!-- Базовый пакет -->
        <GlassCard class="package-card" custom-class="package-basic">
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
          <button class="btn package-btn">Выбрать</button>
        </GlassCard>

        <!-- Стандартный пакет -->
        <GlassCard class="package-card featured" custom-class="package-standard">
          <div class="popular-badge">Популярный</div>
          <div class="package-header">
            <h3>Частичная организация</h3>
            <div class="price">от 25 000 ₽</div>
          </div>
          <ul class="package-features">
            <li>✅ Частичное сопровождение</li>
            <li>✅ Подбор локации</li>
            <li>✅ Декор</li>
            <li>✅ Фотограф на 8 часов</li>
            <li>✅ Ведущий</li>
            <li>✅ Свадебный координатор</li>
          </ul>
          <button class="btn btn-primary package-btn">Выбрать</button>
        </GlassCard>

        <!-- Премиум пакет -->
        <GlassCard class="package-card" custom-class="package-premium">
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
          <button class="btn package-btn">Выбрать</button>
        </GlassCard>
      </div>

      <!-- Дополнительные услуги -->
      <GlassCard class="extras-section">
        <h2>Дополнительные услуги</h2>
        <div class="extras-grid">
          <div class="extra-item" v-for="extra in extras" :key="extra.id">
            <div class="extra-icon">{{ extra.icon }}</div>
            <div class="extra-info">
              <h4>{{ extra.name }}</h4>
            </div>
          </div>
        </div>
      </GlassCard>

      <!-- Примечание -->
      <GlassCard class="disclaimer">
        <div class="disclaimer-icon">💡</div>
        <div class="disclaimer-text">
          <h3>Важно!</h3>
          <p>Все цены являются ориентировочными. Окончательная стоимость рассчитывается индивидуально
            после консультации и зависит от выбранных услуг, сезона, количества гостей и особенностей мероприятия.</p>
        </div>
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
  name: 'Price',
  components: {
    GlassCard
  },
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
  padding: 3rem 0;
  min-height: calc(100vh - var(--nav-height));
}

.price-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.price-header {
  text-align: center;
  padding: 3rem 2rem !important;
}

.price-header h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.price-header p {
  font-size: 1.3rem;
}

/* Сетка пакетов */
.packages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin: 2rem 0;
}

.package-card {
  padding: 2.5rem !important;
  position: relative;
  transition: var(--transition-normal);
  border: 2px solid transparent;
}

.package-card:hover {
  transform: translateY(-10px);
  border-color: var(--color-gold-medium);
}

.package-card.featured {
  border-color: var(--color-gold);
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
  background: var(--color-gold);
  color: var(--color-coffee-dark);
  padding: 0.5rem 1.5rem;
  border-radius: var(--border-radius-lg);
  font-weight: 600;
  font-size: 0.9rem;
}

.package-header {
  text-align: center;
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid var(--glass-border);
}

.package-header h3 {
  font-size: 2rem;
  margin-bottom: 1rem;
}

.price {
  font-size: 2.5rem;
  color: var(--color-gold);
  font-weight: 300;
}

.package-features {
  list-style: none;
  margin-bottom: 2.5rem;
}

.package-features li {
  padding: 0.8rem 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  font-size: 1rem;
}

.package-btn {
  width: 100%;
}

/* Дополнительные услуги */
.extras-section h2 {
  text-align: center;
  margin-bottom: 2rem;
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
  border-radius: var(--border-radius-sm);
  transition: var(--transition-fast);
}

.extra-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}

.extra-icon {
  font-size: 2rem;
}

.extra-info h4 {
  font-size: 1.1rem;
}

/* Примечание */
.disclaimer {
  display: flex;
  align-items: flex-start;
  gap: 1.5rem;
  background: var(--color-gold-light);
  border: 1px solid var(--color-gold-medium);
}

.disclaimer-icon {
  font-size: 2.5rem;
  flex-shrink: 0;
}

.disclaimer-text h3 {
  color: var(--color-gold);
  font-size: 1.5rem;
  margin-bottom: 1rem;
  font-weight: 500;
}

.disclaimer-text p {
  font-size: 1.1rem;
}

/* Кнопка назад */
.back-section {
  text-align: center;
  margin-top: 2rem;
}

/* Адаптивность */
@media (max-width: 768px) {
  .price-page {
    padding: 2rem 0;
  }

  .price-container {
    padding: 0 1rem;
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
</style>
