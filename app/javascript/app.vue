<template>

  <div>
     for five<p>{{ message }} {{label}}</p>
  </div>
</template>

<script>
export default {
  name:'app',
  data: function () {
    return {
      message: "Hello faflkjasdl!",
    }
  },
  props: {
    label: String
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
