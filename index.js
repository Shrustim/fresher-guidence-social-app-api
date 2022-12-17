const connection = require('./connection')
const express = require('express');
const bodyParser = require('body-parser');
var middleware =  require('./middleware')
var usersRoute = require('./routes/users');
var collegeRoute = require('./routes/college');
var skillsRoute = require('./routes/skills');
var authRoute = require('./routes/auth');
var friendsRoute = require('./routes/friends');
var postRoute = require('./routes/post');
const cors = require('cors');
const multer = require('multer');
const path = require('path');
const storage = multer.diskStorage({
    destination:(req,file,cb) => {
        cb(null,'Images')
    },
    filename: (req,file,cb) => {
         cb(null,Date.now()+path.extname(file.originalname))
    }
    });
const upload = multer({storage: storage})

var app = express();
app.use(cors({
    origin: '*'
}))
app.use(bodyParser.json())
app.use('/Images', express.static(__dirname + "/Images"));
app.use('/users',middleware, usersRoute);
app.use('/skills',middleware, skillsRoute);
app.use('/colleges', collegeRoute);
app.use('/friends',middleware, friendsRoute);
app.use('/post',middleware,upload.single("image"), postRoute);
app.use('/auth', authRoute);
app.listen(8080,() => {
    console.log("express server is running  on 8080")
})