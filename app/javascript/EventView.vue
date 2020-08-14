<template>
  <div>
    <div>
      <div v-if="events.length > 0" class="rounded rounded-sm bg-blue-600 text-white p-4 self-center">
        <span class="text-xs">{{events[0].name}}</span>
      </div>

      <button v-if="events.length > 1" class="text-sm" @click="showModal= !showModal">View More</button>
    </div>

    <modal v-bind:showModal="showModal" :showModal="showModal" v-on:close="showModal= !showModal">
      <single-event v-for="e in events" :event="e"></single-event>
    </modal>
  </div>
</template>

<script>
export default {
  name: "EventView",
  props: ["events", "day", "month"],
  data: () => ({
    showModal: false,
  }),
};
</script>

<style scoped>
</style>
