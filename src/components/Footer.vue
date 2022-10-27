<script setup lang="ts">

</script>

<template>
    <footer class="bg-noir py-10 dark:bg-blanc">
        <div class="ml-24 flex flex-wrap justify-left text-lg text-blanc dark:text-noir">

            <div class="p-5 w-1/2 sm:w-4/12 md:w-3/12">

                <div class="uppercase text-white text-sm font-bold mb-6 border-b-2 border-blanc pb-4 w-1/4 dark:border-noir">
                    Lien
                </div>
                <RouterLink class=" font-semibold duration-500 hover:text-rouge" to="/">Accueil</RouterLink>
                <RouterLink class=" my-6 block  font-semibold duration-500 hover:text-rouge" to="/montre/new">Personnalisation</RouterLink>
                <RouterLink class=" my-6 block  font-semibold duration-500 hover:text-rouge" to="/montre">Nos montres</RouterLink>
                <RouterLink class=" my-6 block  font-semibold duration-500 hover:text-rouge" to="/montre/perso">Mes modèles</RouterLink>
                <RouterLink class=" my-6 duration-500 bg-rouge py-2 px-8 rounded-3xl text-blanc hover:bg-blanc hover:text-noir dark:hover:bg-noir dark:hover:text-blanc" 
                    to="/montre/perso">Se connecter</RouterLink>
            </div>
            <div class="p-5 w-10/12 sm:w-4/12 md:w-3/12 flex flex-col ">
                <div class="uppercase text-white font-bold mb-6 border-b-2 border-blanc pb-4 w-1/2 text-sm dark:border-noir">
                    Obtenir de l'aide
                </div>
                <a class="my-3  hover:text-rouge text-xs sm:text-lg  font-semibold duration-700 " href="florentin.demortiere@edu.univ-fcomte.fr">florentin.demortiere@edu.univ-fcomte.fr</a>
            </div>
        </div>
    </footer>   
</template>