<template>
  <DataTableCard title="Invoices" :headers="['Invoice', 'Pet', 'Total', 'Balance', 'Status']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['INV-1001', 'Milo', '$120.00', '$0.00', 'Paid'], ['INV-1002', 'Nina', '$88.00', '$25.00', 'Partial']]
</script>
