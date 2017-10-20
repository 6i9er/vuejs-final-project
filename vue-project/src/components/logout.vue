<template>

</template>

<script>

    import changeMenu from '../Mixins/changeMenu';
export default{

    created () {
        if(localStorage.member_id){
            localStorage.removeItem('member_id');
            this.changeMenu();
            this.$router.push('/login');
        }
    },
    mixins : [changeMenu],
}

</script>
