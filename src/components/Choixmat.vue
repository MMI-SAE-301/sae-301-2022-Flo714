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
    <div class="w-full px-4 py-16">
      <div class="mx-auto w-full max-w-md">
        <RadioGroup v-model="selected">
            <RadioGroupLabel class="sr-only">Server size</RadioGroupLabel>
                <div class="space-y-2">
                    <RadioGroupOption
                        as="template"
                        v-for="plan in plans"
                        :key="plan.materiaux"
                        :value="plan"
                        v-slot="{ active, checked }">
                        <div :class="[
                          active
                            ? 'ring-2 ring-noir'
                            : '',
                          checked ? 'bg-noir bg-opacity-5 text-noir ' : 'bg-blanc ',
                            ]"
                            class="cursor-pointer rounded-lg px-5 py-4 border-2">
                            <div class="flex w-full justify-between">
                                <div class="flex items-center">
                                    <div class="text-sm">
                                        <RadioGroupLabel
                                            as="p"
                                            :class="checked ? 'text-noir' : 'text-gray-900'"
                                            class="font-medium">
                                            {{ plan.materiaux }}
                                        </RadioGroupLabel>
                                    </div>
                                </div>
                                <div v-show="checked" class="shrink-0 text-white">
                                    <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none">
                                        <circle cx="12" cy="12" r="12" fill="#000" fill-opacity="0.2" />
                                        <path d="M7 13l3 3 7-7" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </RadioGroupOption>
                </div>
            </RadioGroup>
        </div>
    </div>
  </template>