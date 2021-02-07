<template>
  <div id="game">
    <div id="squares">
      <div class="row"
           v-for="(rowOfSquares, index) in getSquares"
           :key="index">
        <div class="square"
             v-for="square in rowOfSquares"
             :key="square.phrase"
             :style="squareStyle(square)"
             @click="sendMark(square)">
          <span class="phrase">{{ square.phrase }}</span>
          <span class="points">{{ square.points }}</span>
          <span class="name" v-if="square.marked_by">
            {{ square.marked_by.name }}
          </span>
        </div>
      </div>
    </div>
    <transition name="game-over-appear">
      <div id="game-over" v-if="getWinner">
        {{ getWinner.name }} won!
      </div>
    </transition>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Game',
  computed: mapGetters(['getSquares', 'getWinner', 'getChannel']),
  methods: {
    squareStyle(square) {
      const player = square.marked_by
      return player ? { backgroundColor: player.color } : {}
    },
    sendMark(square) {
      if (!square.marked_by) {
        this.getChannel.push('mark_square', { phrase: square.phrase })
      }
    }
  }
}
</script>

<style scoped>
#squares {
  margin: 0 auto;
}
#squares .row {
  margin: 0;
  display: flex;
}
#squares .square {
  color: #3A4145;
  background: #fff;
  border-radius: 9px;
  margin: 4px;
  flex: 1 0 auto;
  position: relative;
}
#squares .square:after {
  content: "";
  float: left;
  padding-top: 100%;
}
#squares .square:hover {
  background: #F3F4D4;
  cursor: pointer;
}
#squares .square .phrase {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  font-size: 0.8em;
  font-weight: 600;
  padding-right: 10px;
  padding-left: 10px;
}
#squares .square .points {
  position: absolute;
  bottom: 5px;
  right: 10px;
  font-size: 0.7em;
}
#squares .square .name {
  position: absolute;
  top: 5px;
  left: 10px;
  font-size: 0.7em;
}
@media (min-width: 650px) {
  #squares .square .phrase {
    font-size: 1.1em;
  }
  #squares .square .points {
    font-size: 0.8em;
    bottom: 5px;
    right: 15px;
  }
  #squares .square .name {
    font-size: 0.8em;
    bottom: 5px;
    left: 15px;
  }
}
#game-over {
  z-index: 11;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  font-weight: 600;
  background: rgba(255, 255, 255, 0.85);
  color: var(--orange);
  text-transform: uppercase;
  font-size: 5em;
  font-weight: 600;
}
/* See: https://vuejs.org/v2/guide/transitions.html */
.game-over-appear-enter-active, .game-over-appear-leave-active {
  transition: all 2.5s
}
.game-over-appear-enter, .game-over-appear-leave-to {
  opacity: 0;
}
</style>