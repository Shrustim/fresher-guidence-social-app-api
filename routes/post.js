var express = require('express');
const connection = require('../connection')
const {insertQuery,updateQuery} = require("../sqlquerys");
const jwt_decode = require('jwt-decode');
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
    var {id} = jwt_decode(req.token);
    var output = {};
    const querySql = 'SELECT p.*,tlike.totalLike,tComent.totalComments,u.name,u.photo, pll.isLike FROM posts p  LEFT OUTER JOIN users u ON p.userId=u.id LEFT OUTER JOIN posts_likes pll ON pll.likeUserId = "'+id+'" and p.id = pll.postId   LEFT JOIN (   select COUNT(pl.id)as totalLike ,pl.postId from posts_likes pl    where pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId  ) tlike on tlike.postId = p.id    LEFT JOIN (   select COUNT(pc.id)as totalComments ,pc.postId from posts_comments pc    where pc.is_active = 1 GROUP BY pc.postId  ) tComent on tComent.postId = p.id  WHERE p.id = "'+postId+'"';
    const rows = await connection({ querys: querySql, values: [] });
    res.send(rows)    
 });
router.get('/byuserId/:userId', async(req, res) => {
    const { userId } = req.params;
    var output = {};
    const querySql = 'SELECT p.*,tlike.totalLike,tComent.totalComments,u.name,u.photo, pll.isLike FROM posts p  LEFT OUTER JOIN users u ON p.userId=u.id LEFT OUTER JOIN posts_likes pll ON pll.likeUserId = "'+userId+'" and p.id = pll.postId   LEFT JOIN (   select COUNT(pl.id)as totalLike ,pl.postId from posts_likes pl    where pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId  ) tlike on tlike.postId = p.id    LEFT JOIN (   select COUNT(pc.id)as totalComments ,pc.postId from posts_comments pc    where pc.is_active = 1 GROUP BY pc.postId  ) tComent on tComent.postId = p.id  WHERE p.is_active = 1 and p.userId = "'+userId+'"  order by  p.id desc';
    const rows = await connection({ querys: querySql, values: [] });
    // console.log("jjjjjj---------",rows)
    res.send(rows)    
 });
 router.post('/searchpost', async(req, res) => {
     var {id} = jwt_decode(req.token);
    const { searchfield } = req.body;
    var output = {};
    var querySql = "";
    var rows = []
    var search = searchfield ? searchfield : ""
    const checksql = "SELECT * FROM user_friends where ( userId = '"+id+"' or friendId = '"+id+"' ) and isRequest = 0"
    const rowsCheck = await connection({ querys: checksql, values: [] });
    if(rowsCheck.length == 0 ){
        console.log("-----------",rowsCheck.length)
         querySql = 'SELECT p.*,tlike.totalLike,tComent.totalComments,u.name,u.photo, pll.isLike FROM posts p  LEFT OUTER JOIN users u ON p.userId=u.id LEFT OUTER JOIN posts_likes pll ON pll.likeUserId = "'+id+'" and p.id = pll.postId   LEFT JOIN (   select COUNT(pl.id)as totalLike ,pl.postId from posts_likes pl    where pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId  ) tlike on tlike.postId = p.id    LEFT JOIN (   select COUNT(pc.id)as totalComments ,pc.postId from posts_comments pc    where pc.is_active = 1 GROUP BY pc.postId  ) tComent on tComent.postId = p.id  WHERE p.is_active = 1 and p.userId = "'+id+'"  order by  p.id desc';
         rows = await connection({ querys: querySql, values: [] });
    }else{
        console.log("+++++++++++++++++",rowsCheck.length)
         querySql = "SELECT DISTINCT p.id, p.userId, p.postTitle, p.image, p.description, p.createdDate, p.updatedDate, p.is_active, tlike.totalLike, tComent.totalComments, pll.isLike, u.name, u.photo, bu.userId as buuserId, bu.blockUserId as bublockUserId FROM posts p LEFT JOIN( SELECT u.id, u.name, u.photo FROM users u LEFT OUTER JOIN user_friends f ON u.id = f.friendId or u.id = f.userId WHERE ( f.userId = '"+id+"' OR f.friendId = '"+id+"') AND f.isRequest = 0 ) u ON p.userId = u.id LEFT OUTER JOIN block_users bu ON bu.userId = u.id and bu.blockUserId = '"+id+"' LEFT OUTER JOIN posts_likes pll ON pll.likeUserId = '"+id+"' AND p.id = pll.postId LEFT JOIN( SELECT COUNT(pl.id) AS totalLike, pl.postId FROM posts_likes pl WHERE pl.isLike = 1 AND pl.is_active = 1 GROUP BY pl.postId ) tlike ON tlike.postId = p.id LEFT JOIN( SELECT COUNT(pc.id) AS totalComments, pc.postId FROM posts_comments pc WHERE pc.is_active = 1 GROUP BY pc.postId ) tComent ON tComent.postId = p.id WHERE  p.is_active = 1 and u.id IS NOT NULL and ( bu.blockUserId IS NULL ) or ( u.id = '"+id+"' and p.is_active = 1) and ( p.postTitle LIKE '%"+searchfield+"%' OR p.description LIKE '%"+searchfield+"%' ) ORDER BY p.id DESC";
         rows = await connection({ querys: querySql, values: [] });
    }
    
     console.log("jjjjjj---------",querySql)
    res.send(rows)    
 });
 router.post('/comment', async(req, res) => {
    var {id} = jwt_decode(req.token);
    const today = new Date();
    const { commenttext,postId,commentUserId,likeuserName,postuserId } = req.body;
    const insertObj = {
        "commet":commenttext,
        "postId":postId,
        "commentUserId":commentUserId,
        "createdDate":today.getTime()
   }
   
               const querySql = await insertQuery(insertObj,"posts_comments")
               const insertData = await connection({ querys: querySql, values: [] });
               if( id != postuserId ) {
                    const insertObjj = {
                            "userId":postuserId,
                            "notifyuserId":commentUserId,
                            "text": "Comment on your post.",
                            "createdDate":today.getTime()
                        }
                                const querySql1 = await insertQuery(insertObjj,"notifications")
                                await connection({ querys: querySql1, values: [] });
                    }
                   if(insertData){
                       res.send({result:"comments created successfully"});
                   }else{
                       res.send('Error');
                   }
 });
 router.post('/like', async(req, res) => {
    var {id} = jwt_decode(req.token);
    const today = new Date();
    const { isLike,postId,likeuserId,likeuserName,postuserId } = req.body;
        
    if(isLike && id != postuserId ) {
        const insertObjj = {
            "userId":postuserId,
            "notifyuserId":likeuserId,
            "text":"Like your post.",
            "createdDate":today.getTime()
        }
                   const querySql1 = await insertQuery(insertObjj,"notifications")
                   await connection({ querys: querySql1, values: [] });
    }
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
  router.get('/comments/:postId', async(req, res) => {
    const today = new Date();
    const { postId } = req.params;
   const querySql = 'SELECT c.*,u.name,u.photo FROM posts_comments c LEFT OUTER JOIN users u ON c.commentUserId = u.id WHERE c.postId = "'+postId+'"  order by  c.id desc';
    const rows = await connection({ querys: querySql, values: [] });
     res.send(rows)    
 });

   router.delete('/:postId', async(req, res) => {
    var {id} = jwt_decode(req.token)
    const { postId } = req.params;
    const today = new Date();
    const querySql ="UPDATE posts SET is_active = '0', updatedDate= '"+today.getTime()+"' WHERE id = '"+postId+"' and userId = '"+id+"'";
    const insertData = await connection({ querys: querySql, values: [] });
                    if(insertData){
                        res.send({result:"post deleted successfully"});
                    }else{
                        res.send('Error');
                    } 
    });
//export this router to use in our index.js
module.exports = router;