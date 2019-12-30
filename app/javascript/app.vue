<template>
  <v-app>
    <v-container fluid>
      <AddBook />
      <v-tabs-items v-model="tabs">
        <v-tab-item
          value="bookslist"
        >
          <v-row>
            <Search />
          </v-row>
          <v-row>
            <v-col cols="12">
              <h1 class="headline">Книги</h1>
            </v-col>
          </v-row>
          <v-row>
            <BooksList />
          </v-row>
        </v-tab-item>
        <v-tab-item
          value="user-profile"
        >
          <UserProfile />
        </v-tab-item>
      </v-tabs-items>
      <v-tabs
        v-model="tabs"
        fixed-tabs
        color="teal"
      >
        <v-tab
          href="#bookslist"
        >
          <v-icon color="teal">library_books</v-icon>
        </v-tab>

        <v-tab
          href="#user-profile"
        >
          <v-icon color="teal">account_circle</v-icon>
        </v-tab>
        <v-tabs-slider></v-tabs-slider>
      </v-tabs>
    </v-container>
  </v-app>
</template>

<script>
import BooksList from 'components/bookslist'
import Search from 'components/search'
import AddBook from 'components/addbook'
import UserProfile from 'components/userprofile'
import {mapGetters} from 'vuex'

export default {
  components: {
    BooksList,
    AddBook,
    Search,
    UserProfile
  },
  data: function() {
    return {
      tabs: null
    };
  },
  computed: mapGetters(['USER_PROFILE']),
  mounted: function() {
    this.$store.dispatch('GET_PROFILE');
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.theme--light.v-tabs-items {
  background: none;
}
</style>
