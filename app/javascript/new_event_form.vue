<template>
  <div>
    <button @click="showModal" class="px-4 mr-3 py-3 rounded-lg bg-primary text-white">New Event</button>

    <modal
      height="auto"
      :adaptive="true"
      classes="rounded-lg border-primary p-2 sm:w-1/12"
      :clickToClose="false"
      name="new_event_form_modal"
    >
      <div class="py-2 px-1 md:px-5 flex flex-col">
        <close-icon-button v-on:click="hideModal" />
        <h1>Create New Event</h1>

        <form>
          <div class="flex flex-col">
            <label class="my-2" for="name">Name</label>

            <input
              v-bind:class="{'border-red-500': name.length === 0 && didSubmit }"
              id="name"
              type="text"
              name="name"
              v-model="name"
              class="p-2 rounded bg-gray-100 focus:outline-none border focus:bg-white focus:border-primary"
              placeholder="event name"
            />

            <label class="my-2" for="begins_at">Starts at</label>
            <input
              v-bind:class="{'border-red-500': this.begins_at.length === 0 && didSubmit }"
              type="date"
              id="begins_at"
              name="begins_at"
              :min="minDateForEvents"
              v-model="begins_at"
              class="p-2 rounded bg-gray-100 border focus:outline-none focus:bg-white focus:border-primary"
              placeholder="Event start date"
            />

            <label class="my-2" for="ends_at">Ends at</label>
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

            <label class="my-2" for="location">Location</label>

            <input
              v-bind:class="{'border-red-500': this.location.length === 0 && didSubmit }"
              id="location"
              type="text"
              name="location"
              v-model="location"
              class="p-2 rounded bg-gray-100 focus:outline-none border focus:bg-white focus:border-primary"
              placeholder="Location"
            />

            <label class="my-2" for="description">Description</label>
            <textarea
              v-bind:class="{'border-red-500': this.description.length === 0 && didSubmit }"
              id="description"
              name="description"
              v-model="description"
              class="p-2 rounded bg-gray-100 focus:bg-white border focus:outline-none focus:border-primary resize-none"
              placeholder="description"
            ></textarea>

            <label class="my-2" for="peoples">Who is coming?</label>
            <div class="w-full flex">
              <input
                v-bind:class="{'border-red-500': attendanceIsEmpty }"
                id="peoples"
                type="text"
                name="location"
                v-model.trim="username"
                class="p-2 w-8/12 md:w-10/12 rounded-tl-lg rounded-bl-lg bg-gray-100 focus:outline-none border focus:bg-white focus:border-primary"
                placeholder="Username"
              />

              <button
                @click="addAttendance"
                type="button"
                class="p-2 w-4/12 md:w-2/12 text-xs md:text-sm rounded-tr-lg rounded-br-lg border bg-primary text-white focus:outline-none focus:shadow"
              >Add User</button>
            </div>
            <div class="flex mt-2 flex-wrap w-full">
              <div
                v-for="user in attendances"
                class="p-2 mx-2 border rounded-lg justify-center items-center relative flex-wrap my-1"
              >
                <span>{{user}}</span>
                <button class="self-end" @click=" () => removeFromAttendance(user)">
                  <svg class="h-2 w-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                    <path
                      d="M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z"
                    />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </form>

        <div class="actions my-2 w-full flex justify-end">
          <button
            @click="add"
            type="submit"
            class="p-2 rounded-lg border bg-primary text-white focus:outline-none focus:shadow"
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
  props: ["min-date-for-events"],
  data: () => ({
    name: "",
    description: "",
    begins_at: "",
    ends_at: "",
    location: "",
    username: "",
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
    attendances: [],
    attendanceIsEmpty: false,
  }),
  watch: {
    begins_at(val) {
      if (val > this.ends_at) {
        this.ends_at = "";
      }
    },
    username(val) {
      if (val !== "") {
        this.attendanceIsEmpty = false;
      }
    },
  },
  methods: {
    ...mapMutations(["addEvent"]),
    add() {
      this.didSubmit = true;

      if (this.notValidInputs()) return;

      const event = {
        name: this.name,
        description: this.description,
        begins_at: this.begins_at,
        ends_at: this.ends_at,
        location: this.location,
        users: this.attendances.join(","),
      };

      axios
        .post("/events.json", {
          event,
        })
        .then(() => {
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
      this.location = "";
      this.attendances = [];
      this.username = "";
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

    addAttendance(e) {
      e.preventDefault();
      if (this.username === "") {
        this.attendanceIsEmpty = true;
        return;
      }

      this.attendances = [this.username, ...this.attendances];
      this.username = "";
    },
    removeFromAttendance(user) {
      this.attendances = this.attendances.filter(
        (attendance) => attendance !== user
      );
    },
  },
};
</script>

<style scoped>
::placeholder {
  color: #d7d6f1;
}
</style>
