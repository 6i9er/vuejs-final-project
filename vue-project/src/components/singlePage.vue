<template>
    <div class="container">
        <!-- Example row of columns -->
        <div class="row" v-if="foundData">
            <div class="col-md-12">
                <h2>{{ blog.title }}</h2>
                <div class="row">
                    <div class="col-md-6">
                        <b> Author : {{ blog.author }} </b>
                    </div>
                    <div class="col-md-6">
                        <b>  created on : {{ blog.date }} </b>
                    </div>
                </div>
                <p>
                    {{ blog.content }}
                </p>

                <ol class="breadcrumb">
                    <li v-for="category in categories"><a href="javascript:void(0)" v-on:click="searchCategory(category.id)">{{ category.name }}</a></li>
                </ol>
            </div>

        </div>

        <div class="row" v-show="!foundData">
            <div class="alert alert-danger text-center">{{ this.errorData }}</div>
        </div>

        <hr>
    </div>

</template>

<script>
    import changeMenu from '../Mixins/changeMenu';
    import globalVariables from "../Mixins/globalVariables";

export default{
    components : {

    },
    data:function() {
        return {
            blog : [],
            categories : [],
            foundData : false,
            errorData : 'no data found',
            publicPath : '',

        }
    },
    methods : {
        searchCategory : function (categoryId) {
            this.$router.push('/search/'+categoryId)
        }
    },
    created () {
        var post = this.$router.currentRoute.params.id;
        this.publicPath = this.getPublicPath();

        this.$http.get(this.publicPath + '/articles/' + post , {
        }).then(function (response){
            if(response['body']['status'] == 200){
                this.blog = response['body']['data']['article']
                this.categories = response['body']['data']['article']['categories'];
                this.foundData = true;
            }else{
                this.foundData = false;
                this.errorData = response['body']['data']
                this.blog = []
                this.categories = [];
            }
        })
    },
    mixins : [globalVariables]
}
</script>
