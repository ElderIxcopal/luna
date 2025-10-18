const express = require('express');
const router = express.Router();
const { 
  crearReserva, 
  getReservasUsuario, 
  getAllReservas, 
  cancelarReserva 
} = require('../controllers/reservaController');
const { authenticateToken, requireRole } = require('../middleware/authMiddleware');

// Todas las rutas requieren autenticación
router.use(authenticateToken);

// POST /reservas - Crear nueva reserva
router.post('/', crearReserva);

// GET /reservas/mis-reservas - Obtener reservas del usuario actual
router.get('/mis-reservas', getReservasUsuario);

// GET /reservas - Obtener todas las reservas (solo admin)
router.get('/', requireRole('admin'), getAllReservas);

// PATCH /reservas/:id/cancelar - Cancelar reserva
router.patch('/:id/cancelar', cancelarReserva);

module.exports = router;
