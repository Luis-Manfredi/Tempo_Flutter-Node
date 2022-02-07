const clientModel = require('../models/client_model');

class ClientServices {
    ClientServices() {}

    async checkClients(){
        try {
            return await clientModel.find();
        } catch (error) {
            return error;
        }
    }

    async saveClients(client = new clientModel()){
        try {
            var savedClient;
            await clientModel.create(client).then((value) => {
                savedClient = value;
            });
        } catch (error) {
            console.log(error);
        }
    }

    async deleteClients(id){
        console.log(id);
        var deletedClient;
        try {
            await clientModel.findOneAndDelete({
                _id: id
            }).then((value) => {
                deletedClient = value;
            });

            return deletedClient;

        } catch (error) {
            console.log(error);
        }
    }

    async updateClients(newClient){
        var updatedClient;
        try {
            await clientModel.findOneAndUpdate({
                _id: newClient._id
            }, newClient).then((value) => {
                updatedClient = value;
            });

            return updatedClient;
        } catch (error) {
            console.log(error)
        }
    }

    async loginClients(email, password){
        var getUser;
        try {
            await clientModel.find({email: email, password: password}).then((value) => {
                getUser = value;
            })

            console.log('User logged in');
            console.log(getUser);

            return getUser;
            

        } catch (error) {
            console.log(error);
        }
    }
}

module.exports = new ClientServices();