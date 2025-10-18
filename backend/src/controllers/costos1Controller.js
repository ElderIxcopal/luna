// Controlador para gestión de códigos geográficos (costos1)
// Gestión de códigos de ubicación y departamentos

// Listar todos los códigos geográficos
exports.getCostos1 = async (req, res) => {
  try {
    console.log('🔄 Ejecutando getCostos1...');

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    console.log('✅ Conexión establecida');

    // Consulta simple para obtener todos los códigos
    const [costos1] = await connection.query(
      'SELECT id, codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, usuarioId, created_at, updated_at FROM costos1 ORDER BY codigo ASC'
    );

    console.log('✅ Consulta ejecutada, registros encontrados:', costos1.length);

    await connection.end();

    res.json(costos1);

  } catch (error) {
    console.error('❌ Error en getCostos1:', error.message);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor',
      error: error.message
    });
  }
};

// Crear nuevo código geográfico
exports.createCosto1 = async (req, res) => {
  try {
    const { codigo, nombre, nombre2, nombre3, desde, hasta, comentarios } = req.body;

    // Validar campos requeridos
    if (!codigo || !nombre || !comentarios) {
      return res.status(400).json({
        success: false,
        message: 'Faltan campos requeridos: codigo, nombre, comentarios'
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

    // Crear código geográfico
    const [result] = await connection.query(
      'INSERT INTO costos1 (codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, usuarioId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, req.user.id]
    );

    // Obtener código creado
    const [newCosto1] = await connection.query(
      'SELECT id, codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, usuarioId, created_at, updated_at FROM costos1 WHERE id = ?',
      [result.insertId]
    );

    await connection.end();

    res.status(201).json({
      success: true,
      message: 'Código geográfico registrado exitosamente',
      costo1: newCosto1[0]
    });

  } catch (error) {
    console.error('Error al crear código geográfico:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Actualizar código geográfico existente
exports.updateCosto1 = async (req, res) => {
  try {
    const { id } = req.params;
    const { codigo, nombre, nombre2, nombre3, desde, hasta, comentarios } = req.body;

    // Conexión directa a MySQL
    const mysql = require('mysql2/promise');
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: process.env.DB_PORT || 3306,
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'luna'
    });

    // Verificar si el código existe
    const [existingCosto1] = await connection.query(
      'SELECT id FROM costos1 WHERE id = ?',
      [id]
    );

    if (existingCosto1.length === 0) {
      await connection.end();
      return res.status(404).json({
        success: false,
        message: 'Código geográfico no encontrado'
      });
    }

    // Construir consulta dinámica
    let updateFields = [];
    let params = [];

    if (codigo) {
      updateFields.push('codigo = ?');
      params.push(codigo);
    }

    if (nombre !== undefined) {
      updateFields.push('nombre = ?');
      params.push(nombre);
    }

    if (nombre2 !== undefined) {
      updateFields.push('nombre2 = ?');
      params.push(nombre2);
    }

    if (nombre3 !== undefined) {
      updateFields.push('nombre3 = ?');
      params.push(nombre3);
    }

    if (desde !== undefined) {
      updateFields.push('desde = ?');
      params.push(desde);
    }

    if (hasta !== undefined) {
      updateFields.push('hasta = ?');
      params.push(hasta);
    }

    if (comentarios !== undefined) {
      updateFields.push('comentarios = ?');
      params.push(comentarios);
    }

    if (updateFields.length === 0) {
      await connection.end();
      return res.status(400).json({
        success: false,
        message: 'No se proporcionaron campos para actualizar'
      });
    }

    params.push(id);

    // Ejecutar actualización
    const [result] = await connection.query(
      `UPDATE costos1 SET ${updateFields.join(', ')} WHERE id = ?`,
      params
    );

    // Obtener código actualizado
    const [updatedCosto1] = await connection.query(
      'SELECT id, codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, usuarioId, created_at, updated_at FROM costos1 WHERE id = ?',
      [id]
    );

    await connection.end();

    res.json({
      success: true,
      message: 'Código geográfico actualizado exitosamente',
      costo1: updatedCosto1[0]
    });

  } catch (error) {
    console.error('Error al actualizar código geográfico:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Eliminar código geográfico (soft delete - no elimina físicamente)
exports.deleteCosto1 = async (req, res) => {
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

    // Verificar si el código existe
    const [existingCosto1] = await connection.query(
      'SELECT id FROM costos1 WHERE id = ?',
      [id]
    );

    if (existingCosto1.length === 0) {
      await connection.end();
      return res.status(404).json({
        success: false,
        message: 'Código geográfico no encontrado'
      });
    }

    // Hacer soft delete (marcar como eliminado)
    await connection.query(
      'UPDATE costos1 SET updated_at = NOW() WHERE id = ?',
      [id]
    );

    await connection.end();

    res.json({
      success: true,
      message: 'Código geográfico eliminado correctamente'
    });

  } catch (error) {
    console.error('Error al eliminar código geográfico:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};

// Obtener código geográfico por ID
exports.getCosto1ById = async (req, res) => {
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

    // Buscar código por ID
    const [costos1] = await connection.query(
      'SELECT id, codigo, nombre, nombre2, nombre3, desde, hasta, comentarios, usuarioId, created_at, updated_at FROM costos1 WHERE id = ?',
      [id]
    );

    await connection.end();

    if (costos1.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Código geográfico no encontrado'
      });
    }

    res.json({
      success: true,
      costo1: costos1[0]
    });

  } catch (error) {
    console.error('Error obteniendo código geográfico:', error);
    res.status(500).json({
      success: false,
      message: 'Error interno del servidor'
    });
  }
};
