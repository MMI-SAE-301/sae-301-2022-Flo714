<script setup lang="ts">
import Logo from "./Logo.vue";

</script>

<template>
    <header class="bg-noir px-5 font-inter">
        <a href="#content" class="sr-only focus:not-sr-only text-lg text-blanc"> Passez au contenu </a>
        <nav class="flex justify-between">
          <div class="flex items-center">
                <RouterLink to="/">
                    <Logo class="w-16 h-16 my-3" />
                </RouterLink>
          </div>
          <ul class="flex items-center text-2xl mx-4 text-blanc font-inter font-bold" >
            <li class="my-10">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir" to="/montre">Nos montres</RouterLink>
            </li>
            <li class="my-10">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir" to="/montre/perso">Mes modèles</RouterLink>
            </li>
            <li class="my-10">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir" to="/montre/new">Personnalisation</RouterLink>
            </li>
            <li class="my-10 ml-4 bg-rouge py-2 px-8 rounded-3xl duration-500 hover:bg-blanc hover:text-noir">
              <RouterLink class="my-8" to="/LoginLogoutView">Se connecter</RouterLink>
            </li>
          </ul>
        </nav>
      </header>
    </template>