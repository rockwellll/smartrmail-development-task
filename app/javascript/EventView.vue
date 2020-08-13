<template>
  <div>
    <div>
      <div class="rounded rounded-sm bg-blue-600 text-white p-4 self-center">
        <span class="text-xs">{{events[0].name}}</span>
      </div>

      <button v-if="events.length" class="text-sm" @click="showModal= !showModal">View More</button>
    </div>

    <div v-if="showModal" class="modal absolute top-0 left-0 w-full h-full">
      <div class="flex w-full h-full justify-center items-center flex-col">
        <div class="w-2/6 bg-white p-5 relative">
          <button
            class="focus:outline-none absolute right-0 top-0 mr-5 my-2"
            @click="showModal= !showModal"
          >X</button>
          <single-event v-for="e in events" :event="e"></single-event>
        </div>
      </div>
    </div>
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
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}
</style>
