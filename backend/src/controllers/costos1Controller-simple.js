// Controlador simplificado para costos1 (test)
exports.getCostos1 = async (req, res) => {
  try {
    console.log('🎯 Función getCostos1 llamada correctamente');
    res.json({
      message: 'Controlador getCostos1 funcionando',
      timestamp: new Date().toISOString(),
      user: req.user ? req.user.email : 'sin usuario'
    });
  } catch (error) {
    console.error('Error en getCostos1:', error);
    res.status(500).json({ error: error.message });
  }
};

exports.createCosto1 = async (req, res) => {
  try {
    console.log('🎯 Función createCosto1 llamada correctamente');
    res.status(201).json({
      message: 'Controlador createCosto1 funcionando',
      data: req.body
    });
  } catch (error) {
    console.error('Error en createCosto1:', error);
    res.status(500).json({ error: error.message });
  }
};

exports.updateCosto1 = async (req, res) => {
  try {
    console.log('🎯 Función updateCosto1 llamada correctamente');
    res.json({
      message: 'Controlador updateCosto1 funcionando',
      id: req.params.id,
      data: req.body
    });
  } catch (error) {
    console.error('Error en updateCosto1:', error);
    res.status(500).json({ error: error.message });
  }
};

exports.deleteCosto1 = async (req, res) => {
  try {
    console.log('🎯 Función deleteCosto1 llamada correctamente');
    res.json({
      message: 'Controlador deleteCosto1 funcionando',
      id: req.params.id
    });
  } catch (error) {
    console.error('Error en deleteCosto1:', error);
    res.status(500).json({ error: error.message });
  }
};

exports.getCosto1ById = async (req, res) => {
  try {
    console.log('🎯 Función getCosto1ById llamada correctamente');
    res.json({
      message: 'Controlador getCosto1ById funcionando',
      id: req.params.id
    });
  } catch (error) {
    console.error('Error en getCosto1ById:', error);
    res.status(500).json({ error: error.message });
  }
};
