<template>
  <DataTableCard title="Pets" :headers="['Name', 'Owner', 'Species', 'Weight(kg)']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'

const rows = [
  ['Milo', 'Sara Lee', 'Dog', '14.2'],
  ['Nina', 'James Ward', 'Cat', '4.8']
]
</script>
