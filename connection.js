const mysql = require('mysql2');
var mysqlConnection = mysql.createConnection({
    host:"localhost",
    port:"3308",
    user:'root',
    password:"",
    database:"fresher_guidence_social_app"

})
 mysqlConnection.connect((err) =>{
    if(err){
       console.log("Error in DB Connection"+JSON.stringify(err,undefined,2))
    } else {
       console.log("DB connected successfull")
    }
})
module.exports= mysqlConnection;