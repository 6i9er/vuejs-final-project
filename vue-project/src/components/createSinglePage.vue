<template>
    <div class="container" >
        <app-loader v-if="showLoader"></app-loader>
        <div class="row">
            <h1 class="page-header">
                Add New Article
            </h1>
            <form>
                <div class="form-group">
                    <label for="newArticleTitle" class="control-label">Title :</label>
                    <input type="text" class="form-control" v-on:blur="validateTitle()" v-on:keypress="validateTitle()" ref="newArticleTitle" id="newArticleTitle" v-model="blog.title" name="newArticleTitle">
                </div>

                <div class="form-group">
                    <label for="newArticleContent" class="control-label">Content :</label>
                    <textarea class="form-control" rows="3" ref="newArticleContent" v-on:blur="validateContent()" v-on:keypress="validateContent()" id="newArticleContent" v-model="blog.content" name="newArticleContent"></textarea>
                </div>


                <label  class="control-label">Categories  :</label>
                <ol >
                    <li v-for="category in categories">

                        <div class="checkbox">
                            <label>
                                <input  type="checkbox" v-model="myCategories" v-on:click="pushCategoryId(category.id ,category.name)" v-bind:value="category.name" v-bind:id=" category.id "> {{ category.name }}
                            </label>
                        </div>
                    </li>
                </ol>
                <div  id="createSinglePageErrorMessage"></div>
                <button type="button" class="form-control" v-show="canCreate" v-on:click="openModal()" >Add Post </button>
            </form>
        </div>

        <create-modal v-if="showModal">
            <!-- Title -->
            <h3 slot="title" class="modal-title">
                {{ blog.title }}
            </h3>
            <!-- content-->
            <p slot="content">
                {{ blog.content }}
            </p>
            <!-- author -->
            <p slot="author">
                <label> Author</label>
                <span>{{ blog.author }}</span>
            </p>
            <!-- categories -->
            <ol v-if="validCategories" slot="categories" class="breadcrumb">
                <li v-for="category in myCategories">{{ category }}</li>
            </ol>
            <!-- buttons-->
            <div slot="buttons">
                <button type="button" class="btn btn-outline-info" @click="closeModal()"> Close </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" @click="createPost()">
                    Submit
                </button>
            </div>
        </create-modal>

    </div>


</template>
<script>
import globalVariables from "../Mixins/globalVariables";
import validations from "../Mixins/validation";
import modal from "../Modals/modal.vue";
import loader from '../components/Templates/loader.vue';


export default{
    components : {
        'create-modal' : modal,
        'app-loader' : loader,
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
            canCreate : false,
            validTitle : false,
            validContent : false,
            validCategories : false,
            showModal: false,
            'app-loader' : loader,


        }
    },
    methods : {
        pushCategoryId : function (id , name) {
            if(this.myCategories.indexOf(name) == -1){
                this.myCategoriesIds.splice(this.myCategories.indexOf(name), 1);
            }else{
                this.myCategoriesIds.push(id);
            }
        },
//        Validations
        validateTitle() {
            if(this.$refs.newArticleTitle.value != ''){
                this.validTitle = true;
                this.removeErrorClass("newArticleTitle");
            }else{
                this.validTitle = false;
                this.setErrorClass("newArticleTitle");
            }
            this.showButton();
        },
        validateContent() {
            if(this.$refs.newArticleContent.value != ''){
                this.validContent = true;
                this.removeErrorClass("newArticleContent");
            }else{
                this.validContent = false;
                this.setErrorClass("newArticleContent");
            }
            this.showButton();
        },
        showButton : function () {
            if(this.validTitle == true && this.validContent == true){
                this.canCreate =  true;
            }else{
                this.canCreate =  false;
            }
        },

//        Modals
        openModal() {
            if(this.myCategories.length == 0){
                this.validCategories = false;
            }else{
                this.validCategories = true;

            }
            this.showModal = true;
        },
        closeModal() {
            this.showModal = false;
        },

        // Create Topic
        createPost : function () {

            if(this.canCreate == true){
                this.showLoaderArea();
                this.$http.post(this.publicPath  + '/articles',{
                    categories:this.myCategoriesIds,
                    title:this.blog.title,
                    content:this.blog.content,
                    member_id:localStorage.member_id,
                    author:this.blog.author
                }).then(function(response){
                    if(response['body']['status'] == '200'){
                            var element = document.getElementById('createSinglePageErrorMessage');
                            element.className = 'alert alert-success';
                            element.innerHTML = response['body']['data'];
                            this.blog.title = '';
                            this.blog.content = '';
                            this.myCategories = [];
                            this.myCategoriesIds = [];
                            this.canCreate = false;
                            this.validTitle = false;
                            this.validContent = false;
                            this.validCategories = false;
                            this.showModal = false;
                    }else{
                        this.hasError(["loginEmail" , "loginPassword"] , 'createSinglePageErrorMessage' , true , response['body']['data']);
                    }
                    this.hideLoaderArea();
                }).catch( function(error) {
                    console.log(error);
                } );
            }
        },
    },
    created () {
        this.showLoaderArea();
        this.publicPath = this.getPublicPath();
        if(!localStorage.member_id ){
            this.$router.push('/login')
        }else{
            this.$http.get(this.publicPath + '/get-create?id='+localStorage.member_id, {

            }).then(function (response){
                if(response['body']['status'] == 200){
                    this.categories = response['body']['data']['categories'];
                    this.blog.author = response['body']['data']['member']['name'];
                }
                this.hideLoaderArea();
            })

        }
    },
    mounted: function () {
        document.addEventListener("keydown", (e) => {
            if (e.keyCode == 27) {
                this.closeModal();
            }
        });
    },
    mixins : [globalVariables , validations]
}
</script>


