<script setup lang="ts">
import { supabase } from "@/supabase";
import montreSvg from "./montreSvg.vue";
const props = defineProps<{
 max?: number;
}>();
let { data: montres, error } = await supabase
 .from("montre")
 .select("*")
 .limit(props.max ?? 100)
if (error) {
 console.log("n'a pas pu récupérer les montre", { error });
}
</script>

<template>
    <ul>
        <li v-for="montre in montres" :key="montre.id_montre">
        <router-link
            :to="{ name: 'montre-edit-id', params: { id: montre.id_montre } }"
            >
            <montreSvg class=" w-[110%] box-border border-none border-gris py-11 px-14 shadow-ombre hover:w-[120%] duration-500 dark:bg-blanc" v-bind="montre" />
        </router-link>
        </li>
    </ul>
</template>