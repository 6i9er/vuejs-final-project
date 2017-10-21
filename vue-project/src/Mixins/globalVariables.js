
export default {
    data: function () {
      return {
          publicPath : 'http://localhost/restApi/public/api',
          showLoader:false,
      }
    },
    created: function () {
    },
    methods: {
        getPublicPath : function () {
            return 'http://localhost/restApi/public/api';
        },showLoaderArea(){
            this.showLoader = true;
        },
        hideLoaderArea(){
            this.showLoader = false;
        }
    }
}
