<script setup lang="ts">
import Logo from "./Logo.vue";

</script>

<template>
    <header class="bg-noir px-5">
        <a href="#content" class="sr-only focus:not-sr-only text-lg text-blanc"> Passez au contenu </a>
        <nav class="flex justify-between">
          <div class="flex items-center">
                <RouterLink to="/">
                    <Logo class="w-16 h-16 my-3" />
                </RouterLink>
          </div>
          <ul class="flex items-center gap-24 text-lg mx-6" >
            <li class="my-3 text-blanc">
              <RouterLink class="my-6" to="/montre">Nos montres</RouterLink>
            </li>
            <li class="my-3 text-blanc">
              <RouterLink class="my-6" to="/montre/perso">Mes modèles</RouterLink>
            </li>
            <li class="my-3 text-blanc">
              <RouterLink class="my-6" to="/montre/new">Personnalisation</RouterLink>
            </li>
            <li class="my-3 text-blanc">
              <RouterLink class="my-6" to="/LoginLogoutView">Se connecter</RouterLink>
            </li>
          </ul>
        </nav>
      </header>
    </template>