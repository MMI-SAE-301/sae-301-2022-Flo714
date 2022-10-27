<template>
    <div class="bg-blanc font-inter font-bold text-noir">
        <div class="p-8 flex justify-center">
            <button v-if="user" @pointerdown="supabase.auth.signOut()">
             Se déconnecter ({{ user.email }})
            </button>
            <FormKit
                 v-else
                 type="form"
                 :submit-label="nvlUtilisateur ? 'S\'inscrire' : 'Se connecter'"
                 @submit="signIn"
                 :submit-attrs="{ classes: { input: 'bg-rouge text-blanc text-3xl px-6 py-4 rounded-lg hover:bg-noir' } }"
                 >
                <div class="my-6"><FormKit name="email" label="Votre Email" type="email" input-class="w-40 bg-blanc border focus:outline-none" label-class=" my-6 text-3xl font-bold" class=""/></div>
                <div class="my-6"><FormKit name="password" label="Mot de passe" type="password" input-class="w-40 bg-blanc border focus:outline-none" label-class="my-6 text-3xl font-bold"/></div>
                <FormKit
                    label="S'inscrire"
                    name="nvlUtilisateur"
                    type="checkbox"
                    v-model="nvlUtilisateur"
                    class=" p-3 mt-4 text-blanc" />
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