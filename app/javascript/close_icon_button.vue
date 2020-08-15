<template>
  <button class="focus:outline-none absolute mr-5 my-2 self-end" @click="$emit('click')">
    <svg class="h-7 w-7 p-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
      <path
        d="M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z"
      />
    </svg>
  </button>
</template>

<script>
export default {
  name: "close_icon_button",
};
</script>