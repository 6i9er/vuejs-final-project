import Vue from 'vue'
import App from './App.vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import Routes from './routes'

Vue.use(VueResource)
Vue.http.options.emulateJSON = true

Vue.use(VueRouter)
const router = new VueRouter({
    routes : Routes,
    mode : 'history',
});

new Vue({
  el: '#app',
  render: h => h(App),
    router: router
})
