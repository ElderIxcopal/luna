import React, { useState, useEffect } from 'react'
import { userService } from '../services/api'
import { useAuth } from '../contexts/AuthContext'

const UsersManager = () => {
  const [users, setUsers] = useState([])
  const [filteredUsers, setFilteredUsers] = useState([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [showModal, setShowModal] = useState(false)
  const [editingUser, setEditingUser] = useState(null)
  const [formData, setFormData] = useState({
    email: '',
    password: '',
    role: 'user',
    status: 'active'
  })
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [userToDelete, setUserToDelete] = useState(null)
  const [deleting, setDeleting] = useState(false)

  const { isAuthenticated } = useAuth()

  useEffect(() => {
    if (isAuthenticated) {
      loadUsers()
    }
  }, [isAuthenticated])

  useEffect(() => {
    filterUsers()
  }, [users, searchTerm])

  const loadUsers = async () => {
    try {
      setLoading(true)
      console.log('🔄 Cargando usuarios desde la API...')
      const data = await userService.getUsers()
      console.log('📦 Datos recibidos de la API:', data)

      const usersArray = Array.isArray(data) ? data : data.users || []
      console.log('👥 Usuarios procesados:', usersArray.length)
      console.log('📋 Lista de usuarios:', usersArray.map(u => ({ id: u.id, email: u.email, role: u.role })))

      setUsers(usersArray)
    } catch (error) {
      console.error('❌ Error cargando usuarios:', error)
    } finally {
      setLoading(false)
    }
  }

  const filterUsers = () => {
    if (!searchTerm) {
      setFilteredUsers(users)
      return
    }

    const filtered = users.filter(user =>
      user.email.toLowerCase().includes(searchTerm.toLowerCase())
    )
    setFilteredUsers(filtered)
  }

  const handleCreateUser = () => {
    setEditingUser(null)
    setFormData({
      email: '',
      password: '',
      role: 'user',
      status: 'active'
    })
    setShowModal(true)
  }

  const handleEditUser = (user) => {
    setEditingUser(user)
    setFormData({
      email: user.email,
      password: '', // No mostrar contraseña actual
      role: user.role,
      status: user.isActive ? 'active' : 'inactive'
    })
    setShowModal(true)
  }

  const handleDeleteUser = (user) => {
    console.log('🗑️ Usuario seleccionado para eliminar:', user)
    console.log('🆔 ID del usuario:', user.id)
    console.log('📧 Email del usuario:', user.email)

    setUserToDelete(user)
    setShowDeleteModal(true)
  }

  const confirmDeleteUser = async () => {
    if (!userToDelete) return

    try {
      setDeleting(true)
      console.log('🔄 Intentando eliminar usuario:', userToDelete.id)
      console.log('🔐 Token en localStorage:', localStorage.getItem('token') ? 'Token presente' : 'Sin token')

      await userService.deleteUser(userToDelete.id)
      console.log('✅ Usuario eliminado exitosamente')

      setShowDeleteModal(false)
      setUserToDelete(null)
      await loadUsers()
    } catch (error) {
      console.error('❌ Error eliminando usuario:', error)
      console.error('❌ Error completo:', {
        message: error.message,
        status: error.response?.status,
        data: error.response?.data,
        config: error.config
      })

      // Verificar si el error es por token inválido
      if (error.response?.status === 401) {
        alert('❌ Tu sesión ha expirado. Inicia sesión nuevamente.')
        // Redirigir al login
        window.location.href = '/'
      } else if (error.response?.status === 403) {
        alert('❌ No tienes permisos de administrador para eliminar usuarios.')
      } else if (error.response?.status === 404) {
        alert('❌ Usuario no encontrado o ya fue eliminado.')
      } else {
        alert(`❌ Error al eliminar usuario: ${error.response?.data?.message || error.message}`)
      }
    } finally {
      setDeleting(false)
    }
  }

  const handleSubmit = async (e) => {
    e.preventDefault()

    try {
      if (editingUser) {
        await userService.updateUser(editingUser.id, formData)
      } else {
        await userService.createUser(formData)
      }

      setShowModal(false)
      await loadUsers()
    } catch (error) {
      console.error('Error guardando usuario:', error)
    }
  }

  const handleInputChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    })
  }

  if (loading) {
    return (
      <div className="p-6">
        <div className="flex items-center justify-center py-12">
          <i className="fas fa-spinner fa-spin text-2xl text-gray-400 mr-2"></i>
          <span className="text-gray-600">Cargando usuarios...</span>
        </div>
      </div>
    )
  }

  return (
    <div className="p-6">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Gestión de Usuarios</h1>
        <p className="text-gray-600 mt-2">Administra usuarios del sistema</p>
      </div>

      <div className="card mb-6">
        <div className="p-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <input
                type="text"
                placeholder="Buscar por email..."
                className="input"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
            </div>
            <button
              onClick={handleCreateUser}
              className="btn btn-primary"
            >
              <i className="fas fa-plus mr-2"></i>
              Nuevo Usuario
            </button>
          </div>
        </div>
      </div>

      <div className="card">
        <div className="p-6">
          {filteredUsers.length === 0 ? (
            <div className="text-center py-12">
              <i className="fas fa-users text-gray-300 text-4xl mb-4"></i>
              <h3 className="text-lg font-medium text-gray-900 mb-2">No hay usuarios</h3>
              <p className="text-gray-500">Comienza creando tu primer usuario</p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="border-b border-gray-200">
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Usuario</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Email</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Rol</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Estado</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredUsers.map((user) => (
                    <tr key={user.id} className="border-b border-gray-100 hover:bg-gray-50">
                      <td className="py-3 px-4">
                        <div className="flex items-center">
                          <div className="w-10 h-10 rounded-full bg-indigo-500 flex items-center justify-center text-white font-semibold mr-3">
                            {user.email.charAt(0).toUpperCase()}
                          </div>
                          <div>
                            <div className="font-medium text-gray-900">{user.email}</div>
                          </div>
                        </div>
                      </td>
                      <td className="py-3 px-4 text-gray-700">{user.email}</td>
                      <td className="py-3 px-4">
                        <span className={`px-2 py-1 text-xs font-medium rounded-full ${
                          user.role === 'admin'
                            ? 'bg-purple-100 text-purple-800'
                            : 'bg-blue-100 text-blue-800'
                        }`}>
                          {user.role === 'admin' ? 'Administrador' : 'Usuario'}
                        </span>
                      </td>
                      <td className="py-3 px-4">
                        <span className={`px-2 py-1 text-xs font-medium rounded-full ${
                          user.isActive
                            ? 'bg-green-100 text-green-800'
                            : 'bg-red-100 text-red-800'
                        }`}>
                          {user.isActive ? 'Activo' : 'Inactivo'}
                        </span>
                      </td>
                      <td className="py-3 px-4">
                        <div className="flex space-x-2">
                          <button
                            onClick={() => handleEditUser(user)}
                            className="btn btn-outline btn-sm"
                          >
                            <i className="fas fa-edit"></i>
                          </button>
                          <button
                            onClick={() => handleDeleteUser(user)}
                            className="btn btn-danger btn-sm"
                          >
                            <i className="fas fa-trash"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>

      {/* Modal de Usuario */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl">
            {/* Header del Modal */}
            <div className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white p-6 rounded-t-2xl">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-3">
                  <div className="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                    <i className={`fas fa-${editingUser ? 'user-edit' : 'user-plus'} text-2xl`}></i>
                  </div>
                  <div>
                    <h2 className="text-2xl font-bold">
                      {editingUser ? 'Editar Usuario' : 'Crear Nuevo Usuario'}
                    </h2>
                    <p className="text-blue-100 text-sm">
                      {editingUser ? 'Modifica la información del usuario' : 'Agrega un nuevo usuario al sistema'}
                    </p>
                  </div>
                </div>
                <button
                  onClick={() => setShowModal(false)}
                  className="w-10 h-10 bg-white bg-opacity-20 hover:bg-opacity-30 rounded-full flex items-center justify-center transition-all duration-200 hover:scale-110"
                >
                  <i className="fas fa-times text-lg"></i>
                </button>
              </div>
            </div>

            {/* Contenido del Modal */}
            <div className="p-8">
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div className="md:col-span-2">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Dirección de Email <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="email"
                      name="email"
                      required
                      className="input"
                      value={formData.email}
                      onChange={handleInputChange}
                      placeholder="usuario@empresa.com"
                    />
                  </div>

                  <div className="md:col-span-2">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Contraseña de Acceso <span className="text-red-500">{editingUser ? '(opcional)' : '*'}</span>
                    </label>
                    <input
                      type="password"
                      name="password"
                      className="input"
                      value={formData.password}
                      onChange={handleInputChange}
                      placeholder={editingUser ? '•••••••• (dejar vacío para mantener)' : '••••••••'}
                      required={!editingUser}
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Nivel de Acceso <span className="text-red-500">*</span>
                    </label>
                    <select
                      name="role"
                      className="input"
                      value={formData.role}
                      onChange={handleInputChange}
                    >
                      <option value="user">👤 Usuario Estándar</option>
                      <option value="admin">👑 Administrador</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Estado de la Cuenta <span className="text-red-500">*</span>
                    </label>
                    <select
                      name="status"
                      className="input"
                      value={formData.status}
                      onChange={handleInputChange}
                    >
                      <option value="active">✅ Activo</option>
                      <option value="inactive">⏸️ Inactivo</option>
                    </select>
                  </div>
                </div>
              </form>
            </div>

            {/* Footer del Modal */}
            <div className="bg-gray-50 px-8 py-6 rounded-b-2xl border-t border-gray-200">
              <div className="flex items-center justify-between">
                <div className="text-sm text-gray-500">
                  {editingUser ? 'Editando usuario existente' : 'Creando nuevo usuario'}
                </div>
                <div className="flex space-x-3">
                  <button
                    onClick={() => setShowModal(false)}
                    className="px-6 py-3 bg-gray-200 hover:bg-gray-300 text-gray-700 font-medium rounded-lg transition-colors duration-200"
                  >
                    Cancelar
                  </button>
                  <button
                    onClick={handleSubmit}
                    className="px-6 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-700 hover:to-indigo-700 text-white font-medium rounded-lg transition-all duration-200"
                  >
                    {editingUser ? 'Actualizar Usuario' : 'Crear Usuario'}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Modal de Confirmación de Eliminación */}
      {showDeleteModal && userToDelete && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-lg shadow-xl max-w-md w-full">
            <div className="p-6">
              <div className="flex items-center mb-4">
                <div className="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-3">
                  <i className="fas fa-exclamation-triangle text-red-600 text-xl"></i>
                </div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-900">Confirmar Eliminación</h3>
                  <p className="text-sm text-gray-600">Esta acción no se puede deshacer</p>
                </div>
              </div>

              <div className="mb-6">
                <p className="text-gray-700 mb-2">
                  ¿Estás seguro de que deseas eliminar al usuario:
                </p>
                <div className="bg-gray-50 p-3 rounded-lg">
                  <p className="font-medium text-gray-900">{userToDelete.email}</p>
                  <p className="text-sm text-gray-600">
                    {userToDelete.role === 'admin' ? 'Administrador' : 'Usuario'}
                  </p>
                </div>
              </div>

              <div className="flex justify-end space-x-3">
                <button
                  onClick={() => {
                    setShowDeleteModal(false)
                    setUserToDelete(null)
                  }}
                  disabled={deleting}
                  className="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 font-medium rounded-lg transition-colors duration-200 disabled:opacity-50"
                >
                  Cancelar
                </button>
                <button
                  onClick={confirmDeleteUser}
                  disabled={deleting}
                  className="px-4 py-2 bg-red-600 hover:bg-red-700 text-white font-medium rounded-lg transition-colors duration-200 disabled:opacity-50 flex items-center"
                >
                  {deleting ? (
                    <>
                      <i className="fas fa-spinner fa-spin mr-2"></i>
                      Eliminando...
                    </>
                  ) : (
                    <>
                      <i className="fas fa-trash mr-2"></i>
                      Eliminar Usuario
                    </>
                  )}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

    </div>
  )
}

export default UsersManager
