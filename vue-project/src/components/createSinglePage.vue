<template>
    <div class="container">
        <div class="row">
            <h1 class="page-header">
                Add New Article
            </h1>
            <form>
                <div class="form-group">
                    <label for="recipient-name" class="control-label">Title :</label>
                    <input type="text" class="form-control" id="recipient-name">
                </div>

                <div class="form-group">
                    <label for="recipient-name" class="control-label">Content :</label>
                    <textarea class="form-control" rows="3"></textarea>
                </div>


                <label for="recipient-name" class="control-label">Categories  :</label>
                <ol>
                    <li>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Wizards
                            </label>
                        </div>
                    </li>

                    <li>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Wizards
                            </label>
                        </div>
                    </li>

                    <li>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Wizards
                            </label>
                        </div>
                    </li>
                </ol>



                <button type="button" class="form-control" >Add Post </button>
            </form>

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