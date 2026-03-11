<template>
  <DataTableCard title="Consultations" :headers="['Visit', 'Diagnosis', 'Status']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['VIS-001', 'Canine dermatitis', 'Finalized'], ['VIS-002', 'Gastritis', 'Draft']]
</script>
