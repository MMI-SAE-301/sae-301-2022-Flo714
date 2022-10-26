<script setup lang="ts">
import { Colors } from "@/types";
defineProps<{
 name?: string;
 label?: string;
}>();
</script>

<template>
    <FormKit
        :name="name"
        :label="label"
        value="#FFFFFF"
        type="radio"
        :options="Colors"
        :sections-schema="{
        inner: { $el: null },
        decorator: { $el:null },
        }" input-class="peer sr-only" options-class="flex gap-3 mx-4">
        <template #label="context">
            <div class="h-8 w-8 my-4 rounded-2xl border-2 peer-checked:border-noir peer-checked:border-5" :style="{ backgroundColor: context.option.value}" />
            <span class="sr-only">{{ context.option.label }}</span> 
        </template>
    </FormKit>
</template>