<template>
  <DataTableCard title="Pharmacy Issues" :headers="['Prescription', 'Medicine', 'Qty', 'Status']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['RX-1101', 'Amoxicillin', '10', 'Issued'], ['RX-1102', 'Liver Tonic', '2', 'Issued']]
</script>
