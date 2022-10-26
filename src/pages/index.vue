<template>
        <div >
            <Carrousel />
        </div>
        <div>
        <div class="flex flex-wrap gap-2">
            <div class="w-64" v-for="montre in exemples">
                <RouterLink
                    :to="{
                      name: 'montre-exemple-data',
                      params: { data: JSON.stringify(montre) },
                    }">
                    <MontreSvg class="w-64" v-bind="montre" />
                </RouterLink>
            </div>
        </div>
    </div>
  </template>
  
  <script setup lang="ts">
    import Carrousel from '../components/Carrousel.vue';
    import MontreSvg from '../components/montreSvg.vue';
    import type { montre } from "@/types";


    const exemples: montre[]  = [{
    bracelet_montre: "#000000",
    boitier_montre: "#FF00FF",
    ecran_montre: "#FFFFFF",
    boutons_montre: "800000",
},
{
     bracelet_montre: "#0c4039",
     boitier_montre: "#FFFF00",
     ecran_montre: "#FFFFFF",
     boutons_montre: "800000",
},
{
     bracelet_montre: "#0037A3",
     boitier_montre: "#EFFF37",
     ecran_montre: "#FFFFFF",
     boutons_montre: "0037A3",
},
];
  </script>