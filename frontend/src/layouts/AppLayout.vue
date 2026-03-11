<template>
  <div class="min-h-screen bg-slate-50">
    <header class="bg-white border-b px-6 py-4 font-semibold">Pet Care ERP</header>
    <div class="flex">
      <aside class="w-64 bg-white border-r min-h-[calc(100vh-65px)] p-4">
        <nav class="space-y-2 text-sm">
          <RouterLink v-for="item in nav" :key="item.to" :to="item.to" class="block px-3 py-2 rounded hover:bg-slate-100">{{ item.label }}</RouterLink>
        </nav>
      </aside>
      <main class="flex-1 p-6"><slot /></main>
    </div>
  </div>
</template>

<script setup>
const nav = [
  { label: 'Dashboard', to: '/' },
  { label: 'Owners', to: '/owners' },
  { label: 'Pets', to: '/pets' },
  { label: 'Appointments', to: '/appointments' },
  { label: 'Consultations', to: '/consultations' },
  { label: 'Pharmacy', to: '/pharmacy' },
  { label: 'Admissions', to: '/admissions' },
  { label: 'Billing', to: '/billing' },
  { label: 'Reports', to: '/reports' },
  { label: 'Settings', to: '/settings' }
]
</script>
