<script setup lang="ts">
import Listemontre from "@/components/Listemontre.vue";
import { supabase, user } from '@/supabase';
</script>
<template>
  <section>
    <h2>
      un extrait des chaussures (<RouterLink
      class="text-red-600 underline"
      to="/montre"
      >Toutes les voir</RouterLink
      >)
    </h2>
    <Listemontre class="flex flex-wrap gap-2" :max="3" />
  </section>
</template>