<script setup lang="ts">
import Listemontre from "@/components/Listemontre.vue";
import { supabase, user } from '@/supabase';
</script>
<template>
  <section v-if="user">
    <Listemontre class="flex flex-wrap gap-2" :max="3" />
  </section>
</template>