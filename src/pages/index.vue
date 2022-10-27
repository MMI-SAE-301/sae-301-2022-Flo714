<template>
    <div >
        <Carrousel />
    </div>
    <div>
        <div class="flex justify-around my-40 mx-36">
            <div class="" v-for="montre in exemples">
                <div
                    :to="{
                      name: 'montre-exemple-data',
                      params: { data: JSON.stringify(montre) },
                    }">
                    <MontreSvg class="w-[80%] box-border border-none border-gris py-11 px-14 shadow-ombre hover:w-[90%] duration-500" v-bind="montre" />
                </div>
            </div>
        </div>
        <div class="my-3 mb-40 ml-4 flex justify-center ">
            <RouterLink class="my-6 bg-rouge py-6 px-12 text-blanc rounded-full duration-500 hover:bg-noir dur" to="/montre/new">
                <p class="text-5xl font-inter font-bold text-center">Personnaliser<br />
                     ma montre</p></RouterLink>
        </div>
    </div>
    <div class="mx-10 mt-24 mb-10">
        <div class="bg-bleu text-blanc ml-10 mr-96 pl-10 rounded-xl pt-10 pb-24">
            <h2 class="text-4xl pt-10 pb-24 font-bold">Pratiquer du sport avec TiK•TaK</h2>
            <div class="py-10">
                <p class="text-2xl pr-[40%] py-5 pl-5">Pratiquer du sport vous permettra d’être en meilleure santé et d’être plus heureux.  Alors pourquoi ne pas essayer la TiK•TaK durant vos meilleures activités physiques.  Elle dispose de multiples fonctionnalités pour vous satisfaire. Vous pouvez ainsi pratiquer votre passion.</p>
                <p class="text-2xl pr-[40%] py-5 pl-5">Personnaliser votre montre à votre goût pour la rendre unique.  </p>
            </div>
        </div>
        <div class="flex justify-end -mt-[55vh] mr-6">
            <img class="w-[50%] rounded-xl" src="../assets/Sport.jpg" alt="Pratiquer du Sport">
        </div>
    </div>
    <div class="mx-10 my-72">
        <div class="flex justify-start -mb-[80vh] ml-10">
            <img class="w-[50%] rounded-xl" src="../assets/Caoutchouc.jpg" alt="Caoutchouc">
        </div>
        <div class="bg-bleu text-blanc mr-10 ml-96 pr-10 rounded-xl pt-10 pb-24">
            <h2 class="text-4xl pt-10 pb-24 ml-[35vw] font-bold">Des matériaux d’exception</h2>
            <div class="">
                <p class="text-2xl pl-[50%] pr-5">TiK•TaK utilise des matériaux d’exception comme du cuir, du carbone et du Caoutchouc.</p>
                <p class="text-2xl pl-[50%] pr-5">Le cuir provient de peau de vache naturelle fabriquée sur mesure.</p>
                <p class="text-2xl pl-[50%] pr-5">Les montres en carbone sont fabriqué par nos imprimantes 3D. Chaque modèle sera donc fait sur mesure par nos techniciens.</p>
                <p class="text-2xl pl-[50%] pr-5">Le caoutchouc est fabriquées à partir de latex qui est la résine d'un arbre, l'Hévéa.</p>
                <p class="text-2xl pl-[50%] pr-5">Ces matériaux composeront vos bracelets de montre à votre guise.</p>
            </div>
        </div>
    </div>
    <div class="mx-10 mt-24 mb-40">
        <div class="bg-bleu text-blanc ml-10 mr-96 pl-10 rounded-xl pt-10 pb-24">
            <h2 class="text-4xl pt-10 pb-24 font-bold">TiK•TaK, une fabrication Française</h2>
            <div class="py-10">
                <p class="text-2xl pr-[50%] py-5 pl-5">TiK•TaK est une marque 100 % Française. L’usine d’assemblage se situe à Germagny, dans le département de Saône et Loire. Tous nos produits sont assemblés ici pour permettre une plus grande facilité de livraison de la marchandise.</p>
                <p class="text-2xl pr-[50%] py-5 pl-5">De plus, nous livrons seulement la France et les frontaliers. Vous pourrez ainsi montrer lors d’entraînement ou de compétitions internationale que TiK•TaK est la meilleur montre du marché</p>
            </div>
        </div>
        <div class="flex justify-end -mt-[50vh] mr-40">
            <img class="w-[50%] rounded-xl" src="../assets/Tik Tak_fr.jpg" alt="Pratiquer du Sport">
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
    boutons_montre: "#800000",
},
{
     bracelet_montre: "#0c4039",
     boitier_montre: "#FFFF00",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#800000",
},
{
     bracelet_montre: "#0037A3",
     boitier_montre: "#EFFF37",
     ecran_montre: "#FFFFFF",
     boutons_montre: "#0037A3",
},
];
  </script>