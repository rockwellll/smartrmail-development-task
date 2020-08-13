<template>
  <div>
    <button
      @click="showModal= !showModal"
      class="p-2 rounded rounded-sm bg-blue-700 hover:bg-blue-500 text-white"
    >New Event!</button>

    <modal v-on:close="showModal= !showModal" :show-modal="showModal">
      <h1>Create New Product</h1>

      <slot></slot>
    </modal>
  </div>
</template>

<script>
export default {
  name: "NewEvent",
  data: () => ({
    showModal: false,
  }),
};
</script>

<style scoped>
</style>
