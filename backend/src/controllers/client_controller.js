const ClientServices = require('../services/client_services');

const checkClients = async(req, res) => {
    res.json({
        clients: await ClientServices.checkClients()
    });
}

const saveClient = async(req, res) => {
    console.log(req.body);
    res.json({
        client: await ClientServices.saveClients(req.body)
    });
}

const deleteClient = async(req, res) => {
    res.json({
        client: await ClientServices.deleteClients(req.params.id)
    });
}

const updateClient = async(req, res) => {
    res.json({
        client: await ClientServices.updateClients(req.body)
    });
}

const loginClient = async(req, res, next) => {

    var client_response = await ClientServices.loginClients(req.params.email, req.params.password);

    if(!client_response.length){
        res.status(404).send('User not found');
    }
    else{
        res.json(await ClientServices.loginClients(req.params.email, req.params.password));
    }
}

module.exports = { checkClients, saveClient, deleteClient, updateClient, loginClient }