var express = require('express');
const connection = require('../connection')
const {insertQuery} = require("../sqlquerys");
var router = express.Router();


router.post('/send', async(req, res) => {
    const { senderId,reciverId,message_text} = req.body;
    const today = new Date();
    const insertObj = {
             "senderId":senderId,
             "reciverId":reciverId,
             "message_text":message_text,
             "createdDate":today.getTime()
        }
                    const querySql = await insertQuery(insertObj,"messages")
                    const insertData = await connection({ querys: querySql, values: [] });
                        if(insertData){
                            res.send({result:"message created successfully",message:insertData});
                        }else{
                            res.send('Error');
                        }
                     
   
});
router.post('/getmessages', async(req, res) => {
    const { loginuserId,userId} = req.body;
    var output = {};
    const querySql = "SELECT id,senderId,reciverId,message_text,createdDate FROM messages WHERE (senderId = "+loginuserId+" and reciverId = "+userId+" ) OR (senderId = "+userId+" and reciverId = "+loginuserId+" );";
    const rows = await connection({ querys: querySql, values: [] });
    const querySql2 = "SELECT id,name,email,photo FROM users WHERE id = "+userId;
    const rows2 = await connection({ querys: querySql2, values: [] });
    output.messages = rows
    output.userData = rows2
    res.send(output)    
 });

//export this router to use in our index.js
module.exports = router;