const { Schema, model } = require('mongoose');

const clientSchema = new Schema ({
    email: String,
    username: String,
    password: String
});

module.exports = model('Clients', clientSchema);