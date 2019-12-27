<template>
  <v-app>
    <v-container fluid>
      <v-row>
        <v-col cols="12">
          <v-row
            align="start"
            justify="center"
            class="grey lighten-5"
          >
            <BooksList />
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import BooksList from 'components/bookslist'

export default {
  components: {
    BooksList
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
