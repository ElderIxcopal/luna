import React, { useState } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Sidebar from './components/Sidebar'
import Dashboard from './components/Dashboard'
import UsersManager from './components/UsersManager'
import RoomsManager from './components/RoomsManager'
import Settings from './components/Settings'
import Costos1Manager from './components/Costos1Manager'
import TestCostos1 from './components/TestCostos1'
import Login from './components/Login'
import { AuthProvider, useAuth } from './contexts/AuthContext'
import { ThemeProvider, useTheme } from './contexts/ThemeContext'

function AppContent() {
  const { isAuthenticated, user, logout } = useAuth()
  const { theme } = useTheme()
  const [currentPage, setCurrentPage] = useState('dashboard')

  const handleLogout = () => {
    logout()
    setCurrentPage('dashboard')
  }

  if (!isAuthenticated) {
    return <Login />
  }

  return (
    <div className={`flex h-screen ${theme === 'dark' ? 'bg-gray-900 text-gray-100' : 'bg-gray-100 text-gray-900'}`}>
      <Sidebar currentPage={currentPage} setCurrentPage={setCurrentPage} onLogout={handleLogout} user={user} />

      <main className="flex-1 overflow-auto">
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/users" element={<UsersManager />} />
          <Route path="/rooms" element={<RoomsManager />} />
          <Route path="/costos1" element={<Costos1Manager />} />
          <Route path="/test-costos1" element={<TestCostos1 />} />
          <Route path="/settings" element={<Settings />} />
        </Routes>
      </main>
    </div>
  )
}

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <Router>
          <AppContent />
        </Router>
      </AuthProvider>
    </ThemeProvider>
  )
}

export default App
