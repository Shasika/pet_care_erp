<template>
  <DataTableCard title="Admissions" :headers="['Pet', 'Ward/Bed', 'Admitted At', 'Status']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['Milo', 'Ward A / B-03', '2026-03-11 10:32', 'Admitted']]
</script>
