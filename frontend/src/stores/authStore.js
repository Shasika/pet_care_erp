import { defineStore } from 'pinia'
import api from '../services/api'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null,
    loading: false
  }),
  actions: {
    async fetchMe() {
      this.loading = true
      try {
        const { data } = await api.get('/auth/me')
        this.user = data.data
      } finally {
        this.loading = false
      }
    }
  }
})
