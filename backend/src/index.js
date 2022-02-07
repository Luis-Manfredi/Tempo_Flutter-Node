const { app } = require('./app');
const { database } = require('./database');

async function main(){
    //Database
    await database();
    //Start up server
    await app.listen(4000);
}

main();