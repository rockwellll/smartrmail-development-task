<template>
    <div>
       one to three 5  <p>{{ message }} {{label}}</p>
    </div>
</template>

<script>
    export default {
        name:'test',
        data: function () {
            return {
                message: "Test Vue",
            }
        },
        props: {
            label: String
        }
    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }
</style>
