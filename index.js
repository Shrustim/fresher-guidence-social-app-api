const connection = require('./connection')
const express = require('express');
const bodyParser = require('body-parser');
var middleware =  require('./middleware')
var usersRoute = require('./routes/users');
var authRoute = require('./routes/auth');
var app = express();



app.use(bodyParser.json())
app.use('/users',middleware, usersRoute);
app.use('/auth', authRoute);
app.listen(8080,() => {
    console.log("express server is running  on 8080")
})