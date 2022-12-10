var express = require('express');
const connection = require('../connection')
var router = express.Router();

router.get('/', function(req, res){
    connection.query('SELECT * FROM users',(err,rows)=>{
                if(err){
                   console.log(err);
                   res.send(err)
                }else{
                   console.log(rows)
                   res.send(rows)
                }
            })
});
router.post('/', function(req, res){
   res.send('POST route on things.');
});

//export this router to use in our index.js
module.exports = router;