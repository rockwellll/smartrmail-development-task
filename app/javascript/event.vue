<template>
  <div class="my-2 self-center w-2/3">
    <div class="rounded-sm p-4 self-center text-xs text-left text-white border border-primary bg-primary">
      <span>{{event.name.substring(0, 10)}}...</span>
      <div class="flex flex-col">

        <span>
          from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}
        </span>

        <p>{{event.description.substring(0, 10)}}...</p>
      </div>

      <button class="focus:outline-none underline" @click="showModal">
        view more
      </button>
    </div>

    <modal classes="p-5 relative" height="auto" :name="event.id.toString().concat('event_modal')">
        <div class="flex flex-col">
          <close-icon-button v-on:click="hideModal" class="absolute top-0"/>

          <div class="text-left w-full">
            <span>{{event.name}}</span>
            <div class="flex flex-col">

        <span>
          from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}
        </span>

              <p>{{event.description}}</p>
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
       this.$modal.show(this.$props.event.id.toString().concat('event_modal'));
    },
    hideModal() {
      this.$modal.hide(this.$props.event.id.toString().concat('event_modal'));
    }
  }
};
</script>
