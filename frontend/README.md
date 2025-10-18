# Luna - Sistema de Gestión (React + Tailwind CSS)

Aplicación frontend desarrollada con React, Vite, Tailwind CSS y comunicación con backend Express.

## 🚀 Características

- **React 18** con hooks modernos
- **Tailwind CSS** para estilos utility-first
- **Vite** como bundler rápido
- **React Router** para navegación SPA
- **Axios** para comunicación API
- **Context API** para manejo de estado global
- **Componentes modulares** y reutilizables

## 📁 Estructura del Proyecto

```
frontend/
├── public/                 # Archivos estáticos
├── src/
│   ├── components/         # Componentes React
│   │   ├── Login.jsx       # Página de login
│   │   ├── Sidebar.jsx     # Barra lateral de navegación
│   │   ├── Dashboard.jsx   # Dashboard principal
│   │   ├── UsersManager.jsx # Gestión de usuarios
│   │   ├── RoomsManager.jsx # Gestión de salas
│   │   └── Settings.jsx    # Configuración
│   ├── contexts/           # Context providers
│   │   └── AuthContext.jsx # Manejo de autenticación
│   ├── services/           # Servicios API
│   │   └── api.js          # Cliente HTTP y servicios
│   ├── hooks/              # Custom hooks (futuro)
│   ├── utils/              # Utilidades (futuro)
│   ├── App.jsx             # Componente raíz
│   ├── main.jsx            # Punto de entrada
│   └── index.css           # Estilos globales + Tailwind
├── index.html              # HTML principal
├── package.json            # Dependencias
├── tailwind.config.js      # Configuración Tailwind
├── postcss.config.js       # Configuración PostCSS
└── vite.config.js          # Configuración Vite
```

## 🛠 Instalación y Uso

### Prerrequisitos
- Node.js 16+
- Backend Express corriendo en puerto 4000

### Instalación

```bash
# Instalar dependencias
npm install

# Iniciar servidor de desarrollo
npm run dev

# Construir para producción
npm run build
```

### Uso

1. **Iniciar el servidor de desarrollo:**
   ```bash
   npm run dev
   ```

2. **Abrir el navegador** en `http://localhost:3000`

3. **Credenciales de prueba:**
   - **Admin:** `admin@test.com` / `admin123`
   - **Usuario:** `user@test.com` / `user123`

## 🔧 Características Técnicas

### Tecnologías Utilizadas
- **React 18** - Biblioteca de interfaz de usuario
- **Vite** - Bundler y servidor de desarrollo
- **Tailwind CSS** - Framework CSS utility-first
- **React Router DOM** - Enrutamiento SPA
- **Axios** - Cliente HTTP
- **Context API** - Manejo de estado global
- **PostCSS** - Procesador CSS

### Arquitectura

#### Estado Global
- **AuthContext** - Manejo de autenticación y usuario actual
- Estados locales en componentes funcionales

#### Comunicación API
- **API Service Layer** - Abstracción de llamadas HTTP
- Interceptors para manejo de tokens y errores
- Endpoints RESTful hacia backend Express

#### Estilos
- **Tailwind CSS** - Estilos utility-first
- **Componentes CSS** - Estilos específicos en archivos separados
- **Responsive Design** - Diseño móvil primero

## 🎨 Estilos y Diseño

### Sistema de Diseño
- **Colores primarios:** Azul (#3b82f6) e Índigo (#6366f1)
- **Tipografía:** Inter (fallback a system-ui)
- **Espaciado consistente** basado en escala 4px
- **Bordes redondeados** para elementos interactivos

### Componentes Base
```css
.btn           /* Botones base */
.btn-primary   /* Botones principales */
.btn-outline   /* Botones secundarios */
.btn-danger    /* Botones de eliminación */
.card          /* Contenedores de contenido */
.input         /* Campos de formulario */
```

## 🔒 Seguridad

- **Autenticación JWT** vía backend
- **Protección CSRF** automática
- **Validación de formularios** en frontend
- **Manejo seguro de tokens** en localStorage

## 🚧 Próximas Mejoras

- [ ] Implementar gestión de salas (RoomsManager)
- [ ] Agregar sistema de reservas
- [ ] Implementar notificaciones en tiempo real
- [ ] Agregar tests unitarios e integración
- [ ] Implementar PWA (Progressive Web App)
- [ ] Agregar modo oscuro
- [ ] Internacionalización (i18n)

## 🔄 Migración desde Vanilla JS

Este proyecto reemplaza la implementación anterior con HTML/CSS/JS vanilla por una arquitectura moderna con React:

### Ventajas de la Nueva Arquitectura
- ✅ **Componentes reutilizables**
- ✅ **Estado reactivo automático**
- ✅ **Mejor manejo de errores**
- ✅ **Código más mantenible**
- ✅ **Mejor experiencia de desarrollador**
- ✅ **Performance mejorada**

### Archivos Migrados
- `UsersManager.js` → `UsersManager.jsx` (componente React)
- Estilos CSS → Tailwind CSS utility classes
- Lógica de autenticación → AuthContext
- Comunicación API → servicio centralizado

## 📚 Recursos

- [React Documentation](https://react.dev)
- [Tailwind CSS](https://tailwindcss.com)
- [Vite Guide](https://vitejs.dev)
- [React Router](https://reactrouter.com)

---

**¡La aplicación está lista para usar con tecnologías modernas!** 🎉
