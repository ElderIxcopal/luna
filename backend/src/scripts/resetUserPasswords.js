const bcrypt = require('bcryptjs');
const mysql = require('mysql2/promise');

const USERS = [
  { email: 'admin@test.com', password: 'admin123' },
  { email: 'user@test.com', password: 'user123' }
];

async function resetUserPasswords() {
  console.log('🔐 Actualizando contraseñas de usuarios semilla...');

  const connection = await mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT ? Number(process.env.DB_PORT) : 3306,
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'luna'
  });

  try {
    for (const user of USERS) {
      const hashed = await bcrypt.hash(user.password, 10);
      const [result] = await connection.execute(
        'UPDATE users SET password = ? WHERE email = ?',
        [hashed, user.email]
      );

      if (result.affectedRows === 0) {
        console.warn(`⚠️  Usuario no encontrado: ${user.email}`);
      } else {
        console.log(`✅ Contraseña actualizada para: ${user.email}`);
      }
    }

    console.log('🎉 Contraseñas actualizadas correctamente.');
  } finally {
    await connection.end();
  }
}

resetUserPasswords().catch((err) => {
  console.error('❌ Error actualizando contraseñas:', err.message);
  process.exit(1);
});
