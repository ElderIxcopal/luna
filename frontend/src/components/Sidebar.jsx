import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import { useTheme } from '../contexts/ThemeContext'

const COLOR_STYLES = {
  blue: {
    container: 'bg-white text-gray-800 dark:bg-slate-900 dark:text-slate-100',
    title: 'text-blue-600 dark:text-blue-300',
    subtitle: 'text-gray-600 dark:text-gray-400',
    badge: 'bg-blue-50 text-blue-700 dark:bg-blue-900/30 dark:text-blue-200',
    linkActive: 'bg-blue-100 text-blue-700 border-r-2 border-blue-600 dark:bg-blue-900/40 dark:text-blue-200 dark:border-blue-400',
    linkDefault: 'text-gray-700 dark:text-gray-200 hover:bg-blue-50 dark:hover:bg-blue-900/30'
  },
  emerald: {
    container: 'bg-white text-gray-800 dark:bg-slate-900 dark:text-slate-100',
    title: 'text-emerald-600 dark:text-emerald-300',
    subtitle: 'text-gray-600 dark:text-gray-400',
    badge: 'bg-emerald-50 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-200',
    linkActive: 'bg-emerald-100 text-emerald-700 border-r-2 border-emerald-600 dark:bg-emerald-900/40 dark:text-emerald-200 dark:border-emerald-400',
    linkDefault: 'text-gray-700 dark:text-gray-200 hover:bg-emerald-50 dark:hover:bg-emerald-900/30'
  },
  violet: {
    container: 'bg-white text-gray-800 dark:bg-slate-900 dark:text-slate-100',
    title: 'text-violet-600 dark:text-violet-300',
    subtitle: 'text-gray-600 dark:text-gray-400',
    badge: 'bg-violet-50 text-violet-700 dark:bg-violet-900/30 dark:text-violet-200',
    linkActive: 'bg-violet-100 text-violet-700 border-r-2 border-violet-600 dark:bg-violet-900/40 dark:text-violet-200 dark:border-violet-400',
    linkDefault: 'text-gray-700 dark:text-gray-200 hover:bg-violet-50 dark:hover:bg-violet-900/30'
  },
  amber: {
    container: 'bg-white text-gray-800 dark:bg-slate-900 dark:text-slate-100',
    title: 'text-amber-600 dark:text-amber-300',
    subtitle: 'text-gray-600 dark:text-gray-400',
    badge: 'bg-amber-50 text-amber-700 dark:bg-amber-900/30 dark:text-amber-200',
    linkActive: 'bg-amber-100 text-amber-700 border-r-2 border-amber-600 dark:bg-amber-900/40 dark:text-amber-200 dark:border-amber-400',
    linkDefault: 'text-gray-700 dark:text-gray-200 hover:bg-amber-50 dark:hover:bg-amber-900/30'
  }
}

const Sidebar = ({ currentPage, setCurrentPage, onLogout, user }) => {
  const location = useLocation()
  const { sidebarColor } = useTheme()
  const palette = COLOR_STYLES[sidebarColor] || COLOR_STYLES.blue

  const menuItems = [
    {
      id: 'dashboard',
      label: 'Dashboard',
      icon: 'fas fa-tachometer-alt',
      path: '/dashboard'
    },
    {
      id: 'users',
      label: 'Usuarios',
      icon: 'fas fa-users',
      path: '/users'
    },
    {
      id: 'rooms',
      label: 'Salas',
      icon: 'fas fa-door-open',
      path: '/rooms'
    },
    {
      id: 'costos1',
      label: 'Costos',
      icon: 'fas fa-dollar-sign',
      path: '/costos1'
    },
    {
      id: 'test-costos1',
      label: 'Test Costos1',
      icon: 'fas fa-vial',
      path: '/test-costos1'
    },
    {
      id: 'settings',
      label: 'Configuración',
      icon: 'fas fa-cog',
      path: '/settings'
    }
  ]

  return (
    <div className={`w-64 shadow-lg ${palette.container}`}>
      <div className="p-6">
        <h1 className={`text-2xl font-bold ${palette.title}`}>Luna</h1>
        <p className={`text-sm mt-1 ${palette.subtitle}`}>Sistema de Gestión</p>
        {user && (
          <div className="mt-4 p-3 bg-gray-50 dark:bg-white/5 rounded-lg">
            <p className="text-sm font-medium text-gray-900 dark:text-gray-100">{user.email}</p>
            <p className="text-xs text-gray-600 dark:text-gray-400 capitalize">{user.role}</p>
          </div>
        )}
      </div>

      <nav className="mt-8">
        <div className="px-4 space-y-2">
          {menuItems.map((item) => (
            <Link
              key={item.id}
              to={item.path}
              className={`flex items-center px-4 py-3 text-sm font-medium rounded-lg transition-colors duration-200 ${
                location.pathname === item.path ? palette.linkActive : palette.linkDefault
              }`}
            >
              <i className={`${item.icon} mr-3`}></i>
              {item.label}
            </Link>
          ))}
        </div>
      </nav>

      <div className="absolute bottom-0 w-64 p-4 border-t border-gray-200 dark:border-slate-700">
        <button
          onClick={onLogout}
          className="flex items-center w-full px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-200 rounded-lg hover:bg-red-50 hover:text-red-700 dark:hover:bg-red-900/30 dark:hover:text-red-300 transition-colors duration-200"
        >
          <i className="fas fa-sign-out-alt mr-3"></i>
          Cerrar Sesión
        </button>
      </div>
    </div>
  )
}

export default Sidebar
