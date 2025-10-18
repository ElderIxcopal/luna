/**
 * Script para consultar la estructura de la tabla costos1
 */

const mysql = require('mysql2/promise');

async function checkCostos1Table() {
  console.log('🔍 Consultando estructura de la tabla costos1...\n');

  try {
    // Conectar a MySQL
    const connection = await mysql.createConnection({
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      database: 'luna'
    });

    console.log('✅ Conexión establecida');

    // Verificar si la tabla costos1 existe
    const [tables] = await connection.query('SHOW TABLES LIKE "costos1"');

    if (tables.length === 0) {
      console.log('❌ La tabla costos1 no existe en la base de datos');
      console.log('💡 Necesitarás crear la tabla costos1 primero');
    } else {
      console.log('✅ Tabla costos1 encontrada');

      // Consultar estructura de la tabla costos1
      console.log('\n📊 Estructura de la tabla costos1:');
      const [columns] = await connection.query('DESCRIBE costos1');

      columns.forEach(col => {
        console.log(`   ${col.Field}: ${col.Type} ${col.Null === 'NO' ? 'NOT NULL' : 'NULL'} ${col.Key ? `(Key: ${col.Key})` : ''} ${col.Default ? `(Default: ${col.Default})` : ''}`);
      });

      // Consultar datos de ejemplo
      console.log('\n📋 Datos de ejemplo en costos1:');
      const [data] = await connection.query('SELECT * FROM costos1 LIMIT 5');

      if (data.length === 0) {
        console.log('   (Tabla vacía)');
      } else {
        data.forEach((row, index) => {
          console.log(`   ${index + 1}.`, row);
        });
      }
    }

    await connection.end();
    console.log('\n✅ Consulta completada');

  } catch (error) {
    console.error('❌ Error conectando a la base de datos:', error.message);
    console.log('💡 Verifica que XAMPP esté corriendo y MySQL esté iniciado');
  }
}

checkCostos1Table();
