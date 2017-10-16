<template>
    <div class="container">

        <div class="container">
            <div class="row">
                    <div class="form-group">
                        <input type="text" class="form-control" v-model="search" placeholder="Search for articles here">
                    </div>

            </div>
            <div class="row" v-if="foundData">
                <!-- Example row of columns -->
                    <!--<div v-for="article in articles" class="col-md-4">-->
                    <div v-for="article in searchFilter" class="col-md-4">
                        <h2>{{ article.title }} ( {{ article.id  }} )</h2>
                        <p> {{ article.content | snipets }} </p>
                        <button  class="btn btn-default" v-on:click="viewArticle( article.id )"> View details </button><hr>

                    </div>
                <!-- End Example row of columns -->
            </div>
            <div class="row" v-show="!foundData">
                <div class="alert alert-danger">
                    {{ errorData }}
                </div>
            </div>

        </div>
    </div>

</template>
<script>

    import searchFilter from '../Mixins/search';

export default{
    components : {

    },
    data:function() {
        return {
            articles : [],
            foundData : false,
            errorData : '',
            search:'',

        }
    },
    methods : {
        viewArticle : function (id) {
            this.$router.push('/show/'+id)
        },
        getNewData : function (page ) {
            var newPage = page-1;
            this.$http.get('http://localhost:8000/api/get-articles?count='+this.count+'&start='+newPage, {
            }).then(function (response){
                this.totalPages = response['body']['data']['totalPages'];
                this.articles = response['body']['data']['articles'];
            })
        }
    },
    created () {
        var search = this.$router.currentRoute.params.id;
        this.$http.get('http://localhost:8000/api/get-articles-by-search?id='+search , {
        }).then(function (response){
            if(response['body']['status'] == 200){
                this.articles = response['body']['data'];
                this.foundData = true;
            }else{
                this.foundData = false;
                this.errorData = response['body']['data'];
            }
        })
    },
    filters : {
        snipets(value){
            return value.slice(0,50) + "...."
        }
    },
    mixins : [ searchFilter ],
}
</script>
