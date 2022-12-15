var express = require('express');
const connection = require('../connection')
const {insertQuery,updateQuery} = require("../sqlquerys");
var router = express.Router();


router.post('/', async(req, res) => {
    console.log("req",req.body)
    console.log("req",req.file)
    const { userId,postTitle,description} = req.body;
    const today = new Date();
    const imageName = req.file ? req.file.filename : "";
    const insertObj = {
             "userId":userId,
             "postTitle":postTitle,
             "description":description,
             "image":imageName,
             "createdDate":today.getTime()
        }
                    const querySql = await insertQuery(insertObj,"posts")
                    const insertData = await connection({ querys: querySql, values: [] });
                        if(insertData){
                            res.send({result:"post created successfully"});
                        }else{
                            res.send('Error');
                        }
                     
   
});
router.patch('/', async(req, res) => {
    console.log("req",req.body)
    console.log("req",req.file)
    const { id,userId,postTitle,description} = req.body;
    const today = new Date();
    const imageName = req.file ? req.file.filename : "";
    var updateObj = {
             "userId":userId,
             "postTitle":postTitle,
             "description":description,
             "updatedDate":today.getTime()
        }
        updateObj = imageName ? {...updateObj,"image":imageName}:  updateObj;
        console.log("updateObj",updateObj)
                    const querySql = await updateQuery(updateObj,"posts","id = '"+id+"'");
                    const insertData = await connection({ querys: querySql, values: [] });
                        if(insertData){
                            res.send({result:"post updated successfully"});
                        }else{
                            res.send('Error');
                        }
                     
   
});
//export this router to use in our index.js
module.exports = router;