<script setup lang="ts">
import FormSvg from "../../../components/Formmontre.vue";
defineProps<{
  id_montre: string;
}>();
</script>
<template>
  <FormSvg :id="id_montre" />
</template>