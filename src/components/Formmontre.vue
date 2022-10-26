<script setup lang="ts">
    import { ref } from "vue";
    import { supabase } from "@/supabase";
    import { useRouter } from "vue-router";
    import montreSvg from "./montreSvg.vue";
    import FormKitListColors from "./FormKitListColors.vue";
    import {
      RadioGroup,
      RadioGroupLabel,
      RadioGroupDescription,
      RadioGroupOption,
    } from '@headlessui/vue'
    import { Switch } from '@headlessui/vue'

    const router = useRouter();
    const montre = ref({});
    const enabled = ref(false)

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
    <div class="p-2 my-24 flex justify-center gap-56">
        <div class="w-1/5">
            <montreSvg class="" v-bind="montre"/>
        </div>
        <FormKit type="form" v-model="montre" @submit="upsertmontre" submit-label="Ajouter dans mes models" :submit-attrs="{ classes: { input: 'my-10 bg-rouge py-6 px-10 rounded-full font-bold text-blanc text-3xl font-font-inter hover:bg-noir' } }">
            <div class="font-bold text-3xl my-8">
                <FormKitListColors  name="bracelet_montre" label="Bracelet" />
            </div>
            <div class="font-bold text-3xl my-8">
                <FormKitListColors name="boitier_montre" label="Boitier" />
            </div>
            <div class="font-bold text-3xl my-8 ">
                <FormKitListColors name="ecran_montre" label="Écran" class=""/>
            </div> 
            <div class="font-bold text-3xl my-8">
                <FormKitListColors name="boutons_montre" label="Boutons" />
            </div>
            <div class="font-bold text-3xl my-8">
                <p class="my-8">Matériaux du bracelets</p>
                <RadioGroup v-model="montre.id_materiaux" class="mx-4">
                    <RadioGroupLabel class="sr-only ">Server size</RadioGroupLabel>
                        <div class="flex gap-10 ">
                            <RadioGroupOption class=""
                                as="template"
                                v-for="materiaux in listeMateriaux"
                                :key="materiaux.id_materiaux"
                                :value="materiaux.id_materiaux"
                                v-slot="{ active, checked }">
                                <div :class="[
                                  active
                                    ? 'ring-2 ring-noir'
                                    : '',
                                  checked ? 'bg-rouge text-blanc hover:ring-2 hover:ring-noir ' : ' bg-blanc border-2 hover:ring-2 hover:ring-noir',
                                    ]"
                                    class="cursor-pointer rounded-lg px-10 py-4 border-2 border-noir ">
                                    <div class="text-sm">
                                        <RadioGroupLabel
                                            as="p"
                                            :class="checked ? 'text-blanc' : 'text-noir '"
                                            class="font-medium ">
                                            {{ materiaux.libelle_materiaux }}
                                        </RadioGroupLabel>
                                    </div>
                                </div>
                        </RadioGroupOption>
                    </div>
                </RadioGroup>
            </div>
            <div class="flex items-center gap-12">
                <Switch
                     v-model="montre.commander"
                     :class="montre.commander ? 'bg-bleu' : 'bg-rouge'"
                     class="relative inline-flex h-[38px] w-[74px] shrink-0 cursor-pointer rounded-full border-2 border-noir transition-colors duration-500 ease-in-out focus:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-100">               
                     <span class="sr-only">Use setting</span>
                     <span
                       aria-hidden="true"
                       :class="montre.commander ? 'translate-x-9 bg-blanc' : 'translate-x-0 bg-blanc'"
                       class="pointer-events-none inline-block h-[34px] w-[34px] transform rounded-full shadow-lg transition duration-500 ease-in-out"
                     />
                </Switch>
                <p class="font-bold text-3xl my-8">Voulez vous commander votre montre</p>
            </div>

        </FormKit>
    </div>
</template>