const state = {
  error: ''
}

const getters = {
  getError: state => state.error
}

const actions = {
  setError({ commit }, payload) {
    commit('setError', payload)
  }
}

const mutations = {
  setError(state, error) {
    state.error = error
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}