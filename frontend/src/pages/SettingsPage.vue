<template>
  <DataTableCard title="Master Data" :headers="['Category', 'Records', 'Last Updated']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['Species', '5', 'Today'], ['Breeds', '32', 'Today'], ['Payment Methods', '4', 'Today']]
</script>
