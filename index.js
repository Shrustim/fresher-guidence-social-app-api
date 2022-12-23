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
var messageRoute = require('./routes/message');
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
const server = require('http').createServer(app);
const io = require('socket.io')(server);
let onlineUser = [];
const addOnlineUsers = (userData,socketId) => {
    let user = {...userData};
    user.socketId = socketId;
    !onlineUser.some((u) => u.id ===userData.id ) &&
    onlineUser.push(user)

}
const getUser = (userId) => {
 return onlineUser.find(u => u.id == userId)
}
const removeOnlineUsers = (socketId) => {
    onlineUser = onlineUser.filter((u) => u.socketId !== socketId);
}
io.on('connection', (socket) => {
    console.log('user connected');
    socket.on('addUser', (userData) => {
        // console.log('userData',userData);
        addOnlineUsers(userData,socket.id)
        io.emit("getOnlineUsers",onlineUser)
    });
    socket.on('sendMessage', (data) =>  {
        console.log(data)
      var user = getUser(data.reciverId)
      console.log("user",user)
       io.to(user.socketId).emit("getMessage",data)
    });

   
    socket.on('disconnect', function() {
         removeOnlineUsers(socket.id)
         io.emit("getOnlineUsers",onlineUser)
        console.log('user disconnected');
    });
})
app.use(bodyParser.json())
app.use('/Images', express.static(__dirname + "/Images"));
app.use('/users',middleware, usersRoute);
app.use('/skills',middleware, skillsRoute);
app.use('/colleges', collegeRoute);
app.use('/friends',middleware, friendsRoute);
app.use('/message',middleware, messageRoute);
app.use('/post',middleware,upload.single("image"), postRoute);
app.use('/auth', authRoute);



server.listen(8080,() => {
    console.log("express server is running  on 8080")
})

