<template>
  <section class="p-0 m-0 w-full">
    <Carrousel />
    <div>
        <div class="flex flex-wrap gap-2">
      <div class="w-64" v-for="montre in exemples">
        <RouterLink
          :to="{
            name: 'montre-exemple-data',
            params: { data: JSON.stringify(montre) },
          }"
        >
          <MontreSvg class="w-64" v-bind="montre" />
        </RouterLink>
      </div>
    </div>
    </div>
  </section>
</template>

<script type lang="ts">
import Carrousel from "../components/Carousel.vue"
</script>