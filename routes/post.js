var express = require('express');
const connection = require('../connection')
var router = express.Router();


router.post('/', function(req, res){
    console.log("req",req.body)
    console.log("req",req.file)
   res.send('file upload ');
});

//export this router to use in our index.js
module.exports = router;