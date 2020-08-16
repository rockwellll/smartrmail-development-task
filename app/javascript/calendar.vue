<template>
  <div class="flex flex-col">
    <h1
      class="text-2xl self-center color-primary my-2 uppercase"
    >There are {{allEvents.length}} events</h1>

    <table class="w-full text-center">
      <thead class="hidden lg:block">
        <tr>
          <th
            class="py-1 border w-1/12"
            v-for="(day, index) in weekdays"
            style="border-color: #D7D6F1"
          >
            <table-header
              :day="day"
              :first-day-of-week="firstDayOfWeek"
              :index="index"
              :month="month"
            />
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(events, day) in this.eventsWithinSameDay()"
          v-if="events.length !== 0"
          class="block"
        >
          <div class="block mt-5">
            <table-header
              :day="day"
              :first-day-of-week="firstDayOfWeek"
              :index="weekdays.indexOf(day)"
              :month="month"
            />
          </div>
          <td class="block" v-for="(event, index) in events">
            <div class="flex justify-center items-center text-gray-600 flex-col my-3">
              <event :key="event.id" :event="event"></event>
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
    eventsWithinSameDay() {
      const result = {
        Monday: "",
        Tuesday: "",
        Wednesday: "",
        Thursday: "",
        Friday: "",
        Saturday: "",
        Sunday: "",
      };

      Object.keys({ ...result }).map((key) => {
        result[key] = this.allEvents.filter(
          (event) => event.wday === key && event.weekNumber === this.weekNumber
        );
      });

      return result;
    },
  },
};
</script>

<style scoped>
@media only screen and (max-width: 760px) {
  thead tr {
    display: none;
  }
}
</style>
