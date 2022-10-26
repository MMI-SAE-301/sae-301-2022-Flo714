<template>
    <div >
        <Carrousel />
    </div>
    <div>
        <div class="flex justify-around my-40 mx-36">
            <div class="box-border border-2 border-gris w-[22vw] h-[60vh] pt-11 pl-14 shadow-ombre" v-for="montre in exemples">
                <div
                    :to="{
                      name: 'montre-exemple-data',
                      params: { data: JSON.stringify(montre) },
                    }">
                    <MontreSvg class="w-96" v-bind="montre" />
                </div>
            </div>
        </div>
        <div class="my-3 ml-4 flex justify-center ">
            <RouterLink class="my-6 bg-rouge py-6 px-12 text-blanc rounded-full duration-500 hover:bg-noir" to="/montre/new">
                <p class="text-4xl font-inter font-bold text-center">Personnaliser<br />
                     ma montre</p></RouterLink>
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