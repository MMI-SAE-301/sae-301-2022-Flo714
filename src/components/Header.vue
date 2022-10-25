<script setup lang="ts">
import Logo from "./Logo.vue";

</script>

<template>
    <header class=" px-5">
        <a href="#content" class="sr-only focus:not-sr-only text-lg text-blanc"> Passez au contenu </a>
        <nav class="flex justify-between">
          <div class="flex items-center">
                <RouterLink to="/">
                    <Logo class="w-36" />
                </RouterLink>
          </div>
          <ul class="flex items-center gap-24 text-xl mx-6 py-4" >
            <li class="my-3">
              <RouterLink class="my-6" to="/montre">Nos montres</RouterLink>
            </li>
            <li class="my-3">
              <RouterLink class="my-6" to="/montre/perso">Mes modèles</RouterLink>
            </li>
            <li class="my-3">
              <RouterLink class="my-6" to="/montre/new">Personnalisation</RouterLink>
            </li>
            <li class="my-3">
              <RouterLink class="my-6" to="/LoginLogoutView">Se connecter</RouterLink>
            </li>
          </ul>
        </nav>
      </header>
    </template>