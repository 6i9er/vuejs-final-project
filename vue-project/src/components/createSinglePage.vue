<template>
    <div class="container">
        <div class="row">
            <h1 class="page-header">
                Add New Article
            </h1>
            <form>
                <div class="form-group">
                    <label for="newArticle-title" class="control-label">Title :</label>
                    <input type="text" class="form-control" id="newArticle-title" v-model="blog.title" name="newArticle-title">
                </div>

                <div class="form-group">
                    <label for="newArticle-content" class="control-label">Content :</label>
                    <textarea class="form-control" rows="3" id="newArticle-content" v-model="blog.content" name="newArticle-content"></textarea>
                </div>


                <label  class="control-label">Categories  :</label>
                <ol>
                    <li v-for="category in categories">

                        <div class="checkbox">
                            <label>
                                <input  type="checkbox" v-model="myCategories" v-on:click="pushCategoryId(category.id ,category.name)" v-bind:value="category.name" v-bind:id=" category.id "> {{ category.name }}
                            </label>
                        </div>
                    </li>
                </ol>



                <button type="button" class="form-control" >Add Post </button>
            </form>

            <div class="row" >
                <div class="col-md-12">
                    <h2>Post Preview</h2>
                    <h2>{{ blog.title }}</h2>
                    <p>{{ blog.content }}</p>
                    <p><label> Author</label> <span>{{ blog.author }}</span></p>
                    <ol class="breadcrumb">
                        <li v-for="category in myCategories">{{ category }}</li>
                    </ol>
                </div>

            </div>

        </div>
    </div>

</template>
<script>
import globalVariables from "../Mixins/globalVariables";

export default{
    components : {

    },
    data:function() {
        return {
            publicPath : '',
            categories : [],
            myCategories : [],
            myCategoriesIds : [],
            blog : {
                title : '',
                content : '',
                author : '',
            },

        }
    },
    methods : {
        pushCategoryId : function (id , name) {
            if(this.myCategories.indexOf(name) == -1){
                this.myCategoriesIds.splice(this.myCategories.indexOf(name), 1);
            }else{
                this.myCategoriesIds.push(id);
            }
        }
    },
    created () {
        this.publicPath = this.getPublicPath();
        if(!localStorage.member_id ){
            this.$router.push('/login')
        }else{
            this.$http.get(this.publicPath + '/get-create?id='+localStorage.member_id, {

            }).then(function (response){
//                console.log(response)
//                console.log(response['body']['data']['member']['name'])
                if(response['body']['status'] == 200){
                    this.categories = response['body']['data']['categories'];
                    this.blog.author = response['body']['data']['member']['name'];
                }
            })

        }
    },
    mixins : [globalVariables]
}
</script>


