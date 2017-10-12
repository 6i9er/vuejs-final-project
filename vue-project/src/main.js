import Vue from 'vue'
import App from './App.vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import Routes from './routes'
import VueSession from 'vue-session'

Vue.use(VueResource)
Vue.http.options.emulateJSON = true

Vue.use(VueSession)

Vue.use(VueRouter)
var router = new VueRouter({
    routes : Routes,
    mode : 'history',
});

new Vue({
  el: '#app',
  render: h => h(App),
    router: router
})
