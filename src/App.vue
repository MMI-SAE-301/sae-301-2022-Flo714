<template>
  <Header />
  <!-- Affiche les pages -->
  <Suspense>
    <router-view class="m-2 p-2" />
  </Suspense>
  <Footer />
</template>

<script setup lang="ts">
import { Bars3Icon } from "@heroicons/vue/20/solid";
import LoginLogout from "./components/LoginLogout.vue";
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";
</script>
