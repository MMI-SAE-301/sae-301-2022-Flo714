<script setup lang="ts">
 import { ref } from "@vue/reactivity";
 import LoginGoogle from "./LoginGoogle.vue";
 import { supabase, user } from "../supabase";
import LoginFacebook from "./LoginFacebook.vue";
import LoginEmail from "./LoginEmail.vue";
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
        <LoginEmail />
    </div>
    <div>
        <p class="font-black flex justify-center text-xl my-2 dark:text-blanc">- OU -</p>
    </div>
    <div class="flex justify-center gap-24 my-10">
        <div>
            <button class="flex items-center gap-6 bg-bleu px-6 py-2 rounded-lg font-inter font-bold text-xl text-blanc hover:bg-noir hover:text-blanc duration-300 hover:dark:text-noir hover:dark:bg-blanc" @pointerdown="supabase.auth.signIn({provider: 'facebook'})"><LoginFacebook />
            Se connecter avec Facebook
            </button>

        </div>
        <div>
            <button class="flex items-center gap-6 bg-rouge px-6 py-2 rounded-lg font-inter font-bold text-xl text-blanc hover:bg-noir hover:text-blanc duration-300" @pointerdown="supabase.auth.signIn({provider: 'google'})"><LoginGoogle />
            Se connecter avec Google
            </button>
            
        </div>
    </div>
</template>