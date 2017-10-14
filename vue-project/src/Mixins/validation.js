export default {
    methods : {
        checkEmail : function (email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        },
        resetData : function (inputs = [] , text , hasText = true) {
            for(var i = 0 ; i <inputs.length ; i++){
                this.removeErrorClass(inputs[i]);
                document.getElementById(inputs[i]).value = '';
            }
            if(hasText == true){
                var elError = document.getElementById(text)
                elError.className += 'hidden';
                elError.innerText  = '';
            }
        },
        hasError : function (inputs = [] , text , hasText = true , textData) {
            for(var i = 0 ; i <inputs.length ; i++){
                this.setErrorClass(inputs[i]);
            }
            if(hasText == true){
                var elError = document.getElementById(text)
                elError.className -= 'hidden';
                elError.className += 'help-block alert alert-danger';
                document.getElementById(text).innerText = textData;
            }
        },

        successError : function (inputs = [] , text , hasText = true , textData) {
            for(var i = 0 ; i <inputs.length ; i++){
                this.setErrorClass(inputs[i]);
            }
            if(hasText == true){
                var elError = document.getElementById(text)
                elError.className -= 'hidden';
                elError.className += 'help-block alert alert-success';
                document.getElementById(text).innerText = textData;
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
}