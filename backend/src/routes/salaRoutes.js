const express = require('express');
const router = express.Router();
const { getSalas, getSalaById, verificarDisponibilidad } = require('../controllers/salaController');
const { authenticateToken } = require('../middleware/authMiddleware');

// Todas las rutas requieren autenticación
router.use(authenticateToken);

// GET /salas - Obtener todas las salas
router.get('/', getSalas);

// GET /salas/disponibilidad - Verificar disponibilidad
router.get('/disponibilidad', verificarDisponibilidad);

// GET /salas/:id - Obtener sala por ID
router.get('/:id', getSalaById);

module.exports = router;
