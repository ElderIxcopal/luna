// Crear nueva reserva
const crearReserva = async (req, res) => {
  try {
    const { salaId, fechaReserva, horaInicio, horaFin, descripcion } = req.body;
    const usuarioId = req.user.id;

    // Validaciones básicas
    if (!salaId || !fechaReserva || !horaInicio || !horaFin) {
      return res.status(400).json({
        success: false,
        message: 'Faltan campos requeridos: salaId, fechaReserva, horaInicio, horaFin'
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

    // Verificar que la sala existe y está disponible
    const [salas] = await connection.execute(
      'SELECT id, nombre, capacidad, estado FROM Salas WHERE id = ? AND estado = "disponible"',
      [salaId]
    );

    if (salas.length === 0) {
      await connection.end();
      return res.status(404).json({
        success: false,
        message: 'Sala no encontrada o no disponible'
      });
    }

    const sala = salas[0];

    // Verificar conflictos de horario
    const [conflictos] = await connection.execute(`
      SELECT id, horaInicio, horaFin FROM Reservas
      WHERE salaId = ? AND fechaReserva = ? AND estado != 'cancelada'
      AND ((horaInicio < ? AND horaFin > ?) OR (horaInicio < ? AND horaFin > ?))
    `, [salaId, fechaReserva, horaFin, horaInicio, horaInicio, horaFin]);

    if (conflictos.length > 0) {
      await connection.end();
      return res.status(409).json({
        success: false,
        message: 'La sala no está disponible en el horario solicitado',
        conflicto: conflictos[0]
      });
    }

    // Crear reserva
    const [result] = await connection.execute(`
      INSERT INTO Reservas (salaId, usuarioId, fechaReserva, horaInicio, horaFin, descripcion, estado)
      VALUES (?, ?, ?, ?, ?, ?, 'pendiente')
    `, [salaId, usuarioId, fechaReserva, horaInicio, horaFin, descripcion]);

    // Obtener reserva creada
    const [reservas] = await connection.execute(`
      SELECT r.id, r.fechaReserva, r.horaInicio, r.horaFin, r.descripcion, r.estado,
             s.nombre as salaNombre, u.email as usuarioEmail
      FROM Reservas r
      JOIN Salas s ON r.salaId = s.id
      JOIN Users u ON r.usuarioId = u.id
      WHERE r.id = ?
    `, [result.insertId]);

    await connection.end();

    res.status(201).json({
      success: true,
      message: 'Reserva creada exitosamente',
      reserva: reservas[0]
    });

  } catch (error) {
    console.error('Error creando reserva:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Obtener reservas del usuario actual
const getReservasUsuario = async (req, res) => {
  try {
    const usuarioId = req.user.id;
    const { estado = 'pendiente' } = req.query;

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    let whereClause = 'WHERE r.usuarioId = ?';
    let params = [usuarioId];

    if (estado !== 'todas') {
      whereClause += ' AND r.estado = ?';
      params.push(estado);
    }

    // Obtener reservas del usuario
    const [reservas] = await connection.execute(`
      SELECT r.id, r.fechaReserva, r.horaInicio, r.horaFin, r.descripcion, r.estado,
             s.nombre as salaNombre, s.capacidad, s.ubicacion
      FROM Reservas r
      JOIN Salas s ON r.salaId = s.id
      ${whereClause}
      ORDER BY r.fechaReserva DESC, r.horaInicio DESC
    `, params);

    await connection.end();

    res.json({
      success: true,
      reservas: reservas
    });

  } catch (error) {
    console.error('Error obteniendo reservas del usuario:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Obtener todas las reservas (solo admin)
const getAllReservas = async (req, res) => {
  try {
    const { fecha, salaId, estado = 'pendiente' } = req.query;

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    let whereClause = 'WHERE 1=1';
    let params = [];

    if (estado !== 'todas') {
      whereClause += ' AND r.estado = ?';
      params.push(estado);
    }

    if (fecha) {
      whereClause += ' AND r.fechaReserva = ?';
      params.push(fecha);
    }

    if (salaId) {
      whereClause += ' AND r.salaId = ?';
      params.push(parseInt(salaId));
    }

    // Obtener todas las reservas
    const [reservas] = await connection.execute(`
      SELECT r.id, r.fechaReserva, r.horaInicio, r.horaFin, r.descripcion, r.estado,
             s.nombre as salaNombre, s.capacidad, s.ubicacion,
             u.email as usuarioEmail
      FROM Reservas r
      JOIN Salas s ON r.salaId = s.id
      JOIN Users u ON r.usuarioId = u.id
      ${whereClause}
      ORDER BY r.fechaReserva ASC, r.horaInicio ASC
    `, params);

    await connection.end();

    res.json({
      success: true,
      reservas: reservas
    });

  } catch (error) {
    console.error('Error obteniendo todas las reservas:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Cancelar reserva
const cancelarReserva = async (req, res) => {
  try {
    const { id } = req.params;
    const usuarioId = req.user.id;
    const usuarioRole = req.user.role;

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    // Verificar que la reserva existe
    const [reservas] = await connection.execute(
      'SELECT id, usuarioId, estado FROM Reservas WHERE id = ?',
      [id]
    );

    if (reservas.length === 0) {
      await connection.end();
      return res.status(404).json({
        success: false,
        message: 'Reserva no encontrada'
      });
    }

    const reserva = reservas[0];

    // Verificar permisos (dueño de la reserva o admin)
    if (reserva.usuarioId !== usuarioId && usuarioRole !== 'admin') {
      await connection.end();
      return res.status(403).json({
        success: false,
        message: 'No tienes permisos para cancelar esta reserva'
      });
    }

    // Verificar que la reserva esté pendiente
    if (reserva.estado !== 'pendiente') {
      await connection.end();
      return res.status(400).json({
        success: false,
        message: 'Solo se pueden cancelar reservas pendientes'
      });
    }

    // Cancelar reserva
    await connection.execute(
      'UPDATE Reservas SET estado = "cancelada" WHERE id = ?',
      [id]
    );

    await connection.end();

    res.json({
      success: true,
      message: 'Reserva cancelada exitosamente'
    });

  } catch (error) {
    console.error('Error cancelando reserva:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

module.exports = {
  crearReserva,
  getReservasUsuario,
  getAllReservas,
  cancelarReserva
};
