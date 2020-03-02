<template>
  <div class="panel panel-default">
    <div class="panel-heading">Who's Playing</div>
    <div class="panel-body">
      <ul id="players" class="list-group">
        <transition-group name="player-appear">
          <li class="list-group-item"
              v-for="player in players"
              v-bind:key="player.name">
            <span class="player-color" :style="background(player)"></span>
            <span class="player-name">{{ player.name }}</span>
            <span class="player-score">{{ player.score }}</span>
          </li>
        </transition-group>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Players',
  props: {
    players: Array
  },
  methods: {
    background(player) {
      return { background: player.color }
    }
  }
}
</script>

<style scoped>
ul#players .player-color {
  margin-top: 3px;
  height: 15px;
  width: 15px;
  float: left;
  margin-right: 10px;
  border-radius: 25%;
}
ul#players .player-name {
  font-size: 0.9em;
  font-weight: bold;
}
ul#players .player-score  {
  font-size: 1em;
  font-weight: bold;
  margin-right: 5px;
  vertical-align: middle;
  float: right;
}
</style>