var express = require('express');
const connection = require('../connection')
var router = express.Router();
const {updateQuery} = require("../sqlquerys");


router.patch('/', async(req, res) => {
   // console.log("req",req.body)
   // console.log("req",req.file)
   const { userId} = req.body;
   const today = new Date();
   const imageName = req.file ? req.file.filename : "";
   var updateObj = {
            "updatedDate":today.getTime()
       }
       updateObj = imageName ? {...updateObj,"photo":imageName}:  updateObj;
       // console.log("updateObj",updateObj)
                   const querySql = await updateQuery(updateObj,"users","id = '"+userId+"'");
                   const insertData = await connection({ querys: querySql, values: [] });
                       if(insertData){
                           res.send({result:"users profile image updated successfully",image:imageName});
                       }else{
                           res.send('Error');
                       }
                    
  
});

//export this router to use in our index.js
module.exports = router;