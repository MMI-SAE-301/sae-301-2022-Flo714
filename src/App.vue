<template>
  <Header />
  <!-- Affiche les pages -->
  <Suspense class="">
    <div class="dark:bg-noir">
      <router-view class="m-2 p-2" />
    </div>
  </Suspense>
  
  <Footer />
</template>

<script setup lang="ts">
import LoginLogout from "./components/LoginLogout.vue";
import Header from "./components/Header.vue";

import Footer from "./components/Footer.vue";
</script>
