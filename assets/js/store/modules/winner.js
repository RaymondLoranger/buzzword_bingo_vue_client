const state = {
  winner: null
}

const getters = {
  getWinner: state => state.winner
}

const actions = {
  setWinner({ commit }, winner) {
    commit('setWinner', winner)
  }
}

const mutations = {
  setWinner(state, winner) {
    state.winner = winner
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}