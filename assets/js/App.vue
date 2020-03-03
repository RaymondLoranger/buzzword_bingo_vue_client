<template>
  <div id="game-container">
    <div id="content">
      <Error/>
      <div class="row">
        <div class="col-xs-8">
          <Game :squares="squares" :winner="winner" @send-mark="sendMark"/>
        </div>
        <div class="col-xs-4">
          <Players :players="players"/>
          <Messages :messages="messages"/>
          <ChatForm v-model="chatMessage" @send-chat="sendChat"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Error    from './components/Error.vue'
import Game     from './components/Game.vue'
import Players  from './components/Players.vue'
import Messages from './components/Messages.vue'
import ChatForm from './components/ChatForm.vue'
import { Socket, Presence } from "phoenix"
import { mapActions } from 'vuex'

export default {
  name: 'App',
  components: {
    Error,
    Game,
    Players,
    Messages,
    ChatForm
  },
  data () {
    return {
      squares: [],
      scores: {},
      winner: null,
      messages: [],
      players: [],
      chatMessage: ""
    }
  },
  methods: {
    ...mapActions(['setError']),
    sendMark(square) {
      if (!square.marked_by) {
        this.channel.push("mark_square", { phrase: square.phrase })
      }
    },
    sendChat(event) {
      if (this.chatMessage) {
        this.channel.push("new_chat_message", { body: this.chatMessage })
        this.chatMessage = ""
      }
    },
    joinChannel(authToken, gameName) {
      const socket =
        new Socket("/socket", { params: { token: authToken } })

      socket.connect()

      this.channel = socket.channel(`games:${gameName}`, {})

      this.channel.on("game_summary", summary => {
        this.squares = summary.squares
        this.scores = summary.scores
        this.winner = summary.winner
        this.players = this.toPlayers(this.presences)
      })

      this.presences = {}

      this.channel.on('presence_state', state => {
        this.presences = Presence.syncState(this.presences, state)
        this.players = this.toPlayers(this.presences)
      })

      this.channel.on('presence_diff', diff => {
        this.presences = Presence.syncDiff(this.presences, diff)
        this.players = this.toPlayers(this.presences)
      })

      this.channel.on("new_chat_message", message => {
        this.messages.push(message)
      })

      this.channel.join()
        .receive('ok', response => {
          console.log(`Joined ${gameName} 😊`, response)
        })
        .receive('error', response => {
          this.setError(`Joining ${gameName} failed 🙁`)
          console.log(`Joining ${gameName} failed 🙁`, response)
        })
    },
    toPlayers(presences) {
      const listBy = (name, { metas: [first, ...rest] }) => {
        const score = this.scores[name] || 0
        return { name: name, color: first.color, score: score }
      }

      return Presence.list(presences, listBy)
    }
  },
  created: function () {
    // const gameContainer = this.$parent.$el
    // console.log('this ===>', this)
    // console.log('this.$parent ===>', this.$parent)
    // console.log('this.$parent.$el ===>', this.$parent.$el)

    const joinChannelData = document.querySelector('#join-channel-data')
    // console.log('joinChannelData ===>', joinChannelData)

    const { authToken, gameName } = joinChannelData.dataset

    this.joinChannel(authToken, gameName)
  }
}
</script>

<style scoped>
#game-container {
  margin-top: 30px;
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