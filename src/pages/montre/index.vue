<script setup lang="ts">
import type { montre } from "@/types";
import { supabase, user } from '@/supabase';
import MontreSvg from "@/components/montreSvg.vue";

const exemples: montre[]  = [{
    bracelet_montre: "#000000",
    boitier_montre: "#FF00FF",
    ecran_montre: "#FFFFFF",
    boutons_montre: "#800000"
},
{
     bracelet_montre: "#0c4039",
     boitier_montre: "#FFFF00",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#800000"
},
{
     bracelet_montre: "#0037A3",
     boitier_montre: "#EFFF37",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#0037A3",
},
];

</script>
<template>
  <section>
    <h1 class="text-5xl font-extrabold font-inter my-10 mx-16">Nos modèles</h1>
    <div class="grid grid-cols-3 justify-items-center">
      <div class=" my-20" v-for="montre in exemples">
        <div
          :to="{
            name: 'montre-exemple-data',
            params: { data: JSON.stringify(montre) },
          }"
        >
          <MontreSvg class="w-[120%] box-border border-2 border-gris py-11 px-14 shadow-ombre hover:w-[140%]" v-bind="montre" />
        </div>
      </div>
    </div>
    </section>
</template>