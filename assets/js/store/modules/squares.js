const state = {
  squares: []
}

const getters = {
  getSquares: state => state.squares
}

const actions = {
  setSquares({ commit }, squares) {
    commit('setSquares', squares)
  }
}

const mutations = {
  setSquares(state, squares) {
    state.squares = squares
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}