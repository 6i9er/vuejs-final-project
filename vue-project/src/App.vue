<template>
  <div id="app">
    <app-header ></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
  </div>
</template>

<script>

  import header from './components/header.vue';
  import footer from './components/footer.vue';

export default {
  name: 'app',
    components:{
      'app-header' : header,
      'app-footer' : footer,
    },
    data () {
      return {
        msg: 'Welcome to Your Vue.js App',
          login : {
              email : '',
              password : '',
          },
          user : '',

      }
    },
    methods : {

    }
}
</script>

<style lang="scss">

</style>
