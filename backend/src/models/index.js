// Modelos disponibles (sin relaciones Sequelize ya que usamos consultas SQL directas)
const User = require('./User');
const Sala = require('./Sala');
const Reserva = require('./Reserva');

module.exports = {
  User,
  Sala,
  Reserva
};
