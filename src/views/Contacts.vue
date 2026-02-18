<template>
  <div class="contacts-page">
    <!-- Фон -->
    <div class="background-gradient"></div>

    <div class="contacts-container">
      <!-- Заголовок -->
      <div class="contacts-header glass-card">
        <h1>Контакты</h1>
        <p>Буду рада ответить на все ваши вопросы</p>
      </div>

      <!-- Основной контент -->
      <div class="contacts-content">
        <!-- Контактная информация -->
        <div class="contact-info-section glass-card">
          <h3>Свяжитесь со мной</h3>

          <div class="contact-items">
            <!-- Телефон -->
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
        </div>

        <!-- Форма обратной связи -->
        <div class="contact-form-section glass-card">
          <h3>Или напишите мне</h3>
          <p>Заполните форму, и я свяжусь с вами в ближайшее время</p>

          <form @submit.prevent="submitForm" class="contact-form">
            <div class="form-group">
              <input
                  type="text"
                  v-model="form.name"
                  placeholder="Ваше имя"
                  required
              >
            </div>

            <div class="form-group">
              <input
                  type="tel"
                  v-model="form.phone"
                  placeholder="Номер телефона"
                  required
              >
            </div>

            <div class="form-group">
              <input
                  type="email"
                  v-model="form.email"
                  placeholder="Email"
                  required
              >
            </div>

            <div class="form-group">
              <textarea
                  v-model="form.message"
                  placeholder="Ваше сообщение"
                  rows="5"
                  required
              ></textarea>
            </div>

            <div class="form-group">
              <label class="checkbox-label">
                <input type="checkbox" v-model="form.agreement" required>
                <span>Я согласен(на) на обработку персональных данных</span>
              </label>
            </div>

            <button type="submit" class="submit-btn">Отправить сообщение</button>
          </form>

          <!-- Сообщение об успешной отправке -->
          <div v-if="showSuccess" class="success-message">
            <div class="success-icon">✓</div>
            <p>Спасибо за обращение! Я свяжусь с вами в ближайшее время.</p>
          </div>
        </div>
      </div>

      <!-- Карта/Дополнительная информация -->
      <div class="additional-info glass-card">
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
  name: 'Contacts',
  data() {
    return {
      contacts: [
        {
          id: 1,
          icon: '📞',
          label: 'Телефон',
          value: '+7 (993) 210-05-10',
          link: 'tel:+79991234567'
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
          icon: '📱',
          name: 'ВКонтакте',
          link: 'https://vk.com/im/convo/307850408?entrypoint=conversations_search'
        },

        {
          id: 3,
          icon: '📱',
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
      // Здесь будет логика отправки формы
      console.log('Форма отправлена:', this.form)

      // Показываем сообщение об успехе
      this.showSuccess = true

      // Очищаем форму
      this.form = {
        name: '',
        phone: '',
        email: '',
        message: '',
        agreement: false
      }

      // Скрываем сообщение через 5 секунд
      setTimeout(() => {
        this.showSuccess = false
      }, 5000)
    }
  }
}
</script>

<style scoped>
.contacts-page {
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

.contacts-container {
  max-width: 1000px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/* Заголовок */
.contacts-header {
  text-align: center;
  padding: 3rem 2rem;
}

.contacts-header h1 {
  font-family: 'Playfair Display', serif;
  font-size: 3rem;
  color: #fff8e1;
  margin-bottom: 1rem;
  font-weight: 400;
}

.contacts-header p {
  font-size: 1.3rem;
  color: #d7ccc8;
}

/* Основной контент */
.contacts-content {
  display: grid;
  grid-template-columns: 1fr 1.5fr;
  gap: 2rem;
}

/* Стили для карточек */
.glass-card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 24px;
  padding: 2rem;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

/* Контактная информация */
.contact-info-section h3,
.contact-form-section h3,
.additional-info h4 {
  font-family: 'Playfair Display', serif;
  font-size: 1.8rem;
  color: #fff8e1;
  margin-bottom: 1.5rem;
  font-weight: 400;
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
  border-radius: 12px;
  transition: all 0.3s ease;
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
  color: #d4af37;
  font-size: 1rem;
  margin-bottom: 0.3rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.contact-value {
  color: #fff8e1;
  font-size: 1.2rem;
  text-decoration: none;
  transition: color 0.3s ease;
}

.contact-value:hover {
  color: #d4af37;
}

/* Социальные сети */
.social-section {
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 2rem;
}

.social-section h4 {
  color: #d7ccc8;
  font-size: 1.2rem;
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
  border-radius: 12px;
  color: #fff8e1;
  text-decoration: none;
  transition: all 0.3s ease;
}

.social-link:hover {
  background: rgba(212, 175, 55, 0.2);
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
  color: #d7ccc8;
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

.form-group input,
.form-group textarea {
  width: 100%;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #d4af37;
  background: rgba(255, 255, 255, 0.1);
}

.form-group input::placeholder,
.form-group textarea::placeholder {
  color: rgba(215, 204, 200, 0.5);
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 0.8rem;
  color: #d7ccc8;
  cursor: pointer;
}

.checkbox-label input[type="checkbox"] {
  width: 18px;
  height: 18px;
  cursor: pointer;
}

.submit-btn {
  padding: 1.2rem;
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid #d4af37;
  border-radius: 12px;
  color: #fff8e1;
  font-size: 1.2rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.submit-btn:hover {
  background: rgba(212, 175, 55, 0.3);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(212, 175, 55, 0.2);
}

/* Сообщение об успехе */
.success-message {
  margin-top: 2rem;
  padding: 1.5rem;
  background: rgba(76, 175, 80, 0.2);
  border: 1px solid #4CAF50;
  border-radius: 12px;
  text-align: center;
  animation: fadeIn 0.5s ease;
}

.success-icon {
  font-size: 2rem;
  color: #4CAF50;
  margin-bottom: 0.5rem;
}

.success-message p {
  color: #fff8e1;
  margin: 0;
}

/* Дополнительная информация */
.additional-info {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  padding: 2rem;
}

.info-block {
  text-align: center;
}

.info-block h4 {
  font-size: 1.2rem;
  color: #d4af37;
  margin-bottom: 0.5rem;
}

.info-block p {
  color: #d7ccc8;
  line-height: 1.5;
}

/* Кнопка назад */
.back-section {
  text-align: center;
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
  .contacts-page {
    padding: 1rem;
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

.contact-info-section { animation-delay: 0.1s; }
.contact-form-section { animation-delay: 0.2s; }
.additional-info { animation-delay: 0.3s; }
</style>