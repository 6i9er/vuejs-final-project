export default {
    components: {},
    data: function () {
        return {

        }
    },
    computed : {
        searchFilter : function () {
            return this.articles.filter( (article) => {
                return article.title.match(this.search)
            } )
        }
    }

}