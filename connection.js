const mysql = require('mysql2/promise');

const mysqlConnection = async ({ querys, values = [] }) => {
   let connection = await mysql.createConnection({
    host:"localhost",
    port:"3308",
    user:'root',
    password:"",
    database:"fresher_guidence_social_app"


       // host: 'www.remotemysql.com',
       // user: '6br4O9SyPX',
       // password: 'BY5gM7x7Tm',
       // port:3306,
       // database:"6br4O9SyPX"
   });
 try {
   var data;
   await connection.connect()
   .then(() => connection.query(querys))
   .then(([rows, fields]) => {
       // console.log('The solution is: ', rows);
       data = rows;
   });
   await connection.end();
   return data;
 } catch (error) {
   // throw Error("error");
   return { error };
 }
}
// var mysqlConnection = mysql.createConnection({
//     host:"localhost",
//     port:"3308",
//     user:'root',
//     password:"",
//     database:"fresher_guidence_social_app"

// })
//  mysqlConnection.connect((err) =>{
//     if(err){
//        console.log("Error in DB Connection"+JSON.stringify(err,undefined,2))
//     } else {
//        console.log("DB connected successfull")
//     }
// })
module.exports= mysqlConnection;