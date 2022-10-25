<script setup lang="ts">
    import type { montre } from "@/types"
    import { ref } from "vue";
    import { supabase } from "@/supabase";
    import { useRouter } from "vue-router";
    import montreSvg from "./montreSvg.vue";
    import FormKitListColors from "./FormKitListColors.vue";

    const router = useRouter();
    const montre = ref({});
    // const props = defineProps(["id", "montre"]);
    // if (props.id) {
    //     // On charge les données de la table Basket
    //     let { data, error } = await supabase
    //     .from("montre")
    //     .select("*")
    //     .eq("id", props.id);
    //     if (error || !data)
    //     console.log("n'a pas pu charger la table montre :", error);
    //     else montre.value = data[0];
    // } 
    // async function upsertchaussure(dataForm, node) {
    //     const { data, error } = await supabase.from("montre").upsert(dataForm);
    //     if (error) node.setErrors([error.message]);
    //     else {
    //         node.setErrors([]);
    //         router.push({ name: "montre-edit-id", params: { id: data[0].id } });
    //     }
    // }
</script>  

<template>
    <div class="p-2">
        <div class="carousel w-64">
            <montreSvg class="carousel-item w-64" v-bind="montre" id="profil" />
        </div>
        <FormKit type="form" v-model="montre">
            <FormKitListColors name="bracelet" label="bracelet" />
            <FormKitListColors name="boitier" label="boitier" />
            <FormKitListColors name="ecran" label="ecran" />
            <FormKitListColors name="boutons" label="boutons" />
            <FormKit name="commander" label="commander" type="checkbox" />
        </FormKit>
    </div>
</template>