<script type lang="ts">

</script>

<template>
 <footer class=" pt-10">
    <div class="max-w-6xl m-auto text-gray-900 flex flex-wrap justify-left text-lg">

      <div class="p-5 w-1/2 sm:w-4/12 md:w-3/12">

        <div class="text-xs uppercase text-white font-bold mb-6 border-b-2 border-rouge pb-4 w-1/4">
          Lien
        </div>
        <RouterLink class="hover:text-gray-500 font-semibold duration-500" to="/">Accueil</RouterLink>
        <RouterLink class="text-gris my-3 block  hover:text-gray-100  font-semibold duration-700" to="/">Personnalisation</RouterLink>
        <RouterLink class="text-gris my-3 block  hover:text-gray-100   font-semibold duration-700" to="/Contact">Nos montres</RouterLink>
        <RouterLink class="text-gris my-3 block  hover:text-gray-100  font-semibold duration-700" to="/Glossaire">Glossaire</RouterLink>
      </div>

      <div class="p-5 w-1/2 sm:w-4/12 md:w-3/12 flex flex-col ">

        <div class="text-xs uppercase text-white font-bold mb-6 border-b-2 border-rouge pb-4 w-1/2">
          Obtenir de l'aide
        </div>
        <a class="text-gris my-3  hover:text-gray-100 text-xs sm:text-lg  font-semibold duration-700 "
          href="florentin.demortiere@edu.univ-fcomte.fr">florentin.demortiere@edu.univ-fcomte.fr</a>
      </div>
    </div>
  </footer>
    
</template>