<template>
  <div class="bookslist">
    <v-col
      v-for="book in BOOKS"
      :key="book.id"
      cols="12"
    >
      <div class="book">
        <div class="book__img">
          <v-img :src="book.cover_image" class="book__img-item"></v-img>
        </div>
        <div class="book__info">
          <div class="book__info-left">
            <div class="book__title">{{book.title}}</div>
            <div class="book__subtitle">{{book.subtitle}}</div>
            <div class="book__author">{{book.authors}}</div>
          </div>
          <div class="book__info-right">
            <div class="book__rating">4.5</div>
            <div class="book__status book__status_green">На руках</div>
          </div>
        </div>
      </div>
    </v-col>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'

  export default {
    data: function() {
      return {
        search_query: "",
        books: []
      };
    },
    computed: mapGetters(['USER_PROFILE','BOOKS']),
    mounted: function() {
      this.$store.dispatch('GET_BOOKS')
    },
    methods: {
      // SearchQueryChange: function(search_query) {
      //   console.log("search_query", search_query)
      // },
    }
  }
</script>
