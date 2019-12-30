<template>
  <div class="user-profile">
      <v-card
        class="mx-auto"
        max-width="900"
        min-height="600px"
        justify="center"
        tile
      >
        <div v-if="USER_PROFILE === null">
          <g-signin-button
            :params="googleSignInParams"
            @success="onSignInSuccess"
            @error="onSignInError">
            Sign in with Google
          </g-signin-button>
        </div>
        <div v-else>
          This is the user's profile
          {{ USER_PROFILE }}
        </div>
      </v-card>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  import Axios from 'axios'
  import GSignInButton from 'vue-google-signin-button'

  export default {
    components: {
      GSignInButton
    },
    data: function() {
      return {
        googleSignInParams: {
          client_id: '576276451752-8l6fhai7g02icl7ebb0dop97e4ni7pbl.apps.googleusercontent.com'
        }
      };
    },
    computed: mapGetters(['USER_PROFILE']),
    mounted: function() {
      const user_token = localStorage.getItem('user-token')
      if (user_token) {
        this.$store.dispatch('GET_PROFILE', user_token)
      }

    },
    methods: {
      onSignInSuccess (googleUser) {
        const profile = googleUser.getBasicProfile()
        const user_profile = { user: { email: profile.U3,
                                       google_uid: profile.Eea,
                                       first_name: profile.ofa,
                                       last_name: profile.wea,
                                       remote_avatar_url: profile.Paa
                                     } }
        this.$store.dispatch('LOGIN_USER', user_profile)
      },
      onSignInError (error) {
        // `error` contains any error occurred.
        console.log('OH NOES', error)
      }
    }
  }
</script>
