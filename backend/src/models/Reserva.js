const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/database');

const Reserva = sequelize.define('Reserva', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  salaId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Salas',
      key: 'id'
    }
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'Users',
      key: 'id'
    }
  },
  fechaReserva: {
    type: DataTypes.DATEONLY,
    allowNull: false,
    validate: {
      isDate: true,
      isAfter: new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString().split('T')[0] // No fechas pasadas
    }
  },
  horaInicio: {
    type: DataTypes.TIME,
    allowNull: false
  },
  horaFin: {
    type: DataTypes.TIME,
    allowNull: false
  },
  proposito: {
    type: DataTypes.STRING(300),
    allowNull: false,
    validate: {
      notEmpty: true,
      len: [5, 300]
    }
  },
  participantes: {
    type: DataTypes.INTEGER,
    allowNull: true,
    defaultValue: 1,
    validate: {
      min: 1,
      max: 50
    }
  },
  observaciones: {
    type: DataTypes.STRING(500),
    allowNull: true
  },
  estado: {
    type: DataTypes.STRING(20),
    allowNull: false,
    defaultValue: 'activa',
    validate: {
      isIn: [['activa', 'cancelada', 'completada']]
    }
  }
}, {
  tableName: 'Reservas',
  timestamps: true,
  createdAt: 'createdAt',
  updatedAt: 'updatedAt',
  validate: {
    horaFinMayorQueInicio() {
      if (this.horaFin <= this.horaInicio) {
        throw new Error('La hora de fin debe ser mayor que la hora de inicio');
      }
    }
  }
});

module.exports = Reserva;
