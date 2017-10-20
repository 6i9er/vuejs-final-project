
export default {
    created: function () {
        // this.hello()
    },
    methods: {
        changeMenu: function () {
            if(localStorage.member_id){

                document.getElementById('app-login').style.display = 'none';
                document.getElementById('app-signup').style.display = 'none';
                document.getElementById('app-myBlogs').style.display = 'block';
                document.getElementById('app-setting').style.display = 'block';
                document.getElementById('app-logout').style.display = 'block';
            }else{
                document.getElementById('app-login').style.display = 'block';
                document.getElementById('app-signup').style.display = 'block';
                document.getElementById('app-myBlogs').style.display = 'none';
                document.getElementById('app-setting').style.display = 'none';
                document.getElementById('app-logout').style.display = 'none';
            }

        }
    }
}
