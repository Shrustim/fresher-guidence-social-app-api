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
  
   connection.query(querySql,(err,rows)=>{
               if(err){
                  console.log(err);
                  res.send(err)
               }else{
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
                
               }
           })

  
})

router.post('/register', async (req,res) => {
    const { email, password} = req.body;
    const whereConditionS = "email='"+email+"'";
            const querySqlCheck = await selectQuery("users",["id"],whereConditionS)
            connection.query(querySqlCheck, async(err,rows)=>{
                if(err){
                   console.log(err);
                   res.send(err)
                }else{
                    if (rows.length == 0) {
                        const today = new Date();
                        const insertObj = {
                          "email":email,
                          "password":(password),
                          "createdDate":today.getTime()
                        }
                        const querySql = await insertQuery(insertObj,"users")
                        connection.query(querySql,(err,rows)=>{
                            if(err){
                               console.log(err);
                               res.send(err)
                            }else{
                                if(rows){
                                 jwt.sign({"id":rows.insertId},secretKey,{expiresIn:'365d'},(err,token)=> {
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
                        })
             
                        // const querySql ='INSERT INTO users (email, password, firstName, lastName, createdDttm,lastLoggedDttm)'+
                        // 'VALUES ("'+email+'", "'+password+'", "'+firstName+'", "'+lastName+'","'+ today.getTime()+'","'+ today.getTime()+'")';
                        // const data = await query({ querys: querySql, values: [] });
                        
                        // if (!data.insertId) throw 'Information is incorrect';
        
                        // // create a jwt token that is valid for 7 days
                        // const token = jwt.sign({ sub: data.insertId,role:"user","subscriptionStatus":"unSubscribed"},JWTSecret, { expiresIn: '7d' });
        
                        // // return  token
                        // return res.status(200).json({
                        //     token
                        // });
                    }
                    else{
                        res.send({
                            result:'Email is already exits.'
                        })
                      
                    };
                }
            })
           
})

//export this router to use in our index.js
module.exports = router;