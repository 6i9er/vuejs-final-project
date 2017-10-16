import articles from './components/articles.vue';
import search from './components/search.vue';
import login from './components/login.vue';
import logout from './components/logout.vue';
import signup from './components/signup.vue';
import setting from './components/setting.vue';
import singlePage from './components/singlePage.vue';
import createSinglePage from './components/createSinglePage.vue';
import PageNotFound from './components/404.vue';

export default [
    {path:'/' , component : articles},
    // {path:'/' , redirect:'/0'},
    {path:'/login' , component : login},
    {path:'/logout' , component : logout},
    {path:'/signup' , component : signup},
    {path:'/setting' , component : setting},
    {path:'/show/:id' , component : singlePage},
    {path:'/show/' , redirect:'/show/0'},
    {path:'/search/:id' , component : search},
    {path:'/search/' , redirect:'/search/0'},
    // {path:'/post-article' , component : createSinglePage},
    {path:'/post-article' , component : createSinglePage},
    { path: "*", component: PageNotFound }
]