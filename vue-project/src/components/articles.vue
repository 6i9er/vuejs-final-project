<template>
    <div class="container">
        <!-- First Topic -->
        <div class="jumbotron">
            <div class="container">
                <h1>Hello, world!</h1>
                <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                <p><router-link class="btn btn-primary btn-lg" to="/show" exact=""> View details </router-link></p>
            </div>
        </div>
        <!-- End of First Topic -->

        <div class="container">
            <div class="row">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search for articles here">
                    </div>

            </div>
            <div class="row">


                <!-- Example row of columns -->
                    <div v-for="article in articles" class="col-md-4">
                        <h2>{{ article.title }} ( {{ article.id  }} )</h2>
                        <p> {{ article.content | snipets }} </p>
                        <button  class="btn btn-default" v-on:click="viewArticle( article.id )"> View details </button><hr>

                    </div>
                <!-- End Example row of columns -->

            </div>
            <div class="row">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li v-for="page in totalPages"><a href="javascript:void(0)" v-on:click="getNewData(page)" >{{ page}}</a></li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>

</template>
<script>

export default{
    components : {

    },
    data:function() {
    return {
        articles : [],
        totalPages : 0,
        pageNumber : 0,
        count : 5,
        start : 0

    }
    },
    methods : {
        viewArticle : function (id) {
            this.$router.push('/show/'+id)
        },
        getPrev : function (page) {
            console.log()
            if(page > 1){
                getNewData(page)
            }
        },
        getNewData : function (page ) {
            this.$http.get('http://localhost:8000/api/get-articles?count='+this.count+'&start='+page, {
            }).then(function (response){
                this.totalPages = response['body']['data']['totalPages'];
                this.articles = response['body']['data']['articles'];
                console.log( response['body']['data']['totalPages']);
                console.log( response['body']['data']['articles']);
            })
        }
    },
    created () {
        this.$http.get('http://localhost:8000/api/get-articles?count='+this.count+'&start='+this.start , {
        }).then(function (response){
            this.totalPages = response['body']['data']['totalPages'];
            this.articles = response['body']['data']['articles'];
          console.log( response['body']['data']['totalPages']);
          console.log( response['body']['data']['articles']);
        })
    },
    filters : {
        snipets(value){
            return value.slice(0,50) + "...."
        }
    }
}
</script>
