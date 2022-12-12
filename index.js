const connection = require('./connection')
const express = require('express');
const bodyParser = require('body-parser');
var middleware =  require('./middleware')
var usersRoute = require('./routes/users');
var collegeRoute = require('./routes/college');
var skillsRoute = require('./routes/skills');
var authRoute = require('./routes/auth');
var friendsRoute = require('./routes/friends');
var app = express();



app.use(bodyParser.json())
app.use('/users',middleware, usersRoute);
app.use('/skills',middleware, skillsRoute);
app.use('/colleges',middleware, collegeRoute);
app.use('/friends',middleware, friendsRoute);
app.use('/auth', authRoute);
app.listen(8080,() => {
    console.log("express server is running  on 8080")
})