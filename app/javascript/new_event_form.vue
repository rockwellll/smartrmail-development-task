<template>
  <div>
    <button
      @click="showModal= !showModal"
      class="p-2 rounded rounded-sm bg-blue-700 hover:bg-blue-500 text-white"
    >New Event!</button>

    <modal v-on:close="showModal= !showModal" :show-modal="showModal">
      <h1>Create New Product</h1>

      <form action>
        <div class="flex flex-col">
          <label for="name">Name</label>

          <input
            v-bind:class="{'border-red-500': name.length === 0 && didSubmit }"
            id="name"
            type="text"
            name="name"
            v-model="name"
            class="p-2 rounded bg-gray-300 focus:outline-none border focus:bg-white focus:border-blue-600 resize-none"
          />


          <label for="begins_at">Starts at</label>
          <input
            v-bind:class="{'border-red-500': this.begins_at.length === 0 && didSubmit }"
            type="date"
            id="begins_at"
            name="begins_at"
            value
            v-model="begins_at"
            class="p-2 rounded bg-gray-300 border focus:outline-none focus:bg-white focus:border-blue-600 resize-none"
          />

          <label for="ends_at">Ends at</label>
          <input
            v-bind:class="{'border-red-500': this.ends_at.length === 0 && didSubmit }"
            type="date"
            name="ends_at"
            id="ends_at"
            value=""
            v-model="ends_at"
            :min="begins_at"
            class="p-2 rounded bg-gray-300 border focus:outline-none focus:bg-white focus:border-blue-600 resize-none"
          />

          <label for="description">Description</label>
          <input
            v-bind:class="{'border-red-500': this.description.length === 0 && didSubmit }"
            id="description"
            type="text"
            name="description"
            v-model="description"
            class="p-2 rounded bg-gray-300 focus:bg-white border focus:outline-none focus:border-blue-600 resize-none"
          />
        </div>
      </form>

      <div class="actions">
        <button
          @click="addN"
          type="submit"
          class="p-2 rounded rounded-sm bg-blue-700 hover:bg-blue-500 text-white"
        >Create!</button>
      </div>
    </modal>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
export default {
  name: "NewEvent",
  data: () => ({
    showModal: false,
    name: "",
    description: "",
    begins_at: "",
    ends_at: "",
    id: new Date().toLocaleString(),
    didSubmit: false,
  }),
  watch: {
    allEvents(old, newVal) {
      console.log("old is", old);
      console.log("new is", newVal);
    },
  },
  methods: {
    ...mapMutations(["addEvent"]),
    add: function () {
      this.addEvent({
        name: "added new",
        description: "adklknasldkasf",
        begins_at: new Date(),
        ends_at: new Date(),
      });
    },

    addN() {
      console.log(JSON.stringify({
        event: {
          name: this.name,
          description: this.description,
          begins_at: this.begins_at,
          ends_at: this.ends_at,
        },
      }));

      this.didSubmit = true;
      if (this.notValidInputs()) return;

      fetch("/events.json", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          event: {
            name: this.name,
            description: this.description,
            begins_at: this.begins_at,
            ends_at: this.ends_at,
          },
        }),
      })
        .then((res) => {
          console.log("res is",res);

          return res.json();
      })
        .then((res) => console.log("json res", res))
        .catch((err) => console.log("err is ", err));
    },

    notValidInputs() {
      return (
        this.name.length === 0 &&
        this.description.length === 0 &&
        this.begins_at.length === 0 &&
        this.ends_at.length === 0
      );
    },
  },
};
</script>

<style scoped>
</style>
