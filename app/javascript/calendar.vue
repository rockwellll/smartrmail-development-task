<template>
    <div>
        <h1>you have {{events.length}} items</h1>
      <slot></slot>
    </div>
</template>

<script>
    import { mapMutations, mapState } from "vuex";

    export default {
        name: "Calendar",
        data: () =>({
            weekdays: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
        }),
        props: ['initial-events', "weeks"],
        computed: {
            ...mapState(['events'])
        },
        mounted: function() {
            this.setEvents(
                this.$props.initialEvents
            );
        },
        methods: {
            ...mapMutations(['setEvents'])
        }
    }
</script>

<style scoped>

</style>