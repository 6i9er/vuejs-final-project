<template>
    <div class="container" >
        <app-loader v-if="showLoader"></app-loader>
        <div class="row">
            <h1 class="page-header">
               Upload Image
            </h1>
            <form>
                <div class="form-group">
                    <label for="uploadImage" class="control-label">Title :</label>
                    <input type="file" multiple class="form-control"  ref="newArticleTitle"  id="uploadImage" name="uploadImage">
                </div>

                <div  id="createSinglePageErrorMessage"></div>
                <button type="button" class="form-control"  v-on:click="upload()" >Add Post </button>
            </form>
        </div>



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
        }
    },
    methods : {

        // Create Topic
        upload : function () {
            var files = document.getElementById('uploadImage').files;
            if (!files.length) {
                alert('Please select a file!');
                return;
            }
            var file = files[0];
            var formData = new FormData();
console.log(files.length)

            for(var i = 0; i <files.length ; i++){
                formData.append('image[]', files[i]);
            }



//
//            this.uploading_file=true;
//            this.file_uploaded=false;

//            fd.append('image' , this.$refs.uploadImage);
//            alert()
                this.$http.post(this.publicPath  + '/mina',formData).then(function(response){
                    if(response['body']['status'] == '200'){
                        document.getElementById('uploadImage').value = '';
                    }else{
                    }
                    console.log(response['body'])
                }).catch( function(error) {
                    console.log(error);
                } );
        },
    },
    created () {

    },
    mounted: function () {

    },
    mixins : [globalVariables , validations]
}
</script>


