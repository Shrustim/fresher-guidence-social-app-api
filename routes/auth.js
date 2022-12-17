const {selectQuery,insertQuery} = require("../sqlquerys");
var express = require('express');
const connection = require('../connection')
const jwt = require("jsonwebtoken");
var secretKey = "fresher-guidence-social-app";
var router = express.Router();


router.post('/login',async(req,res) => {
    console.log("hiiii")

   const { email, password } = req.body;
   const whereConditionS = "users.email='"+email+"' AND users.password='"+(password)+"' AND users.is_active = 1";
   const querySql = await selectQuery("users",["users.id"],whereConditionS)
   const rows = await connection({ querys: querySql, values: [] });
   if(rows && rows.length > 0){
    jwt.sign(rows[0],secretKey,{expiresIn:'365d'},(err,token)=> {
        res.send({
            token
        })
       })
   }else{
    res.send({
        result:"In valid password and email"
    })
   } 
})

router.post('/register', async (req,res) => {
    const { email, password,collageId,passoutYear,name} = req.body;
    const whereConditionS = "email='"+email+"'";
            const querySqlCheck = await selectQuery("users",["id"],whereConditionS)
            const rows = await connection({ querys: querySqlCheck, values: [] });
            if (rows.length == 0) {
                    const today = new Date();
                    const insertObj = {
                        "name":name,
                          "email":email,
                          "password":(password),
                          "collageId":collageId,
                          "passoutYear":passoutYear,
                          "createdDate":today.getTime()
                    }
                    const querySql = await insertQuery(insertObj,"users")
                    const insertData = await connection({ querys: querySql, values: [] });
                        if(insertData){
                                jwt.sign({"id":insertData.insertId},secretKey,{expiresIn:'365d'},(err,token)=> {
                                    res.send({
                                        token
                                    })
                                })
                        }else{
                                    res.send({
                                        result:"In valid password and email"
                                    })
                        }
                     }
                    else{
                        res.send({
                            result:'Email is already exits.'
                        })
            }
              
           
})

//export this router to use in our index.js
module.exports = router;