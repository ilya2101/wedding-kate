<template>
  <div class="contacts-page">
    <div class="contacts-container">
      <!-- Заголовок -->
      <GlassCard class="contacts-header">
        <h1>Контакты</h1>
        <p>Буду рада ответить на все ваши вопросы</p>
      </GlassCard>

      <!-- Основной контент -->
      <div class="contacts-content">
        <!-- Контактная информация -->
        <GlassCard class="contact-info-section">
          <h3>Свяжитесь со мной</h3>

          <div class="contact-items">
            <div class="contact-item" v-for="contact in contacts" :key="contact.id">
              <div class="contact-icon">{{ contact.icon }}</div>
              <div class="contact-details">
                <h4>{{ contact.label }}</h4>
                <a :href="contact.link" class="contact-value">{{ contact.value }}</a>
              </div>
            </div>
          </div>

          <!-- Социальные сети -->
          <div class="social-section">
            <h4>Я в социальных сетях</h4>
            <div class="social-links">
              <a
                v-for="social in socials"
                :key="social.id"
                :href="social.link"
                target="_blank"
                class="social-link"
              >
                <span class="social-icon">{{ social.icon }}</span>
                <span class="social-name">{{ social.name }}</span>
              </a>
            </div>
          </div>
        </GlassCard>

        <!-- Форма обратной связи -->
        <GlassCard class="contact-form-section">
          <h3>Или напишите мне</h3>
          <p>Заполните форму, и я свяжусь с вами в ближайшее время</p>

          <form @submit.prevent="submitForm" class="contact-form">
            <div class="form-group">
              <input
                type="text"
                v-model="form.name"
                placeholder="Ваше имя"
                required
                class="form-input"
              >
            </div>

            <div class="form-group">
              <input
                type="tel"
                v-model="form.phone"
                placeholder="Номер телефона"
                required
                class="form-input"
              >
            </div>

            <div class="form-group">
              <input
                type="email"
                v-model="form.email"
                placeholder="Email"
                required
                class="form-input"
              >
            </div>

            <div class="form-group">
              <textarea
                v-model="form.message"
                placeholder="Ваше сообщение"
                rows="5"
                required
                class="form-input"
              ></textarea>
            </div>

            <div class="form-group">
              <label class="checkbox-label">
                <input type="checkbox" v-model="form.agreement" required>
                <span>Я согласен(на) на обработку персональных данных</span>
              </label>
            </div>

            <button type="submit" class="btn btn-primary">Отправить сообщение</button>
          </form>

          <!-- Сообщение об успешной отправке -->
          <div v-if="showSuccess" class="success-message">
            <div class="success-icon">✓</div>
            <p>Спасибо за обращение! Я свяжусь с вами в ближайшее время.</p>
          </div>
        </GlassCard>
      </div>

      <!-- Карта/Дополнительная информация -->
      <GlassCard class="additional-info">
        <div class="info-block">
          <h4>Время ответа</h4>
          <p>Обычно я отвечаю в течение 2-3 часов в рабочее время</p>
        </div>
        <div class="info-block">
          <h4>Рабочее время</h4>
          <p>Ежедневно с 10:00 до 20:00</p>
        </div>
        <div class="info-block">
          <h4>Консультация</h4>
          <p>Первая встреча-знакомство — бесплатно</p>
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
  name: 'Contacts',
  components: {
    GlassCard
  },
  data() {
    return {
      contacts: [
        {
          id: 1,
          icon: '📞',
          label: 'Телефон',
          value: '+7 (993) 210-05-10',
          link: 'tel:+79932100510'
        },
        {
          id: 2,
          icon: '✉️',
          label: 'Email',
          value: 'kate@weddingwithkate.ru',
          link: 'mailto:kate@weddingwithkate.ru'
        },
        {
          id: 3,
          icon: '📍',
          label: 'ВКонтакте',
          value: 'vk.com/wedding_with_kate',
          link: 'https://vk.com/wedding_with_kate'
        }
      ],
      socials: [
        {
          id: 1,
          icon: '💬',
          name: 'ВКонтакте',
          link: 'https://vk.com/im/convo/307850408?entrypoint=conversations_search'
        },
        {
          id: 2,
          icon: '✈️',
          name: 'Telegram',
          link: 'https://web.telegram.org/k/#@katerinaaesa'
        }
      ],
      form: {
        name: '',
        phone: '',
        email: '',
        message: '',
        agreement: false
      },
      showSuccess: false
    }
  },
  methods: {
    submitForm() {
      console.log('Форма отправлена:', this.form)
      this.showSuccess = true
      this.form = {
        name: '',
        phone: '',
        email: '',
        message: '',
        agreement: false
      }
      setTimeout(() => {
        this.showSuccess = false
      }, 5000)
    }
  }
}
</script>

