<template>
    <div class="container">
        <!-- First Topic -->
        <div class="jumbotron">
            <div class="container">
                <h1>Hello, world!</h1>
                <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                <p><router-link class="btn btn-primary btn-lg" to="/show" exact=""> View details </router-link></p>
            </div>
        </div>
        <!-- End of First Topic -->

        <div class="container">
            <div class="row">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search for articles here">
                    </div>

            </div>
            <div class="row">
                <!-- Example row of columns -->
                    <div class="col-md-4">
                        <h2>Heading</h2>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <p><router-link class="btn btn-default" to="/show/2" exact=""> View details </router-link></p>
                    </div>
                <!-- End Example row of columns -->

                <!-- Example row of columns -->
                <div class="col-md-4">
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><router-link class="btn btn-default" to="/show/1" exact=""> View details </router-link></p>
                </div>
                <!-- End Example row of columns -->

                <!-- Example row of columns -->
                <div class="col-md-4">
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                </div>
                <!-- End Example row of columns -->

                <!-- Example row of columns -->
                <div class="col-md-4">
                    <h2>Heading</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                </div>
                <!-- End Example row of columns -->
            </div>
        </div>
    </div>

</template>

export default{
    components : {

    },
    data:function() {
    return {


    }
    },
    methods : {
    }
}