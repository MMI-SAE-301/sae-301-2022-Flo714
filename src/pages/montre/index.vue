<script setup lang="ts">
import Listemontre from "@/components/Listemontre.vue";
import type { montre } from "@/types";
import { supabase, user } from '@/supabase';

const exemples: montre[]  = [{
    bracelet_montre: "#FFFF00",
    boitier_montre: "#FF00FF",
    ecran_montre: "#FFFFFF",
    boutons_montre: "800000"
},
{
     bracelet_montre: "#0c4039",
     boitier_montre: "#FFFF00",
     ecran_montre: "#FFFFFF",
     boutons_montre: "800000"
},
];

</script>
<template>
  <section>
    <h1 class="text-2xl">Exemples de Montres</h1>
    <div class="flex flex-wrap gap-2">
      <div class="w-64" v-for="montre in exemples">
        <RouterLink
          :to="{
            name: 'montre-exemple-data',
            params: { data: JSON.stringify(montre) },
          }"
        >
          <MontreCarre class="w-64" v-bind="montre" />
        </RouterLink>
      </div>
    </div>
    </section>
</template>