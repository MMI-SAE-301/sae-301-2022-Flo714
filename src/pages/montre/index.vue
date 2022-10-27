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
{
     bracelet_montre: "#0037A3",
     boitier_montre: "#EFFF37",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#0037A3",
},
{
     bracelet_montre: "#0037A3",
     boitier_montre: "#EFFF37",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#0037A3",
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
    <h1 class="text-5xl font-extrabold font-inter my-10 mx-16 dark:text-blanc">Nos montres</h1>
    <div class="grid grid-flow-row-dense grid-cols-[repeat(auto-fit,minmax(250px,2fr))] mx-[15%]  gap-36 justify-items-center my-20">
      <div class="" v-for="montre in exemples">
        <div
          :to="{
            name: 'montre-exemple-data',
            params: { data: JSON.stringify(montre) },
          }"
        >
          <MontreSvg class="w-[110%] box-border border-none border-gris py-11 px-14 shadow-ombre hover:w-[120%] duration-500 dark:bg-blanc" v-bind="montre" />
        </div>
      </div>
    </div>
    </section>
</template>