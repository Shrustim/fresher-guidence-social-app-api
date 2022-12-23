var express = require('express');
const connection = require('../connection')
var router = express.Router();

router.get('/', async(req, res) => {
   const querySql = 'SELECT id,skilsName FROM skills WHERE is_active = 1';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log(rows)
   res.send(rows)    
});
router.post('/', function(req, res){
   res.send('POST route on things.');
});

//export this router to use in our index.js
module.exports = router;