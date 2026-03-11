import axios from 'axios'

const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  timeout: 15000,
  withCredentials: true
})

api.interceptors.response.use(
  (response) => response,
  (error) => {
    const fallbackMessage = 'Unexpected server error.'
    const message = error?.response?.data?.message || fallbackMessage
    return Promise.reject({ ...error, friendlyMessage: message })
  }
)

export default api
