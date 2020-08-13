<template>
  <div
    class="rounded rounded-sm border border-b-2 border-gray-400 text-white p-4 self-center text-black my-2 text-left"
  >
    <span class="text-xs text-black">{{event.name}}</span>
    <div class="flex flex-col text-black">
      <span>Starts At: {{event.begins_at}}</span>
      <span>Ends At: {{event.ends_at}}</span>

      <p>{{event.description}}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "SingleEvent",
  props: ["event"],
};
</script>
