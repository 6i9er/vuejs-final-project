import articles from './components/articles.vue';
import login from './components/login.vue';
import logout from './components/logout.vue';
import signup from './components/signup.vue';
import setting from './components/setting.vue';
import singlePage from './components/singlePage.vue';
import createSinglePage from './components/createSinglePage.vue';
import PageNotFound from './components/404.vue';

export default [
    {path:'/' , component : articles},
    {path:'/login' , component : login},
    {path:'/logout' , component : logout},
    {path:'/signup' , component : signup},
    {path:'/setting' , component : setting},
    {path:'/show/:id' , component : singlePage},
    // {path:'/post-article' , component : createSinglePage},
    {path:'/post-article' , component : createSinglePage},
    { path: "*", component: PageNotFound }
]