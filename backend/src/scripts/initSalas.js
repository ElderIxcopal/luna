const { Sala } = require('../models');
const { sequelize } = require('../config/database');

// Script para inicializar salas de prueba
const initializeSalas = async () => {
  try {
    console.log('🔄 Iniciando inserción de salas de prueba...');

    // Conectar a la base de datos
    await sequelize.authenticate();
    console.log('✅ Conexión a SQL Server establecida');

    // Verificar si ya existen salas
    const salaCount = await Sala.count();
    
    if (salaCount === 0) {
      console.log('📝 Creando salas de prueba...');
      
      const salas = [
        {
          nombre: 'Sala Ejecutiva',
          capacidad: 12,
          ubicacion: 'Piso 3 - Ala Norte',
          descripcion: 'Sala principal para reuniones ejecutivas',
          equipamiento: 'Proyector 4K, TV 65", Pizarra digital, Sistema de audio'
        },
        {
          nombre: 'Sala de Juntas',
          capacidad: 8,
          ubicacion: 'Piso 2 - Centro',
          descripcion: 'Sala mediana para juntas departamentales',
          equipamiento: 'TV 55", Pizarra blanca, Videoconferencia'
        },
        {
          nombre: 'Sala Creativa',
          capacidad: 6,
          ubicacion: 'Piso 1 - Ala Sur',
          descripcion: 'Espacio colaborativo para brainstorming',
          equipamiento: 'Pizarras móviles, TV táctil, Sillas cómodas'
        },
        {
          nombre: 'Sala de Capacitación',
          capacidad: 20,
          ubicacion: 'Piso 1 - Ala Norte',
          descripcion: 'Aula para entrenamientos y presentaciones',
          equipamiento: 'Proyector, Sistema de audio, Mesas modulares'
        },
        {
          nombre: 'Sala Privada',
          capacidad: 4,
          ubicacion: 'Piso 2 - Ala Este',
          descripcion: 'Reuniones confidenciales y entrevistas',
          equipamiento: 'TV 43", Insonorización, Mesa redonda'
        }
      ];

      await Sala.bulkCreate(salas);

      console.log('✅ Salas de prueba creadas:');
      salas.forEach((sala, index) => {
        console.log(`   🏢 ${index + 1}. ${sala.nombre} (${sala.capacidad} personas)`);
      });
    } else {
      console.log(`ℹ️ Ya existen ${salaCount} salas en la base de datos`);
    }

    console.log('🎉 Inicialización de salas completada');
    
  } catch (error) {
    console.error('❌ Error al inicializar salas:', error);
    throw error;
  } finally {
    await sequelize.close();
  }
};

// Ejecutar si se llama directamente
if (require.main === module) {
  initializeSalas()
    .then(() => {
      console.log('✅ Proceso completado');
      process.exit(0);
    })
    .catch((error) => {
      console.error('❌ Error:', error.message);
      process.exit(1);
    });
}

module.exports = { initializeSalas };
