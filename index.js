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
var profileimageRoute = require('./routes/profileimage');
var coverimageRoute = require('./routes/coverimage');
var notificationsRoute = require('./routes/notifications')
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
const io = require('socket.io')(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST","PATCH"],
  },
});
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
      if(user && user.socketId){
       io.to(user.socketId).emit("getMessage",data)
      }
      
    });

   
    socket.on('disconnect', function() {
         removeOnlineUsers(socket.id)
         io.emit("getOnlineUsers",onlineUser)
        console.log('user disconnected');
    });


/* vedio call code new ---------------------start */

    socket.on('call_user', (data) =>  {
      console.log("call_user-----------",data)
      io.to(data.socketId).emit("callisCome",data);
    });
/* vedio call code new -------------end */
    /* vedio call code start ------*/
     socket.emit("me", socket.id);

  socket.on("callUser", ({ userToCall, signalData, from, name,to }) => {
		io.to(userToCall).emit("callUser", { signal: signalData, from, name,to });
	});

	// socket.on("answerCall", (data) => {
	// 	io.to(data.to).emit("callAccepted", data.signal)
	// });
   socket.on("answerCall", (data) => {
    socket.broadcast.emit("updateUserMedia", {
      type: data.type,
      currentMediaStatus: data.myMediaStatus,
    });
    io.to(data.to).emit("callAccepted", data.signal);
  });

  socket.on("endCall", ({ id }) => {
      io.to(id).emit("endCall");
    });

  socket.on("updateMyMedia", ({ type, currentMediaStatus }) => {
    console.log("updateMyMedia");
    socket.broadcast.emit("updateUserMedia", { type, currentMediaStatus });
  });













  // socket.on("msgUser", ({ name, to, msg, sender }) => {
  //   io.to(to).emit("msgRcv", { name, msg, sender });
  // });

  // socket.on("answerCall", (data) => {
  //   socket.broadcast.emit("updateUserMedia", {
  //     type: data.type,
  //     currentMediaStatus: data.myMediaStatus,
  //   });
  //   io.to(data.to).emit("callAccepted", data);
  // });
  // socket.on("endCall", ({ id }) => {
  //   io.to(id).emit("endCall");
  // });
  
  /* vedio call code end */
})
app.use(bodyParser.json())
app.use('/Images', express.static(__dirname + "/Images"));
app.use('/users',middleware, usersRoute);
app.use('/skills',middleware, skillsRoute);
app.use('/colleges', collegeRoute);
app.use('/friends',middleware, friendsRoute);
app.use('/message',middleware, messageRoute);
app.use('/post',middleware,upload.single("image"), postRoute);
app.use('/updateprofilephoto',middleware,upload.single("image"), profileimageRoute);
app.use('/updatecoverphoto',middleware,upload.single("image"), coverimageRoute);
app.use('/post',middleware,upload.single("image"), postRoute);
app.use('/auth', authRoute);
app.use('/notifications',middleware, notificationsRoute);




server.listen(8080,() => {
    console.log("express server is running  on 8080")
})

