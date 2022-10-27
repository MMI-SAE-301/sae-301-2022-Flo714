<script setup lang="ts">
import Logo from "./Logo.vue";
import { supabase, user } from "@/supabase";

</script>

<template>
    <header class="bg-noir px-5 font-inter dark:bg-blanc">
        <a href="#content" class="sr-only focus:not-sr-only text-lg text-blanc"> Passez au contenu </a>
        <nav class="flex justify-between">
          <div class="flex items-center">
                <RouterLink to="/">
                    <Logo class="w-16 h-16 my-3" />
                </RouterLink>
          </div>
          <ul class="flex items-center text-2xl mx-4 text-blanc dark:text-noir font-inter font-bold" >
            <li class="my-10">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir dark:hover:bg-noir dark:hover:text-blanc" to="/montre">Nos montres</RouterLink>
            </li>
            <li class="my-10" v-if="user">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir dark:hover:bg-noir dark:hover:text-blanc" to="/montre/perso">Mes modèles</RouterLink>
            </li>
            <li class="my-10">
              <RouterLink class="my-8 p-14 duration-500 hover:bg-blanc hover:text-noir dark:hover:bg-noir dark:hover:text-blanc" to="/montre/new">Personnalisation</RouterLink>
            </li>
            <li class="my-10 ml-4 bg-rouge py-2 px-8 rounded-3xl duration-500 hover:bg-blanc hover:text-noir dark:hover:bg-noir dark:hover:text-blanc">
              <RouterLink v-if="user" class="my-8" to="/LoginLogoutView">Se déconnecter</RouterLink>
              <RouterLink v-else class="my-8" to="/LoginLogoutView">Se connecter</RouterLink>
            </li>
          </ul>
        </nav>
      </header>
    </template>