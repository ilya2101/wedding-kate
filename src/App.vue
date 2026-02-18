<template>
  <div id="app">
    <!-- Навигация показывается на ВСЕХ страницах -->
    <div class="navigation-wrapper">
      <div class="background-gradient"></div>
      <div class="nav-content">
        <h1 class="main-title">Wedding with Kate</h1>
        <nav class="glass-nav">
          <router-link to="/" class="nav-link" exact>Главная</router-link>
          <router-link to="/price" class="nav-link">Прайс</router-link>
          <router-link to="/about" class="nav-link">Обо мне</router-link>
          <router-link to="/reviews" class="nav-link">Отзывы</router-link>
          <router-link to="/contacts" class="nav-link">Контакты</router-link>
        </nav>
      </div>
    </div>

    <!-- Здесь отображается содержимое текущей страницы -->
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
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
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#app {
  min-height: 100vh;
  position: relative;
}

/* Навигация */
.navigation-wrapper {
  position: relative;
  min-height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
}

.nav-content {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  text-align: center;
}

/* Фон с кофейным градиентом */
.background-gradient {
  position: absolute;
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
  z-index: 1;
}

@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.main-title {
  font-family: 'Playfair Display', serif;
  font-size: 4.5rem;
  color: #fff8e1;
  font-weight: 300;
  letter-spacing: 4px;
  margin-bottom: 3rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
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

/* Стеклянная навигация */
.glass-nav {
  display: flex;
  gap: 1rem;
  justify-content: center;
  flex-wrap: wrap;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 20px;
  padding: 1rem 2rem;
  max-width: fit-content;
  margin: 0 auto;
}

.nav-link {
  color: #fff8e1;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: 400;
  padding: 0.8rem 1.5rem;
  border-radius: 15px;
  transition: all 0.4s ease;
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.nav-link:hover {
  background: rgba(212, 175, 55, 0.2);
  border: 1px solid rgba(212, 175, 55, 0.3);
  transform: translateY(-2px);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.nav-link.router-link-active {
  background: rgba(212, 175, 55, 0.3);
  border: 1px solid #d4af37;
  color: #ffffff;
}

/* Адаптивность */
@media (max-width: 768px) {
  .navigation-wrapper {
    min-height: 250px;
    padding: 1rem;
  }

  .main-title {
    font-size: 2.8rem;
    letter-spacing: 2px;
    margin-bottom: 2rem;
  }

  .glass-nav {
    padding: 0.8rem 1rem;
    gap: 0.5rem;
  }

  .nav-link {
    font-size: 1rem;
    padding: 0.6rem 1.2rem;
  }
}

@media (max-width: 480px) {
  .main-title {
    font-size: 2.2rem;
  }

  .glass-nav {
    flex-direction: column;
    width: 100%;
    max-width: 300px;
  }

  .nav-link {
    width: 100%;
    text-align: center;
  }
}
</style>