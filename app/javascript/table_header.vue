<template>
  <div class="text-center">
    <h1 class="color-primary">{{day}}</h1>
    <div class="flex-1 flex flex-row color-tertiary justify-center font-light">
      <h1>{{ordinalize(firstDayOfWeek+index)}}</h1>
      <h2 class="mx-2">{{month}}</h2>
    </div>
  </div>
</template>

<script>
export default {
  props: ["day", "firstDayOfWeek", "index", "month"],
  methods: {
    ordinalize(dayNumber) {
      let suffix = "th";
      const number = dayNumber.toString();

      const daysWithOne = [1, 21, 31];
      const daysWithTwo = [2, 22];

      console.log(daysWithOne.indexOf(dayNumber));
      const daysWitThree = [3, 23];

      if (daysWithOne.indexOf(dayNumber) > -1) {
        suffix = "st";
      } else if (daysWithTwo.indexOf(dayNumber) > -1) {
        suffix = "nd";
      } else if (daysWitThree.indexOf(dayNumber) > -1) {
        suffix = "rd";
      }

      return `${number}${suffix}`;
    },
  },
};
</script>

<style scoped>
</style>
