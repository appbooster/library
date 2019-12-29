<template>
  <v-app>
    <v-container fluid>
      <v-tabs-items v-model="tabs">
        <v-tab-item
          value="bookslist"
        >
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
      >
        <v-tab
          href="#bookslist"
          class="primary--text"
        >
          <v-icon>library_books</v-icon>
        </v-tab>

        <v-tab
          href="#user-profile"
          class="primary--text"
        >
          <v-icon>account_circle</v-icon>
        </v-tab>
        <v-tabs-slider></v-tabs-slider>
      </v-tabs>
    </v-container>
  </v-app>
</template>

<script>
import BooksList from 'components/bookslist'
import UserProfile from 'components/userprofile'

export default {
  components: {
    BooksList,
    UserProfile
  },
  data: function() {
    return {
      tabs: null
    };
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
