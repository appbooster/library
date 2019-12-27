<template>
  <div class="bookslist">
    <v-col cols="12" sm="9">
      <v-text-field
        label="Книги"
        rounded
        clearable
        placeholder="Поиск книги"
        solo
      ></v-text-field>
    </v-col>
    <v-col
      v-for="book in books"
      :key="book.id"
      cols="12"
    >
      <v-card
        class="mx-auto"
        max-width="900"
        outlined
        tile
      >
        <div class="d-flex flex-no-wrap justify-space-between">
          <v-avatar
            class="ma-3"
            size="250"
            tile
          >
            <v-img :src="book.cover_image"></v-img>
          </v-avatar>
          <div>
            <v-card-title
              size="300"
              class="headline"
              v-text="book.title"
            ></v-card-title>
            <v-card-title
              size="200"
              v-text="book.subtitle"
            ></v-card-title>
            <v-card-subtitle v-text="book.authors"></v-card-subtitle>
          </div>
        </div>
      </v-card>
    </v-col>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function() {
      return {
        search_query: "",
        books: []
      };
    },
    created: function() {
      this.json_api_url = `/api/v1/books`
    },
    mounted: function() {
      axios
        .get(this.json_api_url)
        .then(response => (this.books = response.data.books));
    },
    methods: {
      // SearchQueryChange: function(search_query) {
      //   console.log("search_query", search_query)
      // },
    }
  }
</script>
