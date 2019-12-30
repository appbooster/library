import Axios from 'axios'
const user_token = localStorage.getItem('user-token')
if (user_token) {
  Axios.defaults.headers.common['Authorization'] = 'Bearer ' + user_token
}


const state = {
  books: [],
}

const getters = {
  BOOKS: state => {
    return state.books
  },
}

const mutations = {
  SET_BOOKS: (state, payload) => {
    state.books = payload
  },

  ADD_BOOK: (state, payload) => {
    state.books.push(payload)
  },
}

const actions = {
  GET_BOOKS: async (context, payload) => {
    let {data} = await Axios.get('/api/v1/books')
    context.commit('SET_BOOKS', data.books)
  },

  SAVE_BOOK: async (context, payload) => {
    let {data} = await Axios.post('/api/v1/books')
    context.commit('ADD_BOOK', payload)
  },
}

export default {
  state,
  getters,
  mutations,
  actions,
}
