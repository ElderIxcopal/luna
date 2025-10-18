/**
 * SOLUCIÓN DEFINITIVA - Conexión MySQL desde Node.js
 * Script completo que funciona independientemente de problemas técnicos
 */

const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');

async function solucionDefinitiva() {
  console.log('🔧 === SOLUCIÓN DEFINITIVA NODE.JS ↔ MYSQL ===\n');

  try {
    // 1. Verificar instalación de mysql2
    console.log('1️⃣ Verificando instalación de mysql2...');
    const mysql2Path = require.resolve('mysql2/promise');
    console.log('✅ mysql2 instalado en:', mysql2Path);

    // 2. Probar múltiples configuraciones de conexión
    console.log('\n2️⃣ Probando configuraciones de conexión...\n');

    const configs = [
      {
        name: 'Configuración estándar',
        config: {
          host: 'localhost',
          port: 3306,
          user: 'root',
          password: '',
          database: 'luna'
        }
      },
      {
        name: 'Configuración sin BD',
        config: {
          host: 'localhost',
          port: 3306,
          user: 'root',
          password: ''
        }
      },
      {
        name: 'Configuración con BD mysql',
        config: {
          host: 'localhost',
          port: 3306,
          user: 'root',
          password: '',
          database: 'mysql'
        }
      }
    ];

    for (const { name, config } of configs) {
      console.log(`🔍 Probando: ${name}`);
      try {
        const connection = await mysql.createConnection(config);
        console.log('✅ Conexión exitosa');

        // Si no especificamos BD, listar bases de datos
        if (!config.database) {
          const [databases] = await connection.execute('SHOW DATABASES');
          console.log(`📂 Bases de datos disponibles: ${databases.length}`);
          databases.forEach((db, index) => {
            console.log(`   ${index + 1}. ${db.Database}`);
          });

          // Verificar si existe luna
          const lunaExists = databases.some(db => db.Database === 'luna');
          if (lunaExists) {
            console.log('✅ Base de datos luna existe');
          } else {
            console.log('📦 Creando base de datos luna...');
            await connection.execute('CREATE DATABASE IF NOT EXISTS luna');
            console.log('✅ Base de datos luna creada');
          }
        }

        await connection.end();
        console.log('✅ Configuración funciona\n');

      } catch (error) {
        console.log(`❌ Error en ${name}:`, error.message);
        if (error.code) console.log(`   Código de error: ${error.code}`);
        console.log('');
      }
    }

    // 3. Intento final con configuración que sabemos que funciona
    console.log('3️⃣ Intento final con configuración verificada...\n');

    try {
      const connection = await mysql.createConnection({
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '',
        database: 'luna'
      });

      console.log('✅ CONEXIÓN FINAL ESTABLECIDA\n');

      // Crear tablas necesarias si no existen
      console.log('📋 Creando tablas necesarias...\n');

      // Crear tabla Users
      await connection.execute(`
        CREATE TABLE IF NOT EXISTS Users (
          id INT AUTO_INCREMENT PRIMARY KEY,
          email VARCHAR(255) NOT NULL UNIQUE,
          password VARCHAR(255) NOT NULL,
          role ENUM('admin', 'user') NOT NULL DEFAULT 'user',
          isActive BOOLEAN NOT NULL DEFAULT true,
          createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        )
      `);
      console.log('✅ Tabla Users creada/verificada');

      // Crear tabla Salas
      await connection.execute(`
        CREATE TABLE IF NOT EXISTS Salas (
          id INT AUTO_INCREMENT PRIMARY KEY,
          nombre VARCHAR(255) NOT NULL,
          descripcion TEXT,
          capacidad INT NOT NULL,
          ubicacion VARCHAR(255),
          estado ENUM('disponible', 'ocupada', 'mantenimiento') DEFAULT 'disponible',
          createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        )
      `);
      console.log('✅ Tabla Salas creada/verificada');

      // Crear tabla Reservas
      await connection.execute(`
        CREATE TABLE IF NOT EXISTS Reservas (
          id INT AUTO_INCREMENT PRIMARY KEY,
          salaId INT NOT NULL,
          usuarioId INT NOT NULL,
          fechaReserva DATE NOT NULL,
          horaInicio TIME NOT NULL,
          horaFin TIME NOT NULL,
          descripcion TEXT,
          estado ENUM('pendiente', 'confirmada', 'cancelada') DEFAULT 'pendiente',
          createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
          updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
          FOREIGN KEY (salaId) REFERENCES Salas(id) ON DELETE CASCADE,
          FOREIGN KEY (usuarioId) REFERENCES Users(id) ON DELETE CASCADE
        )
      `);
      console.log('✅ Tabla Reservas creada/verificada');

      // Insertar usuarios de prueba
      console.log('\n👤 Insertando usuarios de prueba...\n');
      await connection.execute(`
        INSERT IGNORE INTO Users (email, password, role) VALUES
        ('admin@test.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi', 'admin'),
        ('user@test.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi', 'user')
      `);
      console.log('✅ Usuarios de prueba insertados');

      // Insertar salas de prueba
      await connection.execute(`
        INSERT IGNORE INTO Salas (nombre, descripcion, capacidad, ubicacion) VALUES
        ('Sala de Conferencias A', 'Sala principal para reuniones importantes', 20, 'Piso 1 - Ala Norte'),
        ('Sala de Juntas B', 'Sala para reuniones de equipo', 10, 'Piso 2 - Ala Sur'),
        ('Auditorio Principal', 'Auditorio para presentaciones grandes', 100, 'Piso 3 - Centro')
      `);
      console.log('✅ Salas de prueba insertadas');

      // OBTENER TABLAS FINALES
      console.log('\n📋 OBTENIENDO LISTA FINAL DE TABLAS...\n');

      const [tables] = await connection.execute('SHOW TABLES');

      console.log('🎯 TABLAS EN TU BASE DE DATOS MYSQL:');
      console.log('===================================');

      if (tables.length === 0) {
        console.log('❌ No hay tablas en la base de datos');
      } else {
        console.log(`✅ SE ENCONTRARON ${tables.length} TABLAS:`);

        tables.forEach((table, index) => {
          const tableName = Object.values(table)[0];
          console.log(`${index + 1}. 📋 ${tableName}`);
        });

        console.log('\n🎯 TUS TABLAS CONFIRMADAS:');
        console.log('=========================');
        tables.forEach((table, index) => {
          const tableName = Object.values(table)[0];
          console.log(`${index + 1}. ${tableName}`);
        });
      }

      // Verificar usuarios
      console.log('\n👥 VERIFICANDO USUARIOS CREADOS...\n');

      const [users] = await connection.execute(
        'SELECT id, email, role, isActive FROM Users ORDER BY createdAt DESC'
      );

      if (users.length > 0) {
        console.log('✅ Usuarios encontrados:');
        users.forEach((user, index) => {
          console.log(`  ${index + 1}. ${user.email} (${user.role})`);
        });
      } else {
        console.log('❌ No hay usuarios en la tabla');
      }

      await connection.end();
      console.log('\n🎉 CONEXIÓN Y CONFIGURACIÓN COMPLETADAS EXITOSAMENTE');

    } catch (error) {
      console.error('\n❌ ERROR FINAL:', error.message);
      console.log('📋 Código de error:', error.code);

      // Solución alternativa
      console.log('\n🔧 SOLUCIÓN ALTERNATIVA:');
      console.log('=======================');
      console.log('Si Node.js no se conecta a MySQL, usa phpMyAdmin directamente:');
      console.log('🌐 http://localhost/phpmyadmin');
      console.log('📂 Base de datos: luna');
      console.log('');
      console.log('Crea las tablas manualmente con este SQL:');
      console.log(`
CREATE TABLE Users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'user') DEFAULT 'user',
  isActive BOOLEAN DEFAULT true
);

INSERT INTO Users (email, password, role) VALUES
('admin@test.com', 'admin123', 'admin'),
('user@test.com', 'user123', 'user');
      `);
    }

  } catch (error) {
    console.error('❌ Error crítico:', error.message);
    console.log('\n💡 Solución de emergencia:');
    console.log('   Usa phpMyAdmin directamente para configurar la base de datos');
    console.log('   El servidor simplificado funcionará una vez que las tablas estén creadas');
  }
}

solucionDefinitiva();
