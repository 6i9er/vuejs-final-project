<template>
    <footer>
        <div class="container">
            <p>&copy; {{ date }} Company, Inc.</p>
        </div>
    </footer>
</template>
<script>

export default{
    components : {

    },
    data:function() {
        return {
            date: new Date().getFullYear(),
        }
    },
    methods : {
    }
}
</script>
