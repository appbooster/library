<template>
  <v-app>
    <p>{{ message }}</p>
    <v-alert
      :value="true"
      type="success"
    >
      This is a success alert.
    </v-alert>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Welcome to Appbooster Library!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
