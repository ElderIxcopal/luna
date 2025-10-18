import axios from 'axios'

// Configuración base de axios
const api = axios.create({
  baseURL: 'http://localhost:4000',
  timeout: 10000,
})

// Interceptor para agregar token de autenticación
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// Interceptor para manejar errores de respuesta
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      // Token expirado o inválido
      localStorage.removeItem('token')
      window.location.href = '/login'
    }
    return Promise.reject(error)
  }
)

export default api

// Servicios específicos
export const authService = {
  login: async (credentials) => {
    const response = await api.post('/auth/login', credentials)
    return response.data
  },

  register: async (userData) => {
    const response = await api.post('/auth/register', userData)
    return response.data
  },

  getCurrentUser: async () => {
    const response = await api.get('/auth/profile')
    return response.data
  },

  logout: () => {
    localStorage.removeItem('token')
  }
}

export const userService = {
  getUsers: async (params = {}) => {
    const response = await api.get('/users', { params })
    return response.data
  },

  createUser: async (userData) => {
    const response = await api.post('/users', userData)
    return response.data
  },

  updateUser: async (id, userData) => {
    const response = await api.put(`/users/${id}`, userData)
    return response.data
  },

  deleteUser: async (id) => {
    console.log('🔗 API: Intentando eliminar usuario con ID:', id)
    console.log('🔗 API: Headers:', {
      'Authorization': `Bearer ${localStorage.getItem('token')}` ? 'Token presente' : 'Sin token'
    })

    const response = await api.delete(`/users/${id}`)
    console.log('🔗 API: Respuesta del servidor:', response.data)
    return response.data
  },

  getUserById: async (id) => {
    const response = await api.get(`/users/${id}`)
    return response.data
  }
}

export const costos1Service = {
  getCostos1: async (params = {}) => {
    const response = await api.get('/costos1', { params })
    return response.data
  },

  createCosto1: async (costo1Data) => {
    const response = await api.post('/costos1', costo1Data)
    return response.data
  },

  updateCosto1: async (id, costo1Data) => {
    const response = await api.put(`/costos1/${id}`, costo1Data)
    return response.data
  },

  deleteCosto1: async (id) => {
    const response = await api.delete(`/costos1/${id}`)
    return response.data
  },

  getCosto1ById: async (id) => {
    const response = await api.get(`/costos1/${id}`)
    return response.data
  }
}
