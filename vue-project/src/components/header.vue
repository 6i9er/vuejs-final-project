<template>
    <nav class="navbar navbar-inverse navbar-fixed">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Project name</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">

                    <li ><router-link to="/" exact=""> All Blogs</router-link></li>
                    <li><router-link to="/login" exact=""> Login</router-link></li>
                    <li><router-link to="/signup" exact=""> signup</router-link></li>
                    <li><router-link to="/post-article" exact=""> add new Article</router-link></li>
                </ul>

            </div><!--/.nav-collapse -->


        </div>
    </nav>
</template>

export default{
    components : {

    },
    data:function() {
        return {


        }
    },
    methods : {
    }
}


<style scoped="">
    .router-link-active{
        color: #fff;
        background-color: #080808;
    }
</style>