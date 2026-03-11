<template>
  <DataTableCard title="Appointments & Walk-ins" :headers="['Pet', 'Doctor', 'Time', 'Status']" :rows="rows" />
</template>

<script setup>
import DataTableCard from '../components/ui/DataTableCard.vue'
const rows = [['Milo', 'Dr. Avery', '10:30', 'Checked In'], ['Nina', 'Dr. Kim', '11:00', 'Booked']]
</script>
