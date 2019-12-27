import Axios from 'axios';

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
    console.log("payload", payload)
    state.books = payload
  },

  ADD_BOOK: (state, payload) => {
    state.books.push(payload)
  },
}

const actions = {
  GET_BOOKS: async (context, payload) => {
    let {data} = await Axios.create({
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer '+ 'eyJhbGciOiJIUzI1NiJ9.eyJnb29nbGVfdWlkIjoiMTIzNDU2NzgiLCJleHAiOjE1NzgwNTY3MTN9.xGw_1YYfycgLX1sKJgBP4yjanrQuLYbEn4ncp0pBYiI'
        }
    }).get('/api/v1/books')
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
