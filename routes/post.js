var express = require('express');
const connection = require('../connection')
const {insertQuery,updateQuery} = require("../sqlquerys");
var router = express.Router();


router.post('/', async(req, res) => {
    // console.log("req",req.body)
    // console.log("req",req.file)
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
    // console.log("req",req.body)
    // console.log("req",req.file)
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
        // console.log("updateObj",updateObj)
                    const querySql = await updateQuery(updateObj,"posts","id = '"+id+"'");
                    const insertData = await connection({ querys: querySql, values: [] });
                        if(insertData){
                            res.send({result:"post updated successfully"});
                        }else{
                            res.send('Error');
                        }
                     
   
});
router.get('/:postId', async(req, res) => {
    const { postId } = req.params;
    var output = {};
    const querySql = 'SELECT p.* from posts p  WHERE p.id = "'+postId+'"';
    const rows = await connection({ querys: querySql, values: [] });
    res.send(rows)    
 });
router.get('/byuserId/:userId', async(req, res) => {
    const { userId } = req.params;
    var output = {};
    const querySql = 'SELECT p.*,tlike.totalLike,tComent.totalComments FROM posts p   LEFT JOIN (   select COUNT(pl.id)as totalLike ,pl.postId from posts_likes pl    where pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId  ) tlike on tlike.postId = p.id    LEFT JOIN (   select COUNT(pc.id)as totalComments ,pc.postId from posts_comments pc    where pc.is_active = 1 GROUP BY pc.postId  ) tComent on tComent.postId = p.id  WHERE p.userId = "'+userId+'"';
    const rows = await connection({ querys: querySql, values: [] });
    // console.log("jjjjjj---------",rows)
    res.send(rows)    
 });
 router.post('/searchpost', async(req, res) => {
    const { searchfield } = req.body;
    var output = {};
    const querySql = "SELECT p.*,tlike.totalLike,tComent.totalComments FROM posts p   LEFT JOIN (   select COUNT(pl.id)as totalLike ,pl.postId from posts_likes pl    where pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId  ) tlike on tlike.postId = p.id    LEFT JOIN (   select COUNT(pc.id)as totalComments ,pc.postId from posts_comments pc    where pc.is_active = 1 GROUP BY pc.postId  ) tComent on tComent.postId = p.id  WHERE p.postTitle LIKE '%"+searchfield+"%' OR p.description LIKE '%"+searchfield+"%'";
    const rows = await connection({ querys: querySql, values: [] });
    // console.log("jjjjjj---------",rows)
    res.send(rows)    
 });
 router.post('/comment', async(req, res) => {
    const today = new Date();
    const { commenttext,postId,commentUserId } = req.body;
    const insertObj = {
        "commet":commenttext,
        "postId":postId,
        "commentUserId":commentUserId,
        "createdDate":today.getTime()
   }
               const querySql = await insertQuery(insertObj,"posts_comments")
               const insertData = await connection({ querys: querySql, values: [] });
                   if(insertData){
                       res.send({result:"comments created successfully"});
                   }else{
                       res.send('Error');
                   }
 });
 router.post('/like', async(req, res) => {
    const today = new Date();
    const { isLike,postId,likeuserId } = req.body;
    const querySql1 = "SELECT * from posts_likes WHERE postId = '"+ postId+"' AND  likeUserId = '"+likeuserId +"'";
    const rows = await connection({ querys: querySql1, values: [] });
    if(rows && rows.length > 0) {
       const querySql ="UPDATE posts_likes SET isLike = '"+isLike+"', updatedDate= '"+today.getTime()+"' WHERE id = '"+rows[0].id+"'";
       const insertData = await connection({ querys: querySql, values: [] });
                       if(insertData){
                           res.send({result:"like created successfully"});
                       }else{
                           res.send('Error');
                       }
    }else{
        const insertObj = {
            "isLike":isLike,
            "postId":postId,
            "likeUserId":likeuserId,
            "createdDate":today.getTime()
        }
                   const querySql = await insertQuery(insertObj,"posts_likes")
                   const insertData = await connection({ querys: querySql, values: [] });
                       if(insertData){
                           res.send({result:"like created successfully"});
                       }else{
                           res.send('Error');
                       }
    }
   
 });
//export this router to use in our index.js
module.exports = router;