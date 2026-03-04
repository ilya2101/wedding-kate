<template>
  <div class="glass-card" :class="customClass" :style="cardStyle">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'GlassCard',
  props: {
    customClass: {
      type: String,
      default: ''
    },
    padding: {
      type: String,
      default: '2.5rem'
    },
    hover: {
      type: Boolean,
      default: true
    }
  },
  computed: {
    cardStyle() {
      return {
        padding: this.padding
      }
    }
  }
}
</script>

<style scoped>
.glass-card {
  background: var(--glass-bg);
  backdrop-filter: blur(var(--glass-blur));
  -webkit-backdrop-filter: blur(var(--glass-blur));
  border: 1px solid var(--glass-border);
  border-radius: var(--border-radius-xl);
  box-shadow: var(--shadow-md), inset 0 1px 0 rgba(255, 255, 255, 0.1);
  transition: var(--transition-normal);
}

.glass-card:hover {
  transform: translateY(-5px);
  background: var(--glass-bg-hover);
  border-color: var(--glass-border-hover);
  box-shadow: var(--shadow-lg), inset 0 1px 0 rgba(255, 255, 255, 0.15);
}
</style>
