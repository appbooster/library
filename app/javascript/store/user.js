import Axios from 'axios'
const user_token = localStorage.getItem('user-token')
if (user_token) {
  Axios.defaults.headers.common['Authorization'] = 'Bearer ' + user_token
}


const state = {
  status: '',
  user_token: localStorage.getItem('user-token') || '',
  user : {}
}

const getters = {
  USER_TOKEN: state => {
    return state.user_token
  },
  USER_PROFILE: state => {
    return state.user
  },
}

const mutations = {
  SET_USER_TOKEN: (state, payload) => {
    state.user_token = payload
  },
  SET_USER_PROFILE: (state, payload) => {
    state.user = payload
  },
}

const actions = {
  LOGIN_USER: async (context, payload) => {
    console.log('LOGIN_USER context', context)
    let {data} = await Axios.post('/api/v1/login', {
      "user": {
        "google_uid": "101441826224058892832"
      }
    })
    localStorage.setItem('user-token', data.access_token)
    context.commit('SET_USER_TOKEN', data.access_token)
  },
  GET_PROFILE: async (context, payload) => {
    let {data} = await Axios.get('/api/v1/profile')
    context.commit('SET_USER_PROFILE', data.profile)
  },

}

export default {
  state,
  getters,
  mutations,
  actions,
}
