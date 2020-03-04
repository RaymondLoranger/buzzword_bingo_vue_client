const state = {
  messages: []
}

const getters = {
  getMessages: state => state.messages
}

const actions = {
  pushMessage({ commit }, message) {
    commit('pushMessage', message)
  }
}

const mutations = {
  pushMessage(state, message) {
    state.messages.push(message)
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}