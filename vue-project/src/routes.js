import articles from './components/articles.vue';
import search from './components/search.vue';
import login from './components/login.vue';
import logout from './components/logout.vue';
import signup from './components/signup.vue';
import setting from './components/setting.vue';
import singlePage from './components/singlePage.vue';
import createSinglePage from './components/createSinglePage.vue';
import editSinglePage from './components/editSinglePage.vue';
import myArticles from './components/myArticles.vue';
import PageNotFound from './components/404.vue';
import uploadPicture from './components/uploadPicture.vue';

export default [
    {path:'/' , component : articles},
    // {path:'/' , redirect:'/0'},
    {path:'/login' , component : login},
    {path:'/logout' , component : logout},
    {path:'/myblog' , component : myArticles},
    {path:'/signup' , component : signup},
    {path:'/setting' , component : setting},
    {path:'/show/:id' , component : singlePage},
    {path:'/show/' , redirect:'/show/0'},
    {path:'/search/:id' , component : search},
    {path:'/search/' , redirect:'/search/0'},
    // {path:'/post-article' , component : createSinglePage},
    {path:'/post-article' , component : createSinglePage},
    {path:'/edit-article/:id' , component : editSinglePage},
    {path:'/upload-picture' , component : uploadPicture},
    { path: "*", component: PageNotFound }
]