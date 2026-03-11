<template>
  <button :class="classes" :disabled="disabled || loading">
    <span v-if="loading">Processing...</span>
    <slot v-else />
  </button>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  variant: { type: String, default: 'primary' },
  disabled: { type: Boolean, default: false },
  loading: { type: Boolean, default: false }
})

const classes = computed(() => {
  const base = 'px-4 py-2 rounded text-sm font-medium disabled:opacity-50'
  const variants = {
    primary: 'bg-blue-600 text-white hover:bg-blue-700',
    secondary: 'bg-slate-200 text-slate-800 hover:bg-slate-300',
    danger: 'bg-red-600 text-white hover:bg-red-700'
  }

  return `${base} ${variants[props.variant] || variants.primary}`
})
</script>
