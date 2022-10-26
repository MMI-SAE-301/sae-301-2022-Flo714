<template>
    <div id="carouselExampleCrossfade" class="carousel slide carousel-fade relative" data-bs-ride="carousel">
        <div class="carousel-indicators absolute right-0 bottom-0 left-0 flex justify-center p-0 mb-4">
            <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1">
            </button>
            <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="1"
                aria-label="Slide 2">
            </button>
            <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="2"
                aria-label="Slide 3">
            </button>
        </div>
        <div class="carousel-inner relative w-full overflow-hidden">
            <div class="carousel-item active float-left w-full">
                <img src="../assets/Carrousel_1.jpg"
                    class="block w-full"
                    alt="Sportifs qui portent une montre"/>
                <h2 class="absolute top-8 left-16 text-blanc text-5xl font-black">Votre montre, votre monde</h2>
                <p class="absolute top-36 right-24 text-blanc text-3xl font-bold">Personnalisez votre montre à votre goût</p>
            </div>
            <div class="carousel-item float-left w-full">
                <img src="../assets/Carrousel_2.jpg"
                    class="block w-full"
                    alt="Cylciste qui portent une montre"/>
                <h2 class="absolute top-8 left-16 text-blanc text-5xl font-black">Explorer les 4 coins du monde</h2>
                <p class="absolute top-52 left-36 text-blanc text-3xl font-bold">Parcourez les chemins en vélo</p>
            </div>
            <div class="carousel-item float-left w-full">
                <img src="../assets/Carrousel_3.jpg"
                    class="block w-full"
                    alt="Exotic Fruits"/>
                <h2 class="absolute top-16 left-16 text-blanc text-5xl font-black">Découvrez les fonctionnalitées</h2>
                <p class="absolute top-80 left-36 text-blanc text-3xl font-bold">Les diverses fonctionnalitées vous serviront</p>
            </div>
        </div>
        <button class="carousel-control-prev absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline left-0"
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon inline-block bg-no-repeat" aria-hidden="true"></span>
            <span class="visually-hidden">Précédent</span>
        </button>
        <button class="carousel-control-next absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline right-0"
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide="next">
            <span class="carousel-control-next-icon inline-block bg-no-repeat" aria-hidden="true"></span>
            <span class="visually-hidden">Suivant</span>
        </button>
    </div>
</template>

<script setup lang="ts">
import 'tw-elements' 
</script>