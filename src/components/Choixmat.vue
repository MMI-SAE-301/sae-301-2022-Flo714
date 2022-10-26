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
                <div class="flex gap-10">
                    <RadioGroupOption class="text-blanc"
                        as="template"
                        v-for="plan in plans"
                        :key="plan.materiaux"
                        :value="plan"
                        v-slot="{ active, checked }">
                        <div :class="[
                          active
                            ? 'ring-2 ring-noir'
                            : '',
                          checked ? 'bg-noir text-blanc ' : ' bg-rouge',
                            ]"
                            class="cursor-pointer rounded-lg px-10 py-4 border-2 ">
                            <div class="text-sm">
                                <RadioGroupLabel
                                    as="p"
                                    :class="checked ? 'text-blanc' : 'text-blanc'"
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