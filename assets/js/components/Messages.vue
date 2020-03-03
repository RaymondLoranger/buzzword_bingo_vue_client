<template>
  <div class="panel panel-default">
    <div class="panel-heading">What's Up?</div>
    <div class="panel-body">
      <ul id="messages" ref="messages" class="list-group">
        <li class="list-group-item"
            v-for="(message, index) in messages"
            :key="index">
          <span class="chat-message-name">{{ message.name }}:</span>
          <span class="chat-message-body">{{ message.body }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Messages',
  props: {
    messages: Array
  },
  watch: {
    messages(newValue, oldValue) {
      this.$nextTick(() => {
        // DOM is now updated
        const messageList = this.$refs.messages
        messageList.scrollTop = messageList.scrollHeight
      })
    }
  }
}
</script>

<style scoped>
ul#messages {
  min-height: 200px;
  max-height: 200px;
  overflow-y: scroll;
  font-size: 0.8em;
}
@media (min-width: 650px) {
  ul#messages {
    /* min-height: 425px; */
    min-height: 300px;
    font-size: 1em;
  }
}
ul#messages .chat-message-name {
  font-weight: bold;
}
ul#messages .chat-message-body {
  font-weight: 550;
}
</style>