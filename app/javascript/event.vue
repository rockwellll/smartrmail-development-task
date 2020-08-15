<template>
  <div class="my-2 self-center w-2/3">
    <div class="rounded-sm bg-blue-600 p-4 self-center text-xs text-left text-white">
      <span>{{event.name.substring(0, 10)}}...</span>
      <div class="flex flex-col">

        <span>
          from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}
        </span>

        <p>{{event.description.substring(0, 10)}}...</p>
      </div>

      <button>
        view more
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "EventView",
  props: ["event"],
};
</script>
