import React from 'react'
import { useTheme } from '../contexts/ThemeContext'

const THEME_OPTIONS = [
  { id: 'light', label: 'Claro', description: 'Interfaz clara con fondo gris suave' },
  { id: 'dark', label: 'Oscuro', description: 'Interfaz oscura para ambientes con poca luz' }
]

const SIDEBAR_COLORS = [
  { id: 'blue', label: 'Azul', sample: 'bg-blue-500' },
  { id: 'emerald', label: 'Verde', sample: 'bg-emerald-500' },
  { id: 'violet', label: 'Violeta', sample: 'bg-violet-500' },
  { id: 'amber', label: 'Ámbar', sample: 'bg-amber-500' }
]

const Settings = () => {
  const { theme, setTheme, sidebarColor, setSidebarColor } = useTheme()

  return (
    <div className="p-6 space-y-8">
      <div>
        <h1 className="text-3xl font-bold">Configuración</h1>
        <p className="text-gray-600 dark:text-gray-400 mt-2">Personaliza la apariencia de Luna</p>
      </div>

      <div className="card p-6 space-y-6">
        <h2 className="text-xl font-semibold">Tema general</h2>
        <div className="grid gap-4 md:grid-cols-2">
          {THEME_OPTIONS.map((option) => (
            <button
              key={option.id}
              onClick={() => setTheme(option.id)}
              className={`text-left p-4 rounded-lg border transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 dark:focus:ring-blue-400 ${
                theme === option.id
                  ? 'border-blue-500 bg-blue-50 dark:border-blue-400 dark:bg-blue-900/30'
                  : 'border-gray-200 hover:border-blue-300 dark:border-slate-700 dark:hover:border-blue-500'
              }`}
            >
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-lg font-medium">{option.label}</h3>
                  <p className="text-sm text-gray-600 dark:text-gray-400">{option.description}</p>
                </div>
                {theme === option.id && <i className="fas fa-check-circle text-blue-500 dark:text-blue-300 text-xl"></i>}
              </div>
            </button>
          ))}
        </div>
      </div>

      <div className="card p-6 space-y-6">
        <h2 className="text-xl font-semibold">Color de barra lateral</h2>
        <div className="grid gap-4 md:grid-cols-4">
          {SIDEBAR_COLORS.map((color) => (
            <button
              key={color.id}
              onClick={() => setSidebarColor(color.id)}
              className={`p-4 rounded-lg border transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 dark:focus:ring-blue-400 ${
                sidebarColor === color.id
                  ? 'border-blue-500 bg-blue-50 dark:border-blue-400 dark:bg-blue-900/30'
                  : 'border-gray-200 hover:border-blue-300 dark:border-slate-700 dark:hover:border-blue-500'
              }`}
            >
              <div className="flex flex-col items-center space-y-3">
                <span className={`w-10 h-10 rounded-full ${color.sample}`}></span>
                <span className="text-sm font-medium">{color.label}</span>
                {sidebarColor === color.id && <i className="fas fa-check text-blue-500 dark:text-blue-300"></i>}
              </div>
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}

export default Settings
