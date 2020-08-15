<template>
  <div class="my-2 self-center w-2/3">
      <div class="rounded rounded-sm bg-blue-600 text-white p-4 self-center text-xs text-left text-white">
        <span>{{event.name}}</span>
        <div class="flex flex-col">
          <span>Starts At: {{event.begins_at.split("T")[0]}}</span>
          <span>Ends At: {{event.ends_at.split("T")[0]}}</span>

          <p>{{event.description}}</p>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  name: "EventView",
  props: ["event"],
};
</script>