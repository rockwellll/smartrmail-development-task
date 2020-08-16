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
      height="auto"
      :adaptive="true"
      :name="event.id.toString().concat('event_modal')"
    >
      <div class="flex flex-col h-full">
        <close-icon-button v-on:click="hideModal" class="absolute top-0" />

        <div class="text-left w-full h-full flex flex-col justify-center">
          <span class="uppercase text-bold color-primary text-lg">{{event.name}}</span>
          <div class="flex flex-col mt-4">
            <div class="flex justify-between items-center">
              <span>from {{event.begins_at.split("T")[0]}} to {{event.ends_at.split("T")[0]}}</span>

              <span>{{event.location}}</span>
            </div>

            <p class="mt-2">{{event.description}}</p>
          </div>

          <h2 v-if="event.users.length > 0">People who are going</h2>
          <div class="w-full flex mt-2 attendances-container">
            <div
              class="border-2 flex justify-center items-center p-2 hover:border-indigo-500 bg-white"
              v-for="user in event.users"
              style="width: 60px; height: 60px; border-radius: 30px; "
            >
              <img :src="imageSourceFor(user)" alt :title="user" class="rounded-full self-center" />
            </div>
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
    imageSourceFor(user) {
      return `https://robohash.org/${user}@foo.bar?set=set4&bgset=&size=400x400`;
    },
  },
};
</script>

<style scoped>
.attendances-container div:not(:first-child) {
  margin-left: -10px;
}

</style>
