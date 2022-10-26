<template>
        <div >
            <Carrousel />
        </div>
        <div>
        <div class="flex justify-around my-24 ">
            <div class="box-border border-2 border-gris w-72 h-96 pt-6 pl-8 shadow-shadow" v-for="montre in exemples">
                <div
                    :to="{
                      name: 'montre-exemple-data',
                      params: { data: JSON.stringify(montre) },
                    }">
                    <MontreSvg class="w-56" v-bind="montre" />
                </div>
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