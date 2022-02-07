const { Router } = require('express');
const { checkClients, saveClient, deleteClient, updateClient, loginClient } = require('../controllers/client_controller');
const router = Router();

router.get('/api/clients', checkClients);
router.post('/api/clients/list', saveClient);
router.delete('/api/clients/delete/:id', deleteClient);
router.put('/api/clients/update', updateClient);

router.get('/api/clients/login/:email&:password', loginClient);

module.exports = router;
