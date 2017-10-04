import articles from './components/articles.vue';
import login from './components/login.vue';
import signup from './components/signup.vue';
import singlePage from './components/singlePage.vue';
import createSinglePage from './components/createSinglePage.vue';
import PageNotFound from './components/404.vue';

export default [
    {path:'/' , component : articles},
    {path:'/login' , component : login},
    {path:'/signup' , component : signup},
    {path:'/show/:id' , component : singlePage},
    {path:'/post-article' , component : createSinglePage},
    { path: "*", component: PageNotFound }
]