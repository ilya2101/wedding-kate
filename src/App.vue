<template>
  <div id="app">
    <!-- Фон с градиентом -->
    <div class="background-gradient"></div>
    
    <!-- Навигация -->
    <Navigation />
    
    <!-- Основной контент страниц -->
    <main class="main-content">
      <router-view />
    </main>
    
    <!-- Футер -->
    <Footer />
  </div>
</template>

<script>
import Navigation from './components/Navigation.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'App',
  components: {
    Navigation,
    Footer
  }
}
</script>

<style>
/* Импорт глобальных стилей */
@import './assets/styles/global.css';

/* Стили для основного контента */
.main-content {
  margin-top: var(--nav-height);
  min-height: calc(100vh - var(--nav-height));
}
</style>
