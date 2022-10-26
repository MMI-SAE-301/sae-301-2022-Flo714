<script setup lang="ts">
 import { ref } from "@vue/reactivity";
 import LoginGoogle from "./LoginGoogle.vue";
 import { supabase, user } from "../supabase";
import LoginFacebook from "./LoginFacebook.vue";
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
                 class="w-1/3"
                 >
                <div class="my-6"><FormKit name="email" label="Votre Email" type="email" label-class=" my-6 text-3xl font-bold" class="bg-blanc border focus:outline-none"/></div>
                <div class="my-6"><FormKit name="password" label="Mot de passe" type="password" label-class="my-6 text-3xl font-bold" class=" p-3 bg-blanc border  focus:outline-none"/></div>
                <FormKit
                    label="S'inscrire"
                    name="nvlUtilisateur"
                    type="checkbox"
                    v-model="nvlUtilisateur"
                    class=" p-3 mt-4 text-blanc" />
            </FormKit>
            
        </div>
    </div>
    <div class="flex justify-center gap-24 my-20">
        <div>
            <button class="flex items-center gap-6 bg-bleu px-6 py-4 rounded-lg font-inter font-bold text-xl hover:bg-noir hover:text-blanc duration-300" @pointerdown="supabase.auth.signIn({provider: 'facebook'})"><LoginFacebook />
            Se connecter avec Facebook
            </button>

        </div>
        <div>
            <button class="flex items-center gap-6 bg-rouge px-6 py-4 rounded-lg font-inter font-bold text-xl hover:bg-noir hover:text-blanc duration-300" @pointerdown="supabase.auth.signIn({provider: 'google'})"><LoginGoogle />
            Se connecter avec Google
            </button>
            
        </div>
    </div>
</template>