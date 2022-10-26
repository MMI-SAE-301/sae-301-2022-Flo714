<script setup lang="ts">
    import { ref } from "vue";
    import { supabase } from "@/supabase";
    import { useRouter } from "vue-router";
    import montreSvg from "./montreSvg.vue";
    import FormKitListColors from "./FormKitListColors.vue";

    const router = useRouter();
    const montre = ref({});

    const { data: listeMateriaux, error } = await supabase
          .from("materiaux")
          .select("*");
        if (error) console.log("n'a pas pu charger la table Matériaux :", error);
        // Les convertir par map en un tableau d'objets {value, label} pour FormKit
        const optionsMateriaux = listeMateriaux?.map((materiaux) => ({
          value: materiaux.id_materiaux,
          label: materiaux.libelle_materiaux,
    }));

    const props = defineProps(["id_montre", "montre"]);
    if (props.id_montre) {
        // On charge les données de la table Basket
        let { data, error } = await supabase
        .from("montre")
        .select("*")
        .eq("id_montre", props.id_montre);
        if (error || !data)
        console.log("n'a pas pu charger la table montre :", error);
        else montre.value = data[0];
    } 
    async function upsertmontre(dataForm, node) {
        const { data, error } = await supabase.from("montre").upsert(dataForm);
        if (error) node.setErrors([error.message]);
        else {
            node.setErrors([]);
            router.push({ name: "montre-edit-id", params: { id: data[0].id_montre } });
        }
    }
</script>  

<template>
    <div class="p-2">
        <div class="w-64">
            <montreSvg class="w-64" v-bind="montre"/>
        </div>
        <FormKit type="form" v-model="montre" @submit="upsertmontre">
            <FormKitListColors name="bracelet_montre" label="Bracelet" />
            <FormKit type="select" name="id_materiaux" label="Materiaux du bracelet" :options="optionsMateriaux" />
            <FormKitListColors name="boitier_montre" label="Boitier" />
            <FormKitListColors name="ecran_montre" label="Écran" />
            <FormKitListColors name="boutons_montre" label="Boutons" />
            <FormKit name="commander" label="Commander" type="checkbox" />
        </FormKit>
    </div>
</template>