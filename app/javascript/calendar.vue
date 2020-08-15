<template>
  <div>
    <slot></slot>

    <table class="w-full text-center">
      <thead>
        <tr>
          <th class="w-1/12" v-for="day in weekdays"></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(event, index) in allEvents" class="w-full">
          <td v-for="(day, i) in weekdays" :key="i">
            <div
              v-if="event.wday === day && event.weekNumber.toString() === weekNumber.toString()"
              class="flex justify-center items-center text-gray-600 flex-col my-3"
              style="height: 100px;"
            >
              <event :key="index" :event="event" :index="index"></event>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { mapMutations, mapGetters } from "vuex";

export default {
  name: "Calendar",
  props: ["initial-events", "week-number"],
  data: () => ({
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
  computed: {
    ...mapGetters(["allEvents"]),
  },
  created: function () {
    this.setEvents(this.$props.initialEvents);
  },
  methods: {
    ...mapMutations(["setEvents"]),
  },
};
</script>

<style scoped>
</style>
