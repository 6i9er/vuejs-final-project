<template>
    <div class="container">
        <!-- First Topic -->
        <div class="jumbotron">
            <div class="container">
                <h1>About Us</h1>
                <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                <p><router-link class="btn btn-primary btn-lg" to="/show" exact=""> View details </router-link></p>
            </div>
        </div>
        <!-- End of First Topic -->

        <div class="container">
            <div class="row">
                    <div class="form-group">
                        <input type="text" v-model="search" class="form-control" placeholder="Search for articles here">
                    </div>

            </div>
            <div class="row">


                <!-- Example row of columns -->
                    <div v-for="article in searchFilter" class="col-md-4">
                    <!--<div v-for="article in articles" class="col-md-4">-->
                        <h2>{{ article.title }} ( {{ article.id  }} )</h2>
                        <p> {{ article.content | snipets }} </p>
                        <button  class="btn btn-default" v-on:click="viewArticle( article.id )"> View details </button><hr>

                    </div>
                <!-- End Example row of columns -->

            </div>
            <div class="row">
                <nav aria-label="Page navigation"  id="pagination">
                    <ul class="pagination">
                        <li v-for="page in totalPages"><a href="javascript:void(0)" v-on:click="getNewData(page)" >{{ page}}</a></li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>

</template>
<script>

    import searchFilter from '../Mixins/search';
    import globalVariables from '../Mixins/globalVariables';
    import changeMenu from '../Mixins/changeMenu';


    export default{
    components : {

    },
    data:function() {
    return {
        articles : [],
        totalPages : 0,
        pageNumber : 0,
        count : 5,
        start : 0,
        search:'',
        publicPath : '',

    }
    },
    methods : {
        viewArticle : function (id) {
            this.search = '';
            this.$router.push('/show/'+id)
        },
        getNewData : function (page ) {
            this.search = '';
            var newPage = page-1;
            this.$http.get(this.publicPath  + '/get-articles?count='+this.count+'&start='+newPage, {
            }).then(function (response){
                this.totalPages = response['body']['data']['totalPages'];
                this.articles = response['body']['data']['articles'];
            })
        }
    },
    created () {
        //Set the public URL Path
        this.publicPath = this.getPublicPath();
        this.$http.get(this.publicPath  +'/get-articles?count='+this.count+'&start=0' , {
        }).then(function (response){
            this.totalPages = response['body']['data']['totalPages'];
            this.articles = response['body']['data']['articles'];
        })
    },
    filters : {
        snipets(value){
            return value.slice(0,50) + "...."
        }
    },
    mixins : [ changeMenu ,searchFilter , globalVariables ],
}
</script>
