require('./bootstrap');

window.Vue = require('vue').default;
import VueRouter from "vue-router";
Vue.use(VueRouter);

import store from "./store";
Vue.component('pagination', require('laravel-vue-pagination'));

import AOS from 'aos';
import 'aos/dist/aos.css'; 
AOS.init();


import Swal from 'sweetalert2'
window.Swal = Swal;

import Home from "./components/Home";
import Sign_up from "./components/Sign-up";
import Login from "./components/Login";
import Students from "./components/Students";
import update_student from "./components/update-student";
import add_book from "./components/add-book";
import about from "./components/about";

const routes = [
    { path: "/", component: Home },
    { path: "/Login", component: Login },
    { path: "/Sign-up", component: Sign_up },
    { path: "/Students", component: Students },
    { path: '/update-student/:id', component: update_student },
    { path: '/add-book/:id', component: add_book },
    { path: '/about', component: about },
];
const router = new VueRouter({
    mode: "history",
    routes,
});

import mainhead from "./components/mainhead";
import mainfoot from "./components/mainfoot";
const app = new Vue({
    el: '#app',
    router,
    store,
    components:{
        mainhead,
        mainfoot
    }
});
