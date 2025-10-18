// Obtener todas las salas activas
const getSalas = async (req, res) => {
  try {
    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    // Obtener salas activas
    const [salas] = await connection.execute(
      'SELECT id, nombre, descripcion, capacidad, ubicacion, estado, createdAt FROM Salas ORDER BY nombre ASC'
    );

    await connection.end();

    res.json({
      success: true,
      salas: salas
    });

  } catch (error) {
    console.error('Error obteniendo salas:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Obtener sala por ID
const getSalaById = async (req, res) => {
  try {
    const { id } = req.params;

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    // Obtener sala por ID
    const [salas] = await connection.execute(
      'SELECT id, nombre, descripcion, capacidad, ubicacion, estado, createdAt FROM Salas WHERE id = ?',
      [id]
    );

    if (salas.length === 0) {
      await connection.end();
      return res.status(404).json({
        success: false,
        message: 'Sala no encontrada'
      });
    }

    await connection.end();

    res.json({
      success: true,
      sala: salas[0]
    });

  } catch (error) {
    console.error('Error obteniendo sala:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Verificar disponibilidad de sala
const verificarDisponibilidad = async (req, res) => {
  try {
    const { salaId, fecha, horaInicio, horaFin } = req.query;

    if (!salaId || !fecha || !horaInicio || !horaFin) {
      return res.status(400).json({
        success: false,
        message: 'Faltan parámetros: salaId, fecha, horaInicio, horaFin'
      });
    }

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    // Verificar conflictos de horario
    const [conflictos] = await connection.execute(`
      SELECT id, horaInicio, horaFin, usuarioId FROM Reservas
      WHERE salaId = ? AND fechaReserva = ? AND estado = 'confirmada'
      AND ((horaInicio < ? AND horaFin > ?) OR (horaInicio < ? AND horaFin > ?))
    `, [salaId, fecha, horaFin, horaInicio, horaInicio, horaFin]);

    await connection.end();

    res.json({
      success: true,
      disponible: conflictos.length === 0,
      conflictos: conflictos.length,
      reservasConflicto: conflictos
    });

  } catch (error) {
    console.error('Error verificando disponibilidad:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

module.exports = {
  getSalas,
  getSalaById,
  verificarDisponibilidad
};
