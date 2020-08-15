<template>
  <div class="my-2 self-center w-2/3">
    <div
      class="rounded-lg p-4 self-center text-xs text-left text-white border border-primary bg-primary"
    >
      <span>{{event.name.substring(0, 10)}}...</span>
      <div class="flex flex-col">
        <span>from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}</span>

        <p>{{event.description.substring(0, 10)}}...</p>
      </div>

      <button class="focus:outline-none underline" @click="showModal">view more</button>
    </div>

    <modal
      style="min-height: 200px"
      classes="p-5 relative rounded-lg"
      :name="event.id.toString().concat('event_modal')"
    >
      <div class="flex flex-col h-full">
        <close-icon-button v-on:click="hideModal" class="absolute top-0" />

        <div class="text-left w-full h-full flex flex-col justify-center">
          <span class="uppercase text-bold color-primary text-lg">{{event.name}}</span>
          <div class="flex flex-col mt-4">
            <span>from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}</span>

            <p class="mt-2">{{event.description}}</p>
          </div>
        </div>
      </div>
    </modal>
  </div>
</template>

<script>
export default {
  name: "EventView",
  props: ["event"],
  methods: {
    showModal() {
      this.$modal.show(this.$props.event.id.toString().concat("event_modal"));
    },
    hideModal() {
      this.$modal.hide(this.$props.event.id.toString().concat("event_modal"));
    },
  },
};
</script>