<style scoped>
.contacts-page {
  padding: 3rem 0;
  min-height: calc(100vh - var(--nav-height));
}

.contacts-container {
  max-width: 1000px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.contacts-header {
  text-align: center;
  padding: 3rem 2rem !important;
}

.contacts-header h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.contacts-header p {
  font-size: 1.3rem;
}

/* Основной контент */
.contacts-content {
  display: grid;
  grid-template-columns: 1fr 1.5fr;
  gap: 2rem;
}

/* Контактная информация */
.contact-info-section h3,
.contact-form-section h3,
.additional-info h4 {
  margin-bottom: 1.5rem;
}

.contact-items {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.contact-item {
  display: flex;
  align-items: center;
  gap: 1.5rem;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: var(--border-radius-sm);
  transition: var(--transition-fast);
}

.contact-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}

.contact-icon {
  font-size: 2rem;
  flex-shrink: 0;
}

.contact-details h4 {
  color: var(--color-gold);
  font-size: 0.9rem;
  margin-bottom: 0.3rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.contact-value {
  color: var(--color-cream-light);
  font-size: 1.1rem;
  transition: var(--transition-fast);
}

.contact-value:hover {
  color: var(--color-gold);
}

/* Социальные сети */
.social-section {
  border-top: 1px solid var(--glass-border);
  padding-top: 2rem;
}

.social-section h4 {
  color: var(--color-cream);
  font-size: 1.1rem;
  margin-bottom: 1rem;
}

.social-links {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.social-link {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 0.8rem 1rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: var(--border-radius-sm);
  color: var(--color-cream);
  text-decoration: none;
  transition: var(--transition-fast);
}

.social-link:hover {
  background: var(--color-gold-light);
  transform: translateX(5px);
}

.social-icon {
  font-size: 1.5rem;
}

.social-name {
  font-size: 1.1rem;
}

/* Форма обратной связи */
.contact-form-section p {
  margin-bottom: 2rem;
}

.contact-form {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-group {
  width: 100%;
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 0.8rem;
  cursor: pointer;
}

.checkbox-label input[type="checkbox"] {
  width: 18px;
  height: 18px;
  cursor: pointer;
}

/* Сообщение об успехе */
.success-message {
  margin-top: 2rem;
  padding: 1.5rem;
  background: rgba(76, 175, 80, 0.2);
  border: 1px solid #4CAF50;
  border-radius: var(--border-radius-sm);
  text-align: center;
  animation: fadeIn 0.5s ease;
}

.success-icon {
  font-size: 2rem;
  color: #4CAF50;
  margin-bottom: 0.5rem;
}

.success-message p {
  margin: 0;
}

/* Дополнительная информация */
.additional-info {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  padding: 2rem !important;
}

.info-block {
  text-align: center;
}

.info-block h4 {
  color: var(--color-gold);
  font-size: 1.1rem;
  margin-bottom: 0.5rem;
}

.info-block p {
  font-size: 0.95rem;
}

/* Кнопка назад */
.back-section {
  text-align: center;
}

/* Адаптивность */
@media (max-width: 768px) {
  .contacts-page {
    padding: 2rem 0;
  }

  .contacts-container {
    padding: 0 1rem;
  }

  .contacts-content {
    grid-template-columns: 1fr;
  }

  .additional-info {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }

  .contacts-header h1 {
    font-size: 2.5rem;
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
