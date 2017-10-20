
export default {
    data: function () {
      return {
          publicPath : 'http://localhost/restApi/public/api',
      }
    },
    created: function () {
    },
    methods: {
        getPublicPath : function () {
            return 'http://localhost/restApi/public/api';
        }
    }
}
