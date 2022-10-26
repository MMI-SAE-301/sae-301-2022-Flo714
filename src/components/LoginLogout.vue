<script setup lang="ts">
 import { ref } from "@vue/reactivity";
 import LoginGoogle from "./LoginGoogle.vue";
 import { supabase, user } from "../supabase";
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
    <div>
        <div>
            <button @pointerdown="supabase.auth.signIn({provider: 'facebook'})">
            Se connecter avec Facebook
            </button>
        </div>
        <div>
            <button @pointerdown="supabase.auth.signIn({provider: 'google'})">
            Se connecter avec Google
            </button>
            <LoginGoogle />
        </div>
    </div>
    <div class="bg-blanc font-inter font-bold text-noir">
        <div class="w-full">
            <div class="border-2 border-noir border-opacity-40">
                <div class="p-8 flex justify-center">
                    <button v-if="user" @pointerdown="supabase.auth.signOut()">
                     Se déconnecter ({{ user.email }})
                    </button>
                    <FormKit
                         v-else
                         type="form"
                         :submit-label="nvlUtilisateur ? 'S\'inscrire' : 'Se connecter'"
                         @submit="signIn"
                         :submit-attrs="{ classes: { input: 'bg-rouge text-blanc px-4 py-2 rounded-lg hover:bg-noir' } }"
                         >
                        <FormKit name="email" label="Votre eMail" type="email" label-class="my-6 text-3xl font-bold" class="w-full p-3 rounded bg-blanc border focus:outline-none"/>
                        <FormKit name="password" label="Mot de passe" type="password" label-class="my-6 text-3xl font-bold" class=" my-10 w-full p-3 rounded bg-blanc border  focus:outline-none"/>
                        <FormKit
                        label="S'inscrire"
                        name="nvlUtilisateur"
                        type="checkbox"
                        v-model="nvlUtilisateur"
                        class=" p-3 mt-4 text-blanc flex jus"
                        />
                    </FormKit>
                </div>
            </div>
        </div>
    </div>
</template>