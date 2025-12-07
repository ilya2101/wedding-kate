import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    },
    {
        path: '/price',
        name: 'Price',
        component: () => import('../views/Price.vue')
    },
    {
        path: '/about',
        name: 'About',
        component: () => import('../views/About.vue')
    },
    {
        path: '/reviews',
        name: 'Reviews',
        component: () => import('../views/Reviews.vue')
    }
]

const router = createRouter({
    history: createWebHistory(''),
    routes
})

export default router