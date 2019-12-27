import Vue from 'vue';
import Vuex from 'vuex';
import Axios from 'axios';
import books from './books';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {},
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    books,
  },
});
