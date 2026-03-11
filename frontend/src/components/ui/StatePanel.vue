<template>
  <div class="rounded border bg-white p-6 text-sm text-slate-600">
    <p class="font-semibold text-slate-800 mb-2">{{ title }}</p>
    <p>{{ message }}</p>
  </div>
</template>

<script setup>
defineProps({
  title: { type: String, required: true },
  message: { type: String, required: true }
})
</script>
