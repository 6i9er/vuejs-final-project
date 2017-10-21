<template>
    <div class="container">
        <app-loader v-if="showLoader"></app-loader>
        <div class="row">
            <h1 class="page-header">
                User Setting
            </h1>
            <h5><span class="label label-danger"> Notice </span>   : if you want to change your password enter your old password and new password and confirm password</h5>
            <form>
                <div class="form-group">
                    <label for="settingName" class="control-label">Full Name:</label>
                    <input type="text" class="form-control" id="settingName" ref="settingName" v-on:blur="validateName()" v-model="user.name">
                </div>

                <div class="form-group">
                    <label for="settingEmail" class="control-label">Email :</label>
                    <input type="text" class="form-control" id="settingEmail" v-on:blur="validateEmail()" ref="settingEmail" v-model="user.email">
                </div>

                <div class="form-group">
                    <label for="settingOldPassword" class="control-label">old password:</label>
                    <input type="password" class="form-control" id="settingOldPassword" ref="settingOldPassword"   v-model="user.oldPassword">
                </div>

                <div class="form-group">
                    <label for="settingPassword" class="control-label">password:</label>
                    <input type="password" class="form-control" id="settingPassword" ref="settingPassword"   v-model="user.password">
                </div>

                <div class="form-group">
                    <label for="settingConfirmPassword" class="control-label">confirm password:</label>
                    <input type="password" class="form-control" id="settingConfirmPassword" ref="settingConfirmPassword" v-model="user.confirmPassword">
                </div>
                <div  id="settingErrorMessage"></div>
                <button type="button" v-show="canEdit" class="form-control" v-on:click="update">Update</button>
            </form>
        </div>
    </div>

</template>
<script>
    import changeMenu from '../Mixins/changeMenu';
    import validation from '../Mixins/validation';
    import globalVariables from '../Mixins/globalVariables';
    import loader from '../components/Templates/loader.vue';


    export default{
    components : {
        'app-loader' : loader,
    },
    data:function() {
        return {
            user:{
                name : '',
                email : '',
                oldPassword : '',
                password : '',
                confirmPassword : '',
            },
            canEdit : true,
            validEmail : false,
            validPassword : false,
            validConfirmPassword : false,
            validName : false,
            publicPath : '',

        }
    },
    methods : {
        validateEmail : function() {
            if(this.checkEmail(this.$refs.settingEmail.value) == true){
                this.validEmail = true;
                this.removeErrorClass("settingEmail");
            }else{
                this.validEmail = false;
                this.setErrorClass("settingEmail");
            }
            this.showButton()
        },
        validateName : function() {
            if(this.$refs.settingName.value != ''){
                this.validName = true;
                this.removeErrorClass("settingName");
            }else{
                this.validName = false;
                this.setErrorClass("settingName");
            }
            this.showButton()
        },
        showButton : function () {

            if(this.validEmail == true && this.validName == true){
                this.canEdit =  true;
            }else if(this.user.email != '' || this.user.name != ''){
                this.canEdit =  true;
            }else{
                this.canEdit =  false;
            }
        },
        update : function () {
            this.showLoaderArea()
                this.$http.post(this.publicPath + '/members/'+ localStorage.member_id,{
                    email:this.user.email,
                    password:this.user.password,
                    name:this.user.name,
                    oldPassword:this.user.oldPassword,
                    confirmPassword:this.user.confirmPassword,
                    _method:'PUT',
                }).then(function(response){
                    if(response['body']['status'] == '200'){
                        this.successError([] , "settingErrorMessage" ,true,response['body']['data'])
                    }else if(response['body']['status'] == '1') {
                        this.hasError([] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '2') {
                        this.hasError(["settingName" ] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '3') {
                        this.hasError(["settingName" ] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '4') {
                        this.hasError(["settingEmail" ] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '5') {
                        this.hasError(["settingEmail" ] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '6') {
                        this.hasError(["settingPassword" , "settingConfirmPassword" ] , 'settingErrorMessage' , true , response['body']['data']);
                    }else{
                        this.hasError([] , 'settingErrorMessage' , true , response['body']['data']);
                    }
                    this.hideLoaderArea()
                }).catch( function(error) {
                    console.log(error);
                } );

        }
    },
    mixins : [changeMenu , validation ,  globalVariables],
    created () {
        this.publicPath = this.getPublicPath();
        if(!localStorage.member_id){
            this.$router.push('/login');
        }else{
            this.showLoaderArea()
            this.$http.get(this.publicPath + '/members/' + localStorage.member_id , {

            }).then(function (response) {
                this.user = response['body'];
                this.hideLoaderArea()
            })
        }
    }
}

</script>