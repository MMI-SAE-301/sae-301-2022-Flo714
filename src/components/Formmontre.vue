<script setup lang="ts">
    import { ref } from "vue";
    import { supabase } from "@/supabase";
    import { useRouter } from "vue-router";
    import montreSvg from "./montreSvg.vue";
    import FormKitListColors from "./FormKitListColors.vue";

    const router = useRouter();
    const montre = ref({});
    const props = defineProps(["id", "montre"]);
    if (props.id) {
        // On charge les données de la table Basket
        let { data, error } = await supabase
        .from("montre")
        .select("*")
        .eq("id", props.id);
        if (error || !data)
        console.log("n'a pas pu charger la table montre :", error);
        else montre.value = data[0];
    } 
    async function upsertmontre(dataForm, node) {
        const { data, error } = await supabase.from("montre").upsert(dataForm);
        if (error) node.setErrors([error.message]);
        else {
            node.setErrors([]);
            router.push({ name: "montre-edit-id", params: { id_montre: data[0].id_montre } });
        }
    }
</script>  

<template>
    <div class="p-2">
        <div class="carousel w-64">
            <montreSvg class="carousel-item w-64" v-bind="montre" id="profil" />
        </div>
        <FormKit type="form" v-model="montre" @submit="upsertmontre">
            <FormKitListColors name="bracelet_montre" label="bracelet" />
            <FormKitListColors name="boitier_montre" label="boitier" />
            <FormKitListColors name="ecran_montre" label="ecran" />
            <FormKitListColors name="boutons_montre" label="boutons" />
            <FormKit name="commander" label="commander" type="checkbox" />
        </FormKit>
    </div>
</template>