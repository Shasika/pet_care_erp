<template>
  <div class="min-h-screen bg-slate-50">
    <header class="bg-white border-b px-6 py-4 flex items-center justify-between">
      <p class="font-semibold">Pet Care ERP</p>
      <p class="text-xs text-slate-500">Role: {{ role }}</p>
    </header>
    <div class="flex">
      <aside class="w-64 bg-white border-r min-h-[calc(100vh-65px)] p-4">
        <nav class="space-y-2 text-sm">
          <RouterLink
            v-for="item in visibleNav"
            :key="item.to"
            :to="item.to"
            class="block px-3 py-2 rounded hover:bg-slate-100"
          >
            {{ item.label }}
          </RouterLink>
        </nav>
      </aside>
      <main class="flex-1 p-6"><slot /></main>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const role = 'admin'

const nav = [
  { label: 'Dashboard', to: '/', roles: ['admin', 'doctor', 'cashier', 'pharmacist'] },
  { label: 'Owners', to: '/owners', roles: ['admin', 'receptionist'] },
  { label: 'Pets', to: '/pets', roles: ['admin', 'receptionist'] },
  { label: 'Appointments', to: '/appointments', roles: ['admin', 'receptionist'] },
  { label: 'Consultations', to: '/consultations', roles: ['admin', 'doctor'] },
  { label: 'Pharmacy', to: '/pharmacy', roles: ['admin', 'pharmacist'] },
  { label: 'Admissions', to: '/admissions', roles: ['admin', 'doctor'] },
  { label: 'Billing', to: '/billing', roles: ['admin', 'cashier'] },
  { label: 'Reports', to: '/reports', roles: ['admin', 'cashier'] },
  { label: 'Settings', to: '/settings', roles: ['admin'] }
]

const visibleNav = computed(() => nav.filter((item) => item.roles.includes(role)))
</script>
