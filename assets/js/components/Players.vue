<template>
  <div class="panel panel-default">
    <div class="panel-heading">Who's Playing</div>
    <div class="panel-body">
      <ul id="players" class="list-group">
        <transition-group name="player-appear">
          <li class="list-group-item"
              v-for="player in getPlayers"
              :key="player.name">
            <span class="player-color" :style="background(player)"></span>
            <span class="player-name">{{ player.name }}</span>
            <span class="player-score">{{ score(player) }}</span>
            <span class="player-points">{{ player.score }}</span>
          </li>
        </transition-group>
      </ul>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Players',
  computed: mapGetters(['getPlayers']),
  methods: {
    background(player) {
      return { background: player.color }
    },
    score(player) {
      return `
        ${player.score} (
          ${player.marked} square${player.marked == 1 ? '' : 's'}
        )
      `
    }
  }
}
</script>

<style scoped>
ul#players .player-name {
  font-size: 0.9em;
  font-weight: bold;
}
ul#players .player-color {
  margin-top: 3px;
  height: 15px;
  width: 15px;
  float: left;
  margin-right: 10px;
  border-radius: 25%;
}
ul#players .player-score  {
  font-size: 0.9em;
  font-weight: bold;
  margin-right: 3px;
  vertical-align: middle;
  float: right;
}
ul#players .player-points {
  display: none;
}
@media (max-width: 992px) {
  ul#players .player-score {
    display: none;
  }
  ul#players .player-points {
  font-size: 0.9em;
  font-weight: bold;
  margin-right: 3px;
  /* vertical-align: middle; */
  float: right;
  display: block;
  }
}
.player-appear-enter-active {
  transition: all 2.5s
}
.player-appear-leave-active {
  transition: all 1.0s
}
.player-appear-enter, .player-appear-leave-active {
  opacity: 0;
}
</style>