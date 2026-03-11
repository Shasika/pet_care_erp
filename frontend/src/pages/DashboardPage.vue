<template>
  <div class="space-y-4">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
      <article v-for="card in cards" :key="card.label" class="bg-white border rounded p-4">
        <p class="text-xs text-slate-500">{{ card.label }}</p>
        <p class="text-2xl font-semibold mt-2">{{ card.value }}</p>
      </article>
    </div>
    <StatePanel title="Operational Health" message="Queue workers, reminders, and low-stock alerts are tracked in server monitoring dashboards." />
  </div>
</template>

<script setup>
import StatePanel from '../components/ui/StatePanel.vue'

const cards = [
  { label: 'Today Sales', value: '$3,420' },
  { label: 'Consultations', value: '28' },
  { label: 'Admissions', value: '6' },
  { label: 'Outstanding', value: '$980' }
]
</script>
