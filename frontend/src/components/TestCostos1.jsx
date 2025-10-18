/**
 * Componente de prueba simplificado para verificar que la funcionalidad básica funciona
 */

import React, { useState, useEffect } from 'react'
import { costos1Service } from '../services/api'

const TestCostos1 = () => {
  const [costos1, setCostos1] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    try {
      setLoading(true)
      setError('')
      console.log('🔄 Cargando datos de prueba...')

      // Probar obtener datos
      const data = await costos1Service.getCostos1()
      console.log('✅ Datos recibidos:', data)

      if (Array.isArray(data)) {
        setCostos1(data)
        console.log('✅ Datos cargados correctamente:', data.length, 'registros')
      } else {
        setError('Los datos no tienen el formato esperado')
      }

    } catch (error) {
      console.error('❌ Error:', error)
      setError(`Error: ${error.message}`)
    } finally {
      setLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="p-6">
        <h1 className="text-2xl font-bold mb-4">Test de Costos1</h1>
        <div className="flex items-center">
          <i className="fas fa-spinner fa-spin mr-2"></i>
          <span>Cargando...</span>
        </div>
      </div>
    )
  }

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Test de Costos1</h1>

      {error && (
        <div className="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
          {error}
        </div>
      )}

      <div className="mb-4">
        <button
          onClick={loadData}
          className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
        >
          Recargar Datos
        </button>
      </div>

      <div className="bg-white shadow rounded-lg">
        <div className="px-6 py-4 border-b border-gray-200">
          <h2 className="text-lg font-semibold">Códigos Geográficos ({costos1.length})</h2>
        </div>

        {costos1.length === 0 ? (
          <div className="p-6 text-center text-gray-500">
            No hay códigos geográficos disponibles
          </div>
        ) : (
          <div className="divide-y divide-gray-200">
            {costos1.map((costo1) => (
              <div key={costo1.id} className="p-4 hover:bg-gray-50">
                <div className="flex justify-between items-start">
                  <div>
                    <div className="flex items-center space-x-2">
                      <span className="font-mono font-bold text-blue-600 bg-blue-100 px-2 py-1 rounded">
                        {costo1.codigo}
                      </span>
                      <span className="font-semibold">{costo1.nombre}</span>
                    </div>
                    {costo1.descripcion && (
                      <p className="text-sm text-gray-600 mt-1">{costo1.descripcion}</p>
                    )}
                  </div>
                  <div className="text-sm text-gray-500">
                    ID: {costo1.id}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

export default TestCostos1
