<template>
    <div>
        <slot></slot>
    </div>
</template>

<script>
    import { mapMutations, mapState } from "vuex";
    import events from "./store/events-store";
    console.log()

    export default {
        name: "Calendar",
        props: ['initial-events'],
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