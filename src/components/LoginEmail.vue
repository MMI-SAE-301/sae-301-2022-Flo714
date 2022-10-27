<template>
    <div class="bg-blanc font-inter font-bold text-noir dark:bg-noir">
        <div class="p-8 flex justify-center">
            <button v-if="user" class="px-6 py-3 text-xl bg-rouge text-blanc rounded-lg dark:text-blanc duration-500 hover:dark:text-noir hover:dark:bg-blanc" @pointerdown="supabase.auth.signOut()">
             Se déconnecter ({{ user.email }})
            </button>
            <FormKit
                 v-else
                 type="form"
                 
                 :submit-label="nvlUtilisateur ? 'S\'inscrire' : 'Se connecter'"
                 @submit="signIn"
                 :submit-attrs="{ classes: { input: 'bg-rouge text-blanc text-3xl px-6 py-4 rounded-lg hover:bg-noir duration-500 hover:dark:text-noir hover:dark:bg-blanc' } }"

                 >
                <div class="my-6"><FormKit name="email" label="Votre Email" type="email" input-class="w-80 bg-blanc focus:outline-none" label-class=" my-6 text-3xl font-bold dark:text-blanc"/></div>
                <div class="my-6"><FormKit name="password" label="Mot de passe" type="password" input-class="w-80 bg-blanc focus:outline-none " label-class="my-20 text-3xl font-bold dark:text-blanc"/></div>
                <FormKit
                    label="S'inscrire"
                    label-class="dark:text-blanc"
                    name="nvlUtilisateur"
                    type="checkbox"
                    v-model="nvlUtilisateur"/>
            </FormKit>
            
        </div>
    </div>
</template>

<script setup lang="ts">


import { supabase, user } from "../supabase";
import { ref } from "@vue/reactivity";


 async function signIn(data, node) {
    const { user, error } = await (nvlUtilisateur.value
       ? supabase.auth.signUp(data)
       : supabase.auth.signIn(data));
    if (error) {
       console.error(error);
       node.setErrors([error.message]);
       }
 }
 
 const nvlUtilisateur = ref(false);


</script>