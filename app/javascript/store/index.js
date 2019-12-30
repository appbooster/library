import Vue from 'vue'
import Vuex from 'vuex'
import books from './books'
import user from './user'

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    books,
    user
  },
});
