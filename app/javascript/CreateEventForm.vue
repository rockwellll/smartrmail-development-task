<template>
    <form action="/events" method="post">
        <slot></slot>

         <div>
             <label for="name"></label>
             <input type="text" name="name"/>
         </div>
    </form>
</template>

<script>
    export default {
        name: "CreateEventForm",
        props: ["event"]
    }
</script>

<style scoped>

</style>