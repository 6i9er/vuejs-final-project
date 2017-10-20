<template>
    <div class="container">
        <div class="row">
            <h1 class="page-header">
                Signup
            </h1>
            <form>
                <div class="form-group">
                    <label for="signupName" class="control-label">Full Name:</label>
                    <input type="text" class="form-control" id="signupName" ref="signupName" v-on:blur="validateName()" v-model="newUser.name">
                </div>

                <div class="form-group">
                    <label for="signupEmail" class="control-label">Email :</label>
                    <input type="text" class="form-control" id="signupEmail" v-on:blur="validateEmail()" ref="signupEmail" v-model="newUser.email">
                </div>

                <div class="form-group">
                    <label for="signupPassword" class="control-label">password:</label>
                    <input type="password" class="form-control" id="signupPassword" ref="signupPassword"   v-on:blur="validatePassword()" v-model="newUser.password">
                </div>

                <div class="form-group">
                    <label for="signupConfirmPassword" class="control-label">confirm password:</label>
                    <input type="password" class="form-control" id="signupConfirmPassword" ref="signupConfirmPassword" v-on:keypress="validateConfirmPassword()" v-on:blur="validateConfirmPassword()" v-model="newUser.confirmPassword">
                </div>
                <div  id="signupErrorMessage"></div>
                <button type="button" v-if="canSignup" class="form-control" v-on:click="signup">Signup </button>
            </form>
        </div>
    </div>

</template>
<script>
    import changeMenu from '../Mixins/changeMenu';
    import validation from '../Mixins/validation';
    import globalVariables from '../Mixins/globalVariables';

    export default{
    components : {

    },
    data:function() {
        return {
            newUser:{
                name : '',
                email : '',
                password : '',
                confirmPassword : '',
            },
            canSignup : false,
            validEmail : false,
            validPassword : false,
            validConfirmPassword : false,
            validName : false,
            publicPath : '',
        }
    },
    methods : {
        validateEmail : function() {
            if(this.checkEmail(this.$refs.signupEmail.value) == true){
                this.validEmail = true;
                this.removeErrorClass("signupEmail");
            }else{
                this.validEmail = false;
                this.setErrorClass("signupEmail");
            }
            this.showButton()
        },
        validatePassword : function() {
            if(this.$refs.signupPassword.value != ''){
                this.validPassword = true;
                this.removeErrorClass("signupPassword");
            }else{
                this.validPassword = false;
                this.setErrorClass("signupPassword");
            }
            this.showButton()
        },
        validateConfirmPassword : function() {
            if(this.$refs.signupConfirmPassword.value != ''){
                this.validConfirmPassword = true;
                this.removeErrorClass("signupConfirmPassword");
            }else{
                this.validConfirmPassword = false;
                this.setErrorClass("signupConfirmPassword");
            }
            this.showButton()
        },
        validateName : function() {
            if(this.$refs.signupName.value != ''){
                this.validName = true;
                this.removeErrorClass("signupName");
            }else{
                this.validName = false;
                this.setErrorClass("signupName");
            }
            this.showButton()
        },
        showButton : function () {
            if(this.validEmail == true && this.validPassword == true && this.validConfirmPassword == true && this.validName == true){
                this.canSignup =  true;
            }else{
                this.canSignup =  false;
            }
        },
        signup : function () {
            if(this.newUser.password == this.newUser.confirmPassword){
                this.resetData(["signupPassword" , "signupConfirmPassword"] , 'signupErrorMessage' , true );

                this.$http.post(this.publicPath + '/members',{
                    email:this.newUser.email,
                    password:this.newUser.password,
                    confirmPassword:this.newUser.password,
                    name:this.newUser.name,
                }).then(function(response){
                    if(response['body']['status'] == '200'){
                        this.resetData(["signupEmail" , "signupPassword" , "signupConfirmPassword" , "signupName"] , 'signupErrorMessage' , true);
                        this.$router.push('/login');
                    }else if(response['body']['status'] == '1') {
                        this.hasError(["signupEmail" ] , 'signupErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '2') {
                        this.hasError(["signupName" ] , 'signupErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '3') {
                        this.hasError(["signupPassword" ] , 'signupErrorMessage' , true , response['body']['data']);
                    }
                    else if(response['body']['status'] == '4') {
                        this.hasError(["signupPassword" , "signupConfirmPassword" ] , 'signupErrorMessage' , true , response['body']['data']);
                    }else{
                        this.hasError(["signupPassword" , "signupConfirmPassword" , "signupEmail" , "signupName"] , 'signupErrorMessage' , true , response['body']['data']);
                    }
                }).catch( function(error) {
                    console.log(error);
                } );
            }else{
                this.hasError(["signupPassword" , "signupConfirmPassword"] , 'signupErrorMessage' , true , 'password and confirm Password doesn\'t match');
            }
        }
    },
    created () {
        //Set the public URL Path
        this.publicPath = this.getPublicPath();
        //Check if user login t will redirect to home page
        if(localStorage.member_id){
            this.$router.push('/');
        }
    },
    mixins : [changeMenu , validation , globalVariables],
}

</script>