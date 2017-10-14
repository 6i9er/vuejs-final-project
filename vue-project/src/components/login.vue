<template>
    <div class="container" id="">
        <div class="row">
            <h1 class="page-header">
                Login
            </h1>
            <form>
                <div class="form-group">
                    <label for="loginEmail" class="control-label">email :</label>
                    <input type="text"  class="form-control"   v-model="newUser.email" v-on:blur="validateEmail()" ref="loginEmail" id="loginEmail">
                </div>

                <div class="form-group">
                    <label for="loginPassword" class="control-label">password:</label>
                    <input type="password" class="form-control" v-model="newUser.password" v-on:blur="validatePassword()" v-on:keypress="validatePassword()"  ref="loginPassword" id="loginPassword">
                </div>
                <div  id="loginErrorMessage"></div>
                <button type="button" v-if="canLogin" class="form-control" v-on:click="login()" >login </button>
            </form>
        </div>
    </div>

</template>

<script>
    import changeMenu from '../Mixins/changeMenu';
    import validation from '../Mixins/validation';
export default{
    components : {
    },
    data:function() {
        return {
            newUser:{
                email : '',
                password : '',
            },
            canLogin : false,
            validEmail : false,
            validPassword : false,
        }
    },
    methods : {
        validateEmail : function() {
            if(this.checkEmail(this.$refs.loginEmail.value) == true){
                this.validEmail = true;
                this.removeErrorClass("loginEmail");
            }else{
                this.validEmail = false;
                this.setErrorClass("loginEmail");
            }
            this.showButton()
        },
        validatePassword : function() {
            if(this.$refs.loginPassword.value != ''){
                this.validPassword = true;
                this.removeErrorClass("loginPassword");
            }else{
                this.validPassword = false;
                this.setErrorClass("loginPassword");
            }
            this.showButton()
        },
        showButton : function () {
            if(this.validEmail == true && this.validPassword == true){
                this.canLogin =  true;
            }else{
                this.canLogin =  false;
            }
        },
        login : function () {
            if(this.canLogin == true){
                this.$http.post('http://127.0.0.1:8000/api/members/login',{
                    email:this.newUser.email,
                    password:this.newUser.password,
                }).then(function(response){
                    if(response['body']['status'] == '200'){
                        this.$session.start()
                        this.$session.set('member_id', response['body']['data']['id'])
                        this.resetData(["loginEmail" , "loginPassword"] , 'loginErrorMessage' , true);
                        this.changeMenu();
                                            this.$router.push('/');
                    }else{
                        this.hasError(["loginEmail" , "loginPassword"] , 'loginErrorMessage' , true , response['body']['data']);
                    }
                }).catch( function(error) {
                    console.log(error);
                } );
            }
        },
    },
    created () {
       if(this.$session.has('member_id')){
            this.$router.push('/');
       }
    },
    mixins : [changeMenu , validation],
}
</script>
