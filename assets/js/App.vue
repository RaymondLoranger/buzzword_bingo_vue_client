<template>
  <div id="game-container">
    <div id="content">
      <Error/>
      <div class="row">
        <Game class="col-xs-8"/>
        <Info class="col-xs-4"/>
      </div>
    </div>
  </div>
</template>

<script>
import Error from './components/Error.vue'
import Game from './components/Game.vue'
import Info from './components/Info.vue'
import { Socket, Presence } from "phoenix"
import { mapActions } from 'vuex'

export default {
  name: 'App',
  components: {
    Error,
    Game,
    Info
  },
  methods: {
    ...mapActions([
      'setChannel', 'setError', 'setScores',
      'setPlayers', 'setSquares', 'setWinner', 'pushMessage'
    ]),
    joinChannel(authToken, gameName) {
      const socket = new Socket('/socket', { params: { token: authToken } })

      socket.connect()

      this.channel = socket.channel(`games:${gameName}`, {})

      this.channel.on('game_summary', summary => {
        this.setSquares(summary.squares)
        this.setScores(summary.scores)
        this.setPlayers(this.presences)
        this.setWinner(summary.winner)
      })

      this.presences = {}

      this.channel.on('presence_state', state => {
        this.presences = Presence.syncState(this.presences, state)
        this.setPlayers(this.presences)
      })

      this.channel.on('presence_diff', diff => {
        this.presences = Presence.syncDiff(this.presences, diff)
        this.setPlayers(this.presences)
      })

      this.channel.on('new_chat_message', message => {
        this.pushMessage(message)
      })

      this.channel.join()
        .receive('ok', response => {
          this.setChannel(this.channel)
          console.log(`Joined ${gameName} 😊`, response)
        })
        .receive('error', response => {
          this.setError(`Joining ${gameName} failed 🙁`)
          console.log(`Joining ${gameName} failed 🙁`, response)
        })
    }
  },
  created: function() {
    const joinChannelData = document.querySelector('#join-channel-data')
    const { authToken, gameName } = joinChannelData.dataset
    this.joinChannel(authToken, gameName)
  }
}
</script>

<style scoped>
#game-container {
  /* margin-top: 30px; */
  width: 80%;
  margin: 20px auto;
  display: block;
}
#game-container .col-xs-8 {
  padding-right: 0;
}
#content {
  margin: 0;
  overflow: hidden;
  position: relative;
  box-sizing: border-box;
}
</style>

<style>
#join-channel-data {
  display: none;
}
.panel {
  margin-top: 4px;
}
.panel-default > .panel-heading {
  background: var(--purple);
  color: white;
}
.panel .panel-body {
  padding: 0;
}
.panel .list-group {
  margin-bottom: 0em;
}
.panel .list-group .list-group-item {
  border-width: 1px 0;
}
.panel .list-group-item:first-child {
  border-top-width: 0;
}
.panel .list-group .list-group-item:last-child {
  border-bottom: 0;
}
.panel .panel-heading + .list-group .list-group-item:first-child {
  border-top-width: 0;
}
</style>