<script setup lang="ts">
import Listemontre from "@/components/Listemontre.vue";
import { supabase, user } from '@/supabase';
</script>
<template>
  <span class="sr-only">Liste de mes montres personnel</span>
  <section>
    <h1 class="text-5xl font-extrabold font-inter my-10 mx-16">Mes modèles</h1>
    <div class="">
      <Listemontre class="grid grid-flow-row-dense grid-cols-[repeat(auto-fit,minmax(250px,2fr))] mx-[15%]  gap-36 justify-items-center my-20 "/>
    </div>
    </section>
</template>