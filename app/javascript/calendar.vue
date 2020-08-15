<template>
  <div class="flex flex-col">
    <h1
      class="text-2xl self-center color-primary my-2 uppercase"
    >There are {{allEvents.length}} events</h1>

    <table class="w-full text-center">
      <thead>
        <tr>
          <th
            class="py-1 border w-1/12"
            v-for="(day, index) in weekdays"
            style="border-color: #D7D6F1"
          >
            <h1 class="color-primary">{{day}}</h1>
            <div class="flex-1 flex flex-row color-tertiary justify-center font-light">
              <h1>{{ordinalize(firstDayOfWeek+index)}}</h1>
              <h2 class="mx-2">{{month}}</h2>
            </div>
          </th>
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
  props: ["initial-events", "week-number", "first-day-of-week", "month"],
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
    ordinalize(dayNumber) {
      let suffix = "th";
      const number = dayNumber.toString();

      if (number.endsWith("1")) {
        suffix = "st";
      } else if (number.endsWith("2")) {
        suffix = "nd";
      } else if (number.endsWith("3")) {
        suffix = "rd";
      }

      return `${number}${suffix}`;
    },
  },
};
</script>

<style scoped>
</style>
