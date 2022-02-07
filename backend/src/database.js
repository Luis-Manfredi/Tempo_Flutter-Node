const mongoose = require('mongoose');

const database = async () => {
    try {
        console.log('Connecting...');
        await mongoose.connect('mongodb://localhost/clients');
        console.log('Connected');
    }
    catch (error) {
        throw new Error(error);
    }
}

module.exports = { database }

