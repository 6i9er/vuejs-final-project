
export default {
    data: function () {
      return {
          publicPath : 'http://localhost/vuejs-final-project/webService/public/api',
          showLoader:false,
      }
    },
    created: function () {
    },
    methods: {
        getPublicPath : function () {
            return 'http://localhost/vuejs-final-project/webService/public/api';
        },showLoaderArea(){
            this.showLoader = true;
        },
        hideLoaderArea(){
            this.showLoader = false;
        }
    }
}
