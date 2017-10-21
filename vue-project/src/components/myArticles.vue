<template>
    <div class="container">
        <app-loader v-if="showLoader"></app-loader>
        <div class="container">
            <div class="row">
                <div  id="myArticlesPageErrorMessage"></div>
                <div class="form-group">
                        <input type="text" v-model="search" class="form-control" placeholder="Search for articles here">
                </div>
            </div>
            <div class="row" >
                <!-- Example row of columns -->
                    <div v-for="article in searchFilter" v-bind:id="article.id" class="col-md-4">
                    <!--<div v-for="article in articles" class="col-md-4">-->
                        <h2>{{ article.title }} ( {{ article.id  }} )</h2>
                        <p> {{ article.content | snipets }} </p>
                        <div class="row">
                            <button  class="btn btn-default" v-on:click="viewArticle( article.id )"> View details </button>
                            <button  class="btn btn-default" v-on:click="editArticle( article.id )"> Edit </button>
                            <button  class="btn btn-default" v-on:click="openModal( article.id )"> Delete </button>
                        </div>
                    </div>
                <!-- End Example row of columns -->
            </div>

        </div>

        <delete-modal v-if="showModal">
            <!-- buttons-->
            <div slot="buttons">
                <button type="button" class="btn btn-outline-info" @click="closeModal()"> Close </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" @click="deletePost()">
                    Submit
                </button>
            </div>
        </delete-modal>
    </div>

</template>
<script>

    import searchFilter from '../Mixins/search';
    import globalVariables from '../Mixins/globalVariables';
    import changeMenu from '../Mixins/changeMenu';
    import deleteModal from '../Modals/deleteArticleModal.vue';
    import loader from '../components/Templates/loader.vue';


    export default{
    components : {
        'delete-modal' : deleteModal,
        'app-loader' : loader,
    },
    data:function() {
        return {
            articles : [],
            search:'',
            publicPath : '',
            showModal: false,
            deletedArticleId:'',

        }
    },
    methods : {
        viewArticle : function (id) {
            this.search = '';
            this.$router.push('/show/'+id)
        },
        editArticle(id) {
            this.$router.push('/edit-article/'+id)
        },
        deletePost() {
            this.showLoaderArea();
            this.$http.post(this.publicPath + '/articles/' + this.deletedArticleId , {
                _method:'DELETE',
                member_id:localStorage.member_id,
            }).then(function (response){
                if(response['body']['status'] == 200){
                    var element = document.getElementById('myArticlesPageErrorMessage');
                    element.className = 'alert alert-success';
                    element.innerHTML = response['body']['data'];
                    var deleteElement = document.getElementById(this.deletedArticleId);
                    deleteElement.parentNode.removeChild(deleteElement);
                    this.closeModal();
                }else{
                    var element = document.getElementById('myArticlesPageErrorMessage');
                    element.className = 'alert alert-danger';
                    element.innerHTML = response['body']['data'];
                    this.closeModal();
                }
                this.hideLoaderArea();
            })
        },
        openModal(id) {
            this.deletedArticleId = id;
            this.showModal = true;
        },
        closeModal() {
            this.deletedArticleId = '';
            this.showModal = false;
        },
    },
    created () {
        if(localStorage.member_id){
            this.showLoaderArea()
            //Set the public URL Path
            this.publicPath = this.getPublicPath();
            this.$http.get(this.publicPath  +'/get-articles-for-user?member_id='+localStorage.member_id , {
            }).then(function (response){
                if(response['body']['status'] == 200){
                    this.articles = response['body']['data'];
                }
                this.hideLoaderArea();
            })
        }else{
            this.$router.push('/login');
        }
    },
    mounted: function () {
        document.addEventListener("keydown", (e) => {
            if (e.keyCode == 27) {
                this.closeModal();
            }
        });
    },
    filters : {
        snipets(value){
            return value.slice(0,50) + "...."
        }
    },
    mixins : [ changeMenu ,searchFilter , globalVariables ],
}
</script>
