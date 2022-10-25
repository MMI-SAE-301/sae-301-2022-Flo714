<script setup lang="ts">
import Logo from "./Logo.vue";

</script>

<template>
    <header class=" px-5">
        <a href="#content" class="sr-only focus:not-sr-only text-lg text-blanc"> Passez au contenu </a>
        <nav class="flex">
          <div class="flex justify-between items-center">
                <RouterLink to="/">
                    <Logo class="w-36" />
                </RouterLink>
          </div>
          <ul class="flex  gap-6 text-xl mx-6 py-4" >
            <li class="my-3">
              <RouterLink class="my-6" to="/montres/new">Personnalisation</RouterLink>
            </li>
          </ul>
        </nav>
      </header>
    </template>