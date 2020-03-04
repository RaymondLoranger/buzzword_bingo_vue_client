import { Presence } from "phoenix"

const state = {
  scores: {}, // e.g. { Ray: { score: 450, marked: 1, color: 'blue' } }
  players: [] // e.g. [{ name: 'Ray', color: 'blue', score: 450, marked: 1 }]
}

const getters = {
  getPlayers: state => state.players
}

const actions = {
  setScores({ commit }, scores) {
    commit('setScores', scores)
  },
  setPlayers({ commit }, presences) {
    const listBy = (name, { metas: [first, ...rest] }) => {
      const { score, marked } = state.scores[name] || { score: 0, marked: 0 }
      return { name, color: first.color, score, marked }
    }
    commit('setPlayers', Presence.list(presences, listBy))
  }
}

const mutations = {
  setScores(state, scores) {
    state.scores = scores
  },
  setPlayers(state, players) {
    state.players = players
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}