<script setup lang="ts">
import FormSvg from "../../../components/Formmontre.vue";
defineProps<{
  data: string;
}>();
</script>
<template>
  <FormSvg :data="JSON.parse(data)" />
</template>