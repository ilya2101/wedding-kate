import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import About from '../views/About.vue'
import Price from '../views/Price.vue'
import Reviews from '../views/Reviews.vue'
import Contacts from '../views/Contacts.vue'

const routes = [
    {
        path: '/',
        name: 'home',
        component: Home
    },
    {
        path: '/about',
        name: 'about',
        component: About
    },
    {
        path: '/price',
        name: 'price',
        component: Price
    },
    {
        path: '/reviews',
        name: 'reviews',
        component: Reviews
    },
    {
        path: '/contacts',
        name: 'contacts',
        component: Contacts
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router