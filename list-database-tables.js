/**
 * Script para listar todas las tablas de la base de datos Luna
 */

const mysql = require('mysql2/promise');

async function listTables() {
  console.log('🔍 Consultando tablas en la base de datos Luna...\n');

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

    // Consultar tablas
    const [tables] = await connection.query('SHOW TABLES');

    console.log('📋 Tablas encontradas en la base de datos Luna:\n');

    if (tables.length === 0) {
      console.log('❌ No se encontraron tablas en la base de datos');
    } else {
      tables.forEach((table, index) => {
        const tableName = Object.values(table)[0];
        console.log(`${index + 1}. ${tableName}`);
      });
    }

    // Consultar estructura de cada tabla
    for (const table of tables) {
      const tableName = Object.values(table)[0];
      console.log(`\n📊 Estructura de la tabla: ${tableName}`);

      try {
        const [columns] = await connection.query(`DESCRIBE ${tableName}`);
        console.log('   Columnas:');
        columns.forEach(col => {
          console.log(`     - ${col.Field}: ${col.Type} ${col.Null === 'NO' ? 'NOT NULL' : 'NULL'} ${col.Key ? `(Key: ${col.Key})` : ''}`);
        });
      } catch (error) {
        console.log(`     ❌ Error consultando estructura: ${error.message}`);
      }
    }

    await connection.end();
    console.log('\n✅ Consulta completada');

  } catch (error) {
    console.error('❌ Error conectando a la base de datos:', error.message);
    console.log('💡 Verifica que XAMPP esté corriendo y MySQL esté iniciado');
  }
}

listTables();
