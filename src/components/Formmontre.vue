<script setup lang="ts">
    import { ref } from "vue";
    import { supabase } from "@/supabase";
    import { useRouter } from "vue-router";
    import montreSvg from "./montreSvg.vue";
    import Choixmat from "./Choixmat.vue";
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
    <div class="p-2 my-24 flex justify-center gap-40">
        <div class="w-1/5">
            <montreSvg class="" v-bind="montre"/>
        </div>
        <FormKit type="form" v-model="montre" @submit="upsertmontre">
            <div class="font-bold text-3xl my-8">
                <FormKitListColors  name="bracelet_montre" label="Bracelet" />
            </div>
            <div class="font-bold text-3xl my-8">
                <FormKitListColors name="boitier_montre" label="Boitier" />
            </div>
            <div class="font-bold text-3xl my-8">
                <FormKitListColors name="ecran_montre" label="Écran" />
            </div> 
            <div class="font-bold text-3xl my-8">
                <FormKitListColors name="boutons_montre" label="Boutons" />
            </div>
            <div class="font-bold text-3xl my-8">
                <FormKit type="select" name="id_materiaux" label="Materiaux du bracelet" :options="optionsMateriaux" ><Choixmat /></FormKit>
            </div>
            <div >
                <FormKit name="commander" label="Commander" type="checkbox" />
            </div>
        </FormKit>
    </div>
</template>