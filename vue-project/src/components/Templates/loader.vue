<template>
    <!--<div id="myLoader">-->
        <!--<div class="loader"></div>-->
    <!--</div>-->

</template>
<script>

export default{
    components : {

    },
    data:function() {
    return {
        showLoader : false,

    }
    },
    methods : {
    }
}
</script>
<style >
    #myLoader{
        display: block;
        width: 100%;
        height: 100%;
        padding: 50% 50%;
        position: fixed;
        z-index: 1000;
        background:rgba(0, 0, 0, 0.5);
    }


    .loader {
        border: 16px solid #f3f3f3; /* Light grey */
        border-top: 16px solid #3498db; /* Blue */
        border-radius: 50%;
        width: 120px;
        height: 120px;
        animation: spin 2s linear infinite;
        position: fixed;
        margin: auto auto;
        z-index: 10000;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>
