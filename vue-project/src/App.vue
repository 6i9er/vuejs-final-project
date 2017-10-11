<template>
  <div id="app">
    <app-header></app-header>
    <router-view></router-view>
    <!--<app-signup></app-signup>-->
    <!--<app-create-single-article></app-create-single-article>-->
    <!--<app-single-article></app-single-article>-->
    <!--<app-all-articles></app-all-articles>-->
    <!--<app-login></app-login>-->
    <app-footer></app-footer>
  </div>
</template>

<script>

  import header from './components/header.vue';
  import footer from './components/footer.vue';
//  import loginPage from './components/login.vue';
//  import signUpPage from './components/signup.vue';
//  import allArticlesPage from './components/articles.vue';
//  import singleArticle from './components/singlePage.vue';
//  import createSingleArticle from './components/createSinglePage.vue';
export default {
  name: 'app',
    components:{
      'app-header' : header,
      'app-footer' : footer,
//      'app-login' : loginPage,
//      'app-signup' : signUpPage,
//      'app-all-articles' : allArticlesPage,
//      'app-single-article' : singleArticle,
//      'app-create-single-article' : createSingleArticle,
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
