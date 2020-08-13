<template>
  <div v-if="showModal" class="modal absolute top-0 left-0 w-full h-full">
    <div class="flex w-full h-full justify-center items-center flex-col">
      <div class="w-2/6 bg-white p-5 relative rounded rounded-lg">
        <button
          class="focus:outline-none absolute right-0 top-0 mr-5 my-2"
          @click="$emit('close')"
        >X</button>
        <slot />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Modal",
  props: {
    showModal: {
      type: Boolean,
      default: false
    }
  },
};
</script>

<style scoped>
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}
</style>
