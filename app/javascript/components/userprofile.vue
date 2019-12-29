<template>
  <div class="user-profile">
      <v-card
        class="mx-auto"
        max-width="900"
        min-height="600px"
        tile
      >
        <div class="d-flex flex-no-wrap justify-space-between">
          This is the user's profile
          {{ USER_PROFILE }}
        </div>
      </v-card>
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
    computed: mapGetters(['USER_PROFILE']),
    mounted: function() {
      this.$store.dispatch('LOGIN_USER')
      this.$store.dispatch('GET_PROFILE')
    },
    methods: {
      // SearchQueryChange: function(search_query) {
      //   console.log("search_query", search_query)
      // },
    }
  }
</script>
