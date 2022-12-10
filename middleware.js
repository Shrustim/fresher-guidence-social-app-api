const jwt = require("jsonwebtoken");
var secretKey = "fresher-guidence-social-app";

const  verifyToken = (req,res,next) =>{
    const bearerHeader = req.headers['authorization'];
    if(typeof bearerHeader !== 'undefined'){
        const bearer = bearerHeader.split(" ");
        const token = bearer[1];
        req.token = token;
        jwt.verify(req.token,secretKey,(err,authData) => {
            if(err){
                res.send({
                    result:"INValid Token"
                })
            }else{
                next();
            }
        })
    }else{
        res.send({
            result:"Token is required"
        })
    }

}

module.exports= verifyToken;