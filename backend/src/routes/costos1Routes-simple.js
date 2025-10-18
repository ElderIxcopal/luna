// Rutas simplificadas para costos1 (test)
const express = require("express");
const router = express.Router();
const {
  getCostos1,
  createCosto1,
  updateCosto1,
  deleteCosto1,
  getCosto1ById
} = require("../controllers/costos1Controller-simple");
const { verifyToken, verifyAdmin, verifyOwnerOrAdmin } = require("../middleware/authMiddleware");

// Rutas protegidas por JWT
router.get("/", verifyToken, getCostos1); // Listar costos1 con paginación y filtros
router.get("/:id", verifyToken, verifyOwnerOrAdmin, getCosto1ById); // Obtener costo1 por ID
router.post("/", verifyToken, verifyAdmin, createCosto1); // Crear costo1 (solo admin)
router.put("/:id", verifyToken, verifyOwnerOrAdmin, updateCosto1); // Actualizar costo1
router.delete("/:id", verifyToken, verifyAdmin, deleteCosto1); // Soft delete (solo admin)

module.exports = router;
