<template>
  <div>
    <button @click="showModal" class="p-2 rounded-lg bg-primary text-white">New Event!</button>

    <modal
      height="auto"
      classes="rounded-lg border-primary p-2"
      :clickToClose="false"
      name="new_event_form_modal"
    >
      <div class="py-2 px-5 flex flex-col">
        <close-icon-button v-on:click="hideModal" />
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
              class="p-2 rounded bg-gray-100 focus:outline-none border focus:bg-white focus:border-primary"
              placeholder="event name"
            />

            <label for="begins_at">Starts at</label>
            <input
              v-bind:class="{'border-red-500': this.begins_at.length === 0 && didSubmit }"
              type="date"
              id="begins_at"
              name="begins_at"
              value
              v-model="begins_at"
              class="p-2 rounded bg-gray-100 border focus:outline-none focus:bg-white focus:border-primary"
              placeholder="Event start date"
            />

            <label for="ends_at">Ends at</label>
            <input
              v-bind:class="{'border-red-500': this.ends_at.length === 0 && didSubmit }"
              type="date"
              name="ends_at"
              id="ends_at"
              value
              v-model="ends_at"
              :min="begins_at"
              class="p-2 rounded bg-gray-100 border focus:outline-none focus:bg-white focus:border-primary"
              placeholder="Event end date"
            />

            <label for="description">Description</label>
            <textarea
              v-bind:class="{'border-red-500': this.description.length === 0 && didSubmit }"
              id="description"
              name="description"
              v-model="description"
              class="p-2 rounded bg-gray-100 focus:bg-white border focus:outline-none focus:border-primary resize-none"
              placeholder="description"
            ></textarea>
          </div>
        </form>

        <div class="actions my-2">
          <button
            @click="add"
            type="submit"
            class="p-2 rounded-lg border bg-primary-outline text-black"
          >Create</button>
        </div>
      </div>
    </modal>
  </div>
</template>

<script>
import { mapMutations } from "vuex";
import axios from "axios";

export default {
  name: "NewEvent",
  data: () => ({
    name: "",
    description: "",
    begins_at: "",
    ends_at: "",
    id: new Date().toLocaleString(),
    didSubmit: false,
    weekdays: [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ],
  }),
  methods: {
    ...mapMutations(["addEvent"]),
    add() {
      this.didSubmit = true;
      if (this.notValidInputs()) return;

      axios
        .post("/events.json", {
          name: this.name,
          description: this.description,
          begins_at: this.begins_at,
          ends_at: this.ends_at,
        })
        .then(() => {
          this.addEvent({
            name: this.name,
            description: this.description,
            begins_at: this.begins_at,
            ends_at: this.ends_at,
            wday: this.weekdays[new Date(this.begins_at).getDay()],
            weekNumber: this.getWeekNumber(new Date(this.begins_at)),
          });

          this.hideModal();
          this.resetInputs();
        })
        .catch((err) => console.log("err is ", err));
    },

    notValidInputs() {
      return (
        this.name.length === 0 ||
        this.description.length === 0 ||
        this.begins_at.length === 0 ||
        this.ends_at.length === 0
      );
    },

    resetInputs() {
      this.name = "";
      this.description = "";
      this.begins_at = "";
      this.ends_at = "";
      this.didSubmit = false;
    },

    hideModal() {
      this.$modal.hide("new_event_form_modal");
    },

    getWeekNumber(d) {
      d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
      d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay() || 7));
      const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
      const weekNo = Math.ceil(((d - yearStart) / 86400000 + 1) / 7);
      return weekNo;
    },

    showModal() {
      this.$modal.show("new_event_form_modal");
    },
  },
};
</script>

<style scoped>
::placeholder {
  color: #d7d6f1;
}
</style>
