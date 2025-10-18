import React, { useState, useEffect } from 'react'
import { costos1Service } from '../services/api'
import { useAuth } from '../contexts/AuthContext'

const Costos1Manager = () => {
  const [costos1, setCostos1] = useState([])
  const [filteredCostos1, setFilteredCostos1] = useState([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')
  const [showModal, setShowModal] = useState(false)
  const [editingCosto1, setEditingCosto1] = useState(null)
  const [formData, setFormData] = useState({
    codigo: '',
    nombre: '',
    nombre2: '',
    nombre3: '',
    desde: '',
    hasta: '',
    comentarios: ''
  })
  const [showDeleteModal, setShowDeleteModal] = useState(false)
  const [costo1ToDelete, setCosto1ToDelete] = useState(null)
  const [deleting, setDeleting] = useState(false)

  const { isAuthenticated } = useAuth()

  useEffect(() => {
    if (isAuthenticated) {
      loadCostos1()
    }
  }, [isAuthenticated])

  useEffect(() => {
    filterCostos1()
  }, [costos1, searchTerm])

  const loadCostos1 = async () => {
    try {
      setLoading(true)
      console.log('🔄 Cargando códigos geográficos desde la API...')
      const data = await costos1Service.getCostos1()
      console.log('📦 Datos recibidos de la API:', data)

      const costos1Array = Array.isArray(data) ? data : data.costos1 || []
      console.log('🏛️ Códigos geográficos procesados:', costos1Array.length)
      console.log('📋 Lista de códigos:', costos1Array.map(c => ({ id: c.id, codigo: c.codigo, nombre: c.nombre })))

      setCostos1(costos1Array)
    } catch (error) {
      console.error('❌ Error cargando códigos geográficos:', error)
    } finally {
      setLoading(false)
    }
  }

  const filterCostos1 = () => {
    if (!searchTerm) {
      setFilteredCostos1(costos1)
      return
    }

    const filtered = costos1.filter(costo1 =>
      costo1.codigo?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      costo1.nombre?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      costo1.nombre2?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      costo1.nombre3?.toLowerCase().includes(searchTerm.toLowerCase())
    )
    setFilteredCostos1(filtered)
  }

  const handleCreateCosto1 = () => {
    setEditingCosto1(null)
    setFormData({
      codigo: '',
      nombre: '',
      nombre2: '',
      nombre3: '',
      desde: '',
      hasta: '',
      comentarios: ''
    })
    setShowModal(true)
  }

  const handleEditCosto1 = (costo1) => {
    setEditingCosto1(costo1)
    setFormData({
      codigo: costo1.codigo,
      nombre: costo1.nombre,
      nombre2: costo1.nombre2 || '',
      nombre3: costo1.nombre3 || '',
      desde: costo1.desde || '',
      hasta: costo1.hasta || '',
      comentarios: costo1.comentarios || ''
    })
    setShowModal(true)
  }

  const handleDeleteCosto1 = (costo1) => {
    setCosto1ToDelete(costo1)
    setShowDeleteModal(true)
  }

  const confirmDeleteCosto1 = async () => {
    if (!costo1ToDelete) return

    try {
      setDeleting(true)
      console.log('🔄 Intentando eliminar código geográfico:', costo1ToDelete.id)

      await costos1Service.deleteCosto1(costo1ToDelete.id)
      console.log('✅ Código geográfico eliminado exitosamente')

      setShowDeleteModal(false)
      setCosto1ToDelete(null)
      await loadCostos1()
    } catch (error) {
      console.error('❌ Error eliminando código geográfico:', error)

      if (error.response?.status === 403) {
        alert('❌ No tienes permisos de administrador para eliminar códigos.')
      } else if (error.response?.status === 404) {
        alert('❌ Código no encontrado o ya fue eliminado.')
      } else {
        alert(`❌ Error al eliminar código: ${error.response?.data?.message || error.message}`)
      }
    } finally {
      setDeleting(false)
    }
  }

  const handleSubmit = async (e) => {
    e.preventDefault()

    try {
      if (editingCosto1) {
        await costos1Service.updateCosto1(editingCosto1.id, formData)
      } else {
        await costos1Service.createCosto1(formData)
      }

      setShowModal(false)
      await loadCostos1()
    } catch (error) {
      console.error('Error guardando código geográfico:', error)
      alert(`Error al guardar código: ${error.response?.data?.message || error.message}`)
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
          <span className="text-gray-600">Cargando códigos geográficos...</span>
        </div>
      </div>
    )
  }

  return (
    <div className="p-6">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Gestión de Códigos Geográficos</h1>
        <p className="text-gray-600 mt-2">Administra los códigos de ubicación y departamentos</p>
      </div>

      <div className="card mb-6">
        <div className="p-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <input
                type="text"
                placeholder="Buscar por código, nombre..."
                className="input"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
            </div>
            <button
              onClick={handleCreateCosto1}
              className="btn btn-primary"
            >
              <i className="fas fa-plus mr-2"></i>
              Nuevo Código
            </button>
          </div>
        </div>
      </div>

      <div className="card">
        <div className="p-6">
          {filteredCostos1.length === 0 ? (
            <div className="text-center py-12">
              <i className="fas fa-map-marker-alt text-gray-300 text-4xl mb-4"></i>
              <h3 className="text-lg font-medium text-gray-900 mb-2">No hay códigos geográficos</h3>
              <p className="text-gray-500">Comienza creando tu primer código de ubicación</p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="border-b border-gray-200">
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Código</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Nombre Principal</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Nombre Alternativo 1</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Nombre Alternativo 2</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Comentarios</th>
                    <th className="text-left py-3 px-4 font-semibold text-gray-900">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  {filteredCostos1.map((costo1) => (
                    <tr key={costo1.id} className="border-b border-gray-100 hover:bg-gray-50">
                      <td className="py-3 px-4">
                        <div className="flex items-center">
                          <div className="w-10 h-10 rounded-full bg-blue-500 flex items-center justify-center text-white font-semibold mr-3">
                            {costo1.codigo.charAt(0).toUpperCase()}
                          </div>
                          <div>
                            <div className="font-medium text-gray-900">{costo1.codigo}</div>
                          </div>
                        </div>
                      </td>
                      <td className="py-3 px-4 text-gray-700">{costo1.nombre}</td>
                      <td className="py-3 px-4 text-gray-700">{costo1.nombre2 || '-'}</td>
                      <td className="py-3 px-4 text-gray-700">{costo1.nombre3 || '-'}</td>
                      <td className="py-3 px-4 text-gray-700 max-w-xs truncate">
                        {costo1.comentarios || '-'}
                      </td>
                      <td className="py-3 px-4">
                        <div className="flex space-x-2">
                          <button
                            onClick={() => handleEditCosto1(costo1)}
                            className="btn btn-outline btn-sm"
                          >
                            <i className="fas fa-edit"></i>
                          </button>
                          <button
                            onClick={() => handleDeleteCosto1(costo1)}
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

      {/* Modal de Código Geográfico */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl">
            {/* Header del Modal */}
            <div className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white p-6 rounded-t-2xl">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-3">
                  <div className="w-12 h-12 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                    <i className={`fas fa-${editingCosto1 ? 'edit' : 'plus'} text-2xl`}></i>
                  </div>
                  <div>
                    <h2 className="text-2xl font-bold">
                      {editingCosto1 ? 'Editar Código Geográfico' : 'Crear Nuevo Código'}
                    </h2>
                    <p className="text-blue-100 text-sm">
                      {editingCosto1 ? 'Modifica la información del código' : 'Agrega un nuevo código de ubicación'}
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
                      Código Geográfico <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      name="codigo"
                      required
                      className="input"
                      value={formData.codigo}
                      onChange={handleInputChange}
                      placeholder="Ej: GT, XE, TE"
                      maxLength="50"
                    />
                  </div>

                  <div className="md:col-span-2">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Nombre Principal <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      name="nombre"
                      required
                      className="input"
                      value={formData.nombre}
                      onChange={handleInputChange}
                      placeholder="Ej: GUATEMALA, XELA, TECULUTAN"
                      maxLength="100"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Nombre Alternativo 1
                    </label>
                    <input
                      type="text"
                      name="nombre2"
                      className="input"
                      value={formData.nombre2}
                      onChange={handleInputChange}
                      placeholder="Nombre alternativo"
                      maxLength="255"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Nombre Alternativo 2
                    </label>
                    <input
                      type="text"
                      name="nombre3"
                      className="input"
                      value={formData.nombre3}
                      onChange={handleInputChange}
                      placeholder="Otro nombre alternativo"
                      maxLength="255"
                    />
                  </div>

                  <div className="md:col-span-1">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Comentarios <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      name="comentarios"
                      required
                      className="input"
                      value={formData.comentarios}
                      onChange={handleInputChange}
                      placeholder="Comentarios adicionales"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Fecha Desde
                    </label>
                    <input
                      type="date"
                      name="desde"
                      className="input"
                      value={formData.desde}
                      onChange={handleInputChange}
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">
                      Fecha Hasta
                    </label>
                    <input
                      type="date"
                      name="hasta"
                      className="input"
                      value={formData.hasta}
                      onChange={handleInputChange}
                    />
                  </div>
                </div>
              </form>
            </div>

            {/* Footer del Modal */}
            <div className="bg-gray-50 px-8 py-6 rounded-b-2xl border-t border-gray-200">
              <div className="flex items-center justify-between">
                <div className="text-sm text-gray-500">
                  {editingCosto1 ? 'Editando código existente' : 'Creando nuevo código'}
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
                    {editingCosto1 ? 'Actualizar Código' : 'Crear Código'}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Modal de Confirmación de Eliminación */}
      {showDeleteModal && costo1ToDelete && (
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
                  ¿Estás seguro de que deseas eliminar el código:
                </p>
                <div className="bg-gray-50 p-3 rounded-lg">
                  <p className="font-medium text-gray-900">
                    <span className="font-mono text-blue-600">{costo1ToDelete.codigo}</span> - {costo1ToDelete.nombre}
                  </p>
                </div>
              </div>

              <div className="flex justify-end space-x-3">
                <button
                  onClick={() => {
                    setShowDeleteModal(false)
                    setCosto1ToDelete(null)
                  }}
                  disabled={deleting}
                  className="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-700 font-medium rounded-lg transition-colors duration-200 disabled:opacity-50"
                >
                  Cancelar
                </button>
                <button
                  onClick={confirmDeleteCosto1}
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
                      Eliminar Código
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

export default Costos1Manager
