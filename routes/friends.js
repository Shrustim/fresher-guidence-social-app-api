var express = require('express');
const connection = require('../connection')
var router = express.Router();
const jwt_decode = require('jwt-decode');
const {insertQuery,updateQuery} = require("../sqlquerys");

router.get('/myfriendlist', async(req, res) => {
   var {id} = jwt_decode(req.token)
   const querySql = 'SELECT u.* ,bu.blockUserId FROM users u LEFT OUTER JOIN block_users bu ON u.id = bu.userId LEFT OUTER JOIN user_friends f ON u.id = f.friendId where f.userId = "'+id+'" AND f.isRequest = 0 AND bu.blockUserId IS NULL UNION SELECT u.*,bu.blockUserId FROM users u LEFT OUTER JOIN block_users bu ON u.id = bu.userId LEFT OUTER JOIN user_friends f ON u.id = f.userId where f.friendId = "'+id+'" AND f.isRequest = 0 AND bu.blockUserId IS NULL';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log(rows)
   res.send(rows)    
});

router.get('/myfriendlistMessage', async(req, res) => {
   var {id} = jwt_decode(req.token)
   const querySql = 'SELECT u.*, IFNULL(m.messageCount, 0) as messageCount FROM users u LEFT OUTER JOIN block_users bu ON u.id = bu.userId LEFT OUTER JOIN user_friends f ON u.id = f.friendId LEFT JOIN( SELECT COUNT(id) as messageCount, senderId FROM messages WHERE isRead = 0 and reciverId = '+id+' GROUP by senderId) m on u.id = m.senderId WHERE f.userId = '+id+' AND f.isRequest = 0 AND bu.blockUserId IS NULL UNION SELECT u.*, IFNULL(m.messageCount, 0) as messageCount FROM users u LEFT OUTER JOIN block_users bu ON u.id = bu.userId LEFT OUTER JOIN user_friends f ON u.id = f.userId LEFT JOIN ( SELECT COUNT(id) as messageCount, senderId FROM messages WHERE isRead = 0 and reciverId ='+id+' GROUP by senderId ) m on u.id = m.senderId WHERE f.friendId = '+id+' AND f.isRequest = 0 AND bu.blockUserId IS NULL ORDER by messageCount desc';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log(rows)
   res.send(rows)    
});

router.get('/myrequests', async(req, res) => {
   var {id} = jwt_decode(req.token);
   const querySql = 'SELECT f.id as requestId,u.* FROM users u LEFT JOIN user_friends f ON u.id = f.userId where f.friendId = '+id+' AND f.isRequest = 1';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log(rows)
   res.send(rows)    
});


router.post('/request', async (req,res) => {
   const { userId,friendId} = req.body;
   const today = new Date();
      const insertObj = {
         "userId":userId,
         "friendId":friendId,
         "createdDate":today.getTime()
       }
       const querySql = await insertQuery(insertObj,"user_friends")
       await connection({ querys: querySql, values: [] });
       const insertObjj = {
         "userId":friendId,
         "notifyuserId":userId,
         "text": "New friend request.",
         "createdDate":today.getTime()
     }
             const querySql1 = await insertQuery(insertObjj,"notifications")
             await connection({ querys: querySql1, values: [] });
         res.send({
            result:"friend request successfull"
       })
})
router.post('/requestaccept', async (req,res) => {
   const {requestId} = req.body;
   const querySql1 = 'SELECT f.* FROM user_friends f WHERE id = '+requestId+' ';
   const rows1 = await connection({ querys: querySql1, values: [] });
   const today = new Date();
   const insertObjj = {
      "userId":rows1[0].userId,
      "notifyuserId":rows1[0].friendId,
      "text": "Your friend request accepted.",
      "createdDate":today.getTime()
  }
          const querySql2 = await insertQuery(insertObjj,"notifications")
          await connection({ querys: querySql2, values: [] });
 
       const querySql ="UPDATE user_friends SET isRequest = '0', updatedDate= '"+today.getTime()+"' WHERE id = '"+requestId+"'";
      //  console.log("querySql",querySql)
       await connection({ querys: querySql, values: [] });
         res.send({
            result:"friend request accepted successfull"
       })
})

router.post('/blockuser', async (req,res) => {
   const { blockUserId} = req.body;
   var {id} = jwt_decode(req.token) 
   const today = new Date();
   const insertObjj = {
      "blockUserId":blockUserId,
      "userId":id,
      "createdDate":today.getTime()
  }
          const querySql1 = await insertQuery(insertObjj,"block_users")
          await connection({ querys: querySql1, values: [] });
      res.send({
         result:"user block successfull"
    })
})

router.post('/unblockuser', async (req,res) => {
   const { blockUserId} = req.body;
   var {id} = jwt_decode(req.token) 
   const deleteBlockSql = "DELETE FROM block_users WHERE userId = '"+id+"' and blockUserId = '"+blockUserId+"'";
           await connection({ querys: deleteBlockSql, values: [] });
       res.send({
         result:"user block successfull"
    })
})


//export this router to use in our index.js
module.exports = router;