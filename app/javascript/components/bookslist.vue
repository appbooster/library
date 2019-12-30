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

<style scoped>
  .book {
    display: flex;
    padding-bottom: 12px;
    border-bottom: 1px solid lightgray;
  }
  .book__img {
    width: 15%;
  }
  .book__img-item {
    width: 100%;
  }
  .book__info {
    width: 85%;
    display: flex;
    justify-content: space-between;
    padding: 0 12px;
  }
  .book__title {
    font-size: 14px;
    color: #333;
  }
  .book__subtitle {
    font-size: 10px;
    margin-bottom: 8px;
    color: gray;
  }
  .book__author {
    font-size: 10px;
    color: gray;
  }
  .book__status {
    white-space: nowrap;
  }
  .book__status_green {
    color: teal;
  }
  .book__info-right {
    text-align: right;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
  }
  .book__info-left {
    width: 75%;
  }
  .book__rating {
    font-weight: bold;
  }
</style>
