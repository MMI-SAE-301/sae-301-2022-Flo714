<script setup lang="ts">
import FormSvg from "../../../components/Formmontre.vue";
defineProps<{
  id: string;
}>();
</script>
<template>
  <FormSvg :id_montre="id" />
</template>