<script setup lang="ts">
import { ref } from 'vue'
import {
  RadioGroup,
  RadioGroupLabel,
  RadioGroupDescription,
  RadioGroupOption,
} from '@headlessui/vue'

const plans = [
  {
    materiaux: 'Carbone',
  },
  {
    materiaux: 'Cuir',
  },
  {
    materiaux: 'Caoutchouc',
  },
]

const selected = ref(plans[0])
</script>

<template>
    <div class="w-full px-4 py-8">
      <div class="mx-auto w-full max-w-md">
        <RadioGroup v-model="selected">
            <RadioGroupLabel class="sr-only ">Server size</RadioGroupLabel>
                <div class="flex gap-10 ">
                    <RadioGroupOption class=""
                        as="template"
                        v-for="plan in plans"
                        :key="plan.materiaux"
                        :value="plan"
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
                                    {{ plan.materiaux }}
                                </RadioGroupLabel>
                            </div>
                        </div>
                    </RadioGroupOption>
                </div>
            </RadioGroup>
        </div>
    </div>
  </template>