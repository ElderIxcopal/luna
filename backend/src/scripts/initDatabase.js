require('dotenv').config();
const { sequelize, syncDatabase } = require('../config/database');
const User = require('../models/User');
const bcrypt = require('bcryptjs');

// Script para inicializar la base de datos con datos de prueba
const initializeDatabase = async () => {
  try {
    console.log('🔄 Iniciando inicialización de la base de datos...');

    // Conectar a la base de datos
    await sequelize.authenticate();
    console.log('✅ Conexión a SQL Server establecida');

    // Sincronizar modelos (crear tablas si no existen)
    await syncDatabase(false); // false = no forzar recreación
    console.log('✅ Tablas sincronizadas');

    // Verificar si ya existen usuarios
    const userCount = await User.count();
    
    if (userCount === 0) {
      console.log('📝 Creando usuarios de prueba...');
      
      // Crear usuario administrador
      const adminPassword = await bcrypt.hash('admin123', 10);
      await User.create({
        email: 'admin@test.com',
        password: adminPassword,
        role: 'admin'
      });

      // Crear usuario normal
      const userPassword = await bcrypt.hash('user123', 10);
      await User.create({
        email: 'user@test.com',
        password: userPassword,
        role: 'user'
      });

      console.log('✅ Usuarios de prueba creados:');
      console.log('   👤 Admin: admin@test.com / admin123');
      console.log('   👤 User: user@test.com / user123');
    } else {
      console.log(`ℹ️  Ya existen ${userCount} usuarios en la base de datos`);
    }

    console.log('🎉 Base de datos inicializada correctamente');
    
  } catch (error) {
    console.error('❌ Error al inicializar la base de datos:', error);
    throw error;
  } finally {
    await sequelize.close();
  }
};

// Ejecutar si se llama directamente
if (require.main === module) {
  initializeDatabase()
    .then(() => {
      console.log('✅ Proceso completado');
      process.exit(0);
    })
    .catch((error) => {
      console.error('❌ Error:', error.message);
      process.exit(1);
    });
}

module.exports = initializeDatabase;
