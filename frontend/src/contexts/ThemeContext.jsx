import React, { createContext, useContext, useEffect, useMemo, useState } from 'react'

const ThemeContext = createContext()

const THEME_KEY = 'luna-theme'
const SIDEBAR_KEY = 'luna-sidebar-color'

export const ThemeProvider = ({ children }) => {
  const [theme, setTheme] = useState(() => localStorage.getItem(THEME_KEY) || 'light')
  const [sidebarColor, setSidebarColor] = useState(() => localStorage.getItem(SIDEBAR_KEY) || 'blue')

  useEffect(() => {
    localStorage.setItem(THEME_KEY, theme)
  }, [theme])

  useEffect(() => {
    localStorage.setItem(SIDEBAR_KEY, sidebarColor)
  }, [sidebarColor])

  useEffect(() => {
    if (theme === 'dark') {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }, [theme])

  const value = useMemo(
    () => ({
      theme,
      setTheme,
      sidebarColor,
      setSidebarColor
    }),
    [theme, sidebarColor]
  )

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>
}

export const useTheme = () => useContext(ThemeContext)
