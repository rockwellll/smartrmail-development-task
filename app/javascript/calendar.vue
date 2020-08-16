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
            <table-header
              :day="day"
              :first-day-of-week="firstDayOfWeek"
              :index="index"
              :month="month"
            />
          </th>
        </tr>
      </thead>
      <tbody class="mobile hidden md:table-row-group">
        <tr
          v-if="event.weekNumber === weekNumber"
          v-for="(event, index) in allEvents"
          class="w-full"
        >
          <td :data-label="day" v-for="(day, i) in weekdays" :key="i">
            <div
              v-if="event.wday === day && event.weekNumber.toString() === weekNumber.toString()"
              class="flex justi fy-center items-center text-gray-600 flex-col my-3"
            >
              <div class="block md:hidden mt-5">
                <table-header :day="day" :first-day-of-week="firstDayOfWeek" :index="i" />
              </div>
              <event :key="event.id" :event="event"></event>
            </div>
          </td>
        </tr>
      </tbody>

      <tbody class="block md:hidden">
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
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  tbody.mobile tr,
  td {
    display: block;
  }
}
</style>
