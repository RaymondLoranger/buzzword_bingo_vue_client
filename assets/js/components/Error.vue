<template>
  <p id="error" class="alert alert-danger">
    {{ getError }}
  </p>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Error',
  computed: mapGetters(['getError'])
}
</script>

<style scoped>
.alert {
  padding: 10px;
  text-align: center;
  border: none;
  background: none;
  font-size: 1.25em;
  font-weight: 600;
  text-transform: uppercase;
}
</style>