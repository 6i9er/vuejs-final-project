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

                <button type="button" v-if="canLogin" class="form-control" v-on:click="login()" >login </button>
            </form>
<!--<h1> email : {{ user }} <br> Password </h1>-->

        </div>
    </div>

</template>

<script>

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
            if(checkEmail(this.$refs.loginEmail.value) == true){
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
        removeErrorClass : function (id ) {
            var tagName = document.getElementById(id);
            tagName.setAttribute("style" , '')
        },
        setErrorClass : function (id ) {
            var tagName = document.getElementById(id);
            tagName.setAttribute("style" , 'border:1px solid red;background:pink;')
        },
    },
    created () {
//    console.log("aaaaaA");
//        this.$http.get('http://127.0.0.1:8000/api/articles',{
//
//        }).then(function(response){
//            console.log(response['body']);
//        })
    }
}

function checkEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

</script>
