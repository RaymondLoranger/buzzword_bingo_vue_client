<template>
  <div>
    <Players/>
    <Messages/>
    <ChatForm/>
  </div>
</template>

<script>
import Players from './Players.vue'
import Messages from './Messages.vue'
import ChatForm from './ChatForm.vue'

export default {
  name: 'Info',
  components: {
    Players,
    Messages,
    ChatForm
  }
}
</script>