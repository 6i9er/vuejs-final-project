<template>
    <transition name="modal" >
        <div class="modal modal-mask" id="a7a" style="display: block;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4  class="modal-title">
                            confirm this Post
                        </h4>
                    </div>

                    <div class="modal-body">
                        <slot name="title"></slot>
                        <slot name="content"></slot>
                        <slot name="author"></slot>
                        <slot name="categories"></slot>
                    </div>

                    <div class="modal-footer">
                        <slot name="buttons"></slot>

                    </div>
                </div>
            </div>
        </div>
    </transition>

</template>

<script>

export default{
    template: '#modal-template',
    components : {

    },
    props: ['show'],
    data:function() {
        return {

        }
    },
    methods : {
        close: function () {
            this.$modal.hide('modal');
        },
    },
    created () {

    },
    mixins : []
}
</script>

<style  scoped="">
    .modal-enter {
        opacity: 0;
    }

    .modal-leave-active {
        opacity: 0;
    }

    .modal-enter .modal-container,
    .modal-leave-active .modal-container {
        -webkit-transform: scale(1.1);
        transform: scale(1.1);
    }
    .modal-mask {
        position: fixed;
        z-index: 9998;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, .5);
        display: table;
        transition: opacity .3s ease;
    }
</style>

