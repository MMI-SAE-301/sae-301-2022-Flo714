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
        // On charge les données de la table montre
        let { data, error } = await supabase
        .from("montre")
        .select("*")
        .eq("id_montre", props.id_montre);
        if (error || !data)
        console.log("n'a pas pu charger la table montre :", error);
        else montre.value = data[0];
    } 

    const Suprmontre: ref<any> = ref({});
        if (props.id_montre) {
          // On charge les données de la vue quartiercommune
          let { data, error } = await supabase
            .from("montre")
            .select("*")
            .eq("id_montre", props.id_montre);
          if (error || !data)
            console.log("n'a pas pu charger le table Maison :", error);
          else Suprmontre.value = data[0];
        }

    async function upsertmontre(dataForm, node) {
        const { data, error } = await supabase.from("montre").upsert(dataForm);
        if (error) node.setErrors([error.message]);
        else {
            node.setErrors([]);
            router.push({ name: "montre-perso", params: { id: data[0].id_montre } });
        }
    }
    async function supprimerMontre() {
        const { data, error } = await supabase
          .from("montre")
          .delete()
          .match({ id_montre: Suprmontre.value.id_montre })

          if (error) {
            console.error(
              "Erreur à la suppression de ",
              Suprmontre.value.id_montre,
              "erreur :",
              error
            );
          } else {
            router.push("/montre/perso");
          }
        }

    
</script>  

<template>
    <div>
        <p class="text-3xl mt-16 mb-6 mx-20 font-bold">Vente flash pendant seulement 24 H !</p>
    </div>
    <div class="p-2 my-4 flex justify-center gap-56 font-inter">
        <div class="w-1/5">
            <montreSvg class="my-20" v-bind="montre"/>
            <h2 class="text-2xl font-bold border-b-2 w-1/4 pb-2">Prix</h2>
            <div class="flex items-center gap-4">
                <p class="text-4xl font-black py-4">349.99 €</p>
                <p class="text-lg py-4"> au lieu 499.99 €</p>
            </div>
        </div>
        <FormKit type="form" v-model="montre" @submit="upsertmontre" submit-label="Ajouter dans mes models" :submit-attrs="{ classes: { input: 'my-10 bg-rouge py-4 px-6 rounded-full font-bold text-blanc text-xl font-font-inter hover:bg-noir' } }">
            <div class="font-bold text-xl my-4">
                <FormKitListColors  name="bracelet_montre" label="Bracelet" />
            </div>
            <div class="font-bold text-xl my-4">
                <FormKitListColors name="boitier_montre" label="Boitier" />
            </div>
            <div class="font-bold text-xl my-4">
                <FormKitListColors name="ecran_montre" label="Écran" class=""/>
            </div> 
            <div class="font-bold text-xl my-4">
                <FormKitListColors name="boutons_montre" label="Boutons" />
            </div>
            <div class="font-bold text-xl my-4">
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
                     class="relative inline-flex h-[25px] w-[50px] shrink-0 cursor-pointer rounded-full border-2 border-noir transition-colors duration-500 ease-in-out focus:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-100">               
                     <span class="sr-only">Use setting</span>
                     <span
                       aria-hidden="true"
                       :class="montre.commander ? 'translate-x-6 bg-blanc' : 'translate-x-0 bg-blanc'"
                       class=" pointer-events-none inline-block h-[21px] w-[21px] transform rounded-full shadow-lg transition duration-500 ease-in-out"
                     />
                </Switch>
                <p class="font-bold text-xl my-4">Voulez vous commander votre montre ?</p>
            </div>
            <div class="flex justify-end font-bold mt-4">
                <button
                  type="button"
                  v-if="Suprmontre.id_montre"
                  @click="($refs.dialogSupprimer as any).showModal()"
                  class="justify-self-end rounded-md text-blanc bg-noir hover:bg-rouge p-2 shadow-sm">
                  Supprimer ma montre
                </button>
                <dialog
                  ref="dialogSupprimer"
                  class=""
                  @click="($event.currentTarget as any).close()">
                  <div class="flex gap-9 p-10">
                        <button
                            type="button"
                            class="justify-self-end rounded-md bg-blanc px-6 py-4 shadow-sm border-2 hover:bg-rouge">
                            Annuler</button>
                        <button
                            type="button"
                            @click="supprimerMontre()"
                            class="rounded-md bg-rouge text-blanc p-2 shadow-sm border-2 border-noir hover:bg-noir">
                            Confirmer suppression
                        </button>
                    </div>
                </dialog>
            </div>

        </FormKit>
    </div>
</template>