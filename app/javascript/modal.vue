<template>
  <div v-if="showModal" class="modal absolute top-0 left-0 w-full h-full">
    <div class="flex w-full h-full justify-center items-center flex-col">
      <div class="w-2/6 bg-white p-5 relative rounded-lg border-primary rounded-lg">
        <button class="focus:outline-none absolute mr-5 my-2" @click="$emit('close')">
          <svg class="h-7 w-7 p-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path
              d="M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z"
            />
          </svg>
        </button>
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
      default: false,
    },
  },
};
</script>

<style scoped>
.modal {
  background-color: rgba(0, 0, 0, 0.5);
}

  button {
    top: 10px;
    right: 10px;
  }

  svg {
    color: black;
  }

  svg:hover {
    color: #8382f5;
  }
</style>
