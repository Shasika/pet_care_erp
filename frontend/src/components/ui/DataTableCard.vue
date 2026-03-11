<template>
  <section class="bg-white rounded border">
    <header class="px-4 py-3 border-b flex items-center justify-between">
      <h2 class="font-semibold">{{ title }}</h2>
      <slot name="actions" />
    </header>
    <div class="overflow-auto">
      <table class="w-full text-sm">
        <thead class="bg-slate-50">
          <tr>
            <th v-for="h in headers" :key="h" class="px-4 py-2 text-left">{{ h }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(row, i) in rows" :key="i" class="border-t">
            <td v-for="(value, j) in row" :key="j" class="px-4 py-2">{{ value }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script setup>
defineProps({
  title: { type: String, required: true },
  headers: { type: Array, default: () => [] },
  rows: { type: Array, default: () => [] }
})
</script>
