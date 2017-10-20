<template>
    <transition name="modal">
        <div class="modal" style="display: block">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            Modal title
                        </h4>
                    </div>

                    <div class="modal-body">
                    </div>

                    <div class="modal-footer">
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
            title: '',
            body: ''
        }
    },
    methods : {
        close: function () {
            this.$emit('close');
            this.title = '';
            this.body = '';
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
</style>

