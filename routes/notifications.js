var express = require('express');
const connection = require('../connection')
const jwt_decode = require('jwt-decode');
var router = express.Router();

router.get('/', async(req, res) => {
    var {id} = jwt_decode(req.token);
    const today = new Date();
    const querySql = "SELECT n.*,u.id,u.name,u.photo FROM notifications n LEFT OUTER JOIN users u ON n.notifyuserId=u.id where userId = '"+id+"' order by n.id desc ";
   const rows = await connection({ querys: querySql, values: [] });
   const querySql1 ="UPDATE notifications SET isRead = '1', updatedDate= '"+today.getTime()+"' WHERE isRead = 0 and userId = '"+id+"'";
    await connection({ querys: querySql1, values: [] });
   // console.log(rows)
   res.send(rows)    
});

//export this router to use in our index.js
module.exports = router;