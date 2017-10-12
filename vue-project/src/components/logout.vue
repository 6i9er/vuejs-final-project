<template>

</template>

<script>

    import changeMenu from '../Mixins/changeMenu';
export default{

    created () {

       if(this.$session.has('member_id')){
           this.$session.remove('member_id')
           this.changeMenu();
            this.$router.push('/login');
       }
    },
    mixins : [changeMenu],
}

</script>
