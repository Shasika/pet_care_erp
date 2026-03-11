<template>
  <DataTableCard title="Owners" :headers="['Name', 'Phone', 'Email']" :rows="rows">
    <template #actions>
      <AppButton>Add Owner</AppButton>
    </template>
  </DataTableCard>
</template>

<script setup>
import AppButton from '../components/ui/AppButton.vue'
import DataTableCard from '../components/ui/DataTableCard.vue'

const rows = [
  ['Sara Lee', '+1 123 555 2010', 'sara@example.com'],
  ['James Ward', '+1 123 555 3322', 'james@example.com']
]
</script>
