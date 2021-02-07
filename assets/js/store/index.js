import Vuex from 'vuex'
import Vue from 'vue'
import channel from './modules/channel.js'
import error from './modules/error.js'
import messages from './modules/messages.js'
import players from './modules/players.js'
import squares from './modules/squares.js'
import winner from './modules/winner.js'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    channel,
    error,
    messages,
    players,
    squares,
    winner
  }
})