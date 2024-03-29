var express = require('express');
const connection = require('../connection')
var router = express.Router();
const jwt_decode = require('jwt-decode');
const {updateQuery,insertQuery} = require("../sqlquerys");

router.get('/', async(req, res) => {
   const querySql = 'SELECT * FROM users';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log(rows)
   res.send(rows)    
});

router.get('/:id', async(req, res) => {
   const { id } = req.params;
   var loginuserData = jwt_decode(req.token);
   var output = {
      isFriend: false,
      isBlock:false
   };
   const querySql = 'SELECT u.*,c.collegeName FROM users u LEFT OUTER JOIN colleges c  ON u.collageId=c.id  where u.id =  "'+id+'"';
   const rows = await connection({ querys: querySql, values: [] });
   // console.log("jjjjjj---------",rows)
   output.data = rows[0]
   const querySql2 = 'SELECT s.id,s.skilsName FROM `user_skills` us   LEFT JOIN skills s ON us.skilsId = s.id   WHERE userId ="'+id+'"';
   const rows2 = await connection({ querys: querySql2, values: [] });
   output.skills = rows2
   const querySql3 = 'SELECT ( SELECT COUNT(u.id) as following FROM users u LEFT OUTER JOIN user_friends f ON u.id = f.friendId where f.userId = "'+id+'" AND f.isRequest = 0) as following, (SELECT COUNT(u.id) as followers FROM users u LEFT OUTER JOIN user_friends f ON u.id = f.userId where f.friendId = "'+id+'" AND f.isRequest = 0) as followers';
   const rows3 = await connection({ querys: querySql3, values: [] });
   output.friends = rows3
   const querySql4 = 'SELECT COUNT(id) as count FROM `notifications` WHERE userId = "'+id+'" and isRead = 0';
   const rows4 = await connection({ querys: querySql4, values: [] });
   const checksql = "SELECT * FROM user_friends where ( userId = '"+id+"' and friendId = '"+loginuserData.id+"' and isRequest = 0) or ( userId = '"+loginuserData.id+"' and friendId = '"+id+"' and isRequest = 0) and isRequest = 0"
   const rowsCheck = await connection({ querys: checksql, values: [] });
   if(rowsCheck.length > 0 ){
      output.isFriend = true     
    }
   const checksql1 = "SELECT * FROM `block_users` where ( userId = '"+id+"' and blockUserId = '"+loginuserData.id+"') or (userId = '"+loginuserData.id+"' and blockUserId = '"+id+"') "
   const rowsCheck1 = await connection({ querys: checksql1, values: [] });
    if(rowsCheck1.length > 0){
      output.isBlock = true     
    }
   output.blockuserData = rowsCheck1
   output.notificationCount = rows4[0].count
   // console.log(output)
   res.send(output)    
});

router.post('/searchuser', async(req, res) => {
   const { searchfield } = req.body;
   var {id} = jwt_decode(req.token);
   const querySql = 'SELECT DISTINCT u.id, u.name, u.email, u.photo, CASE WHEN f.isRequest = 0 THEN 0  WHEN f.isRequest = 1 THEN 0 ELSE 1 END as isRequest FROM users u LEFT OUTER JOIN user_skills us ON u.id = us.userId LEFT OUTER JOIN skills s ON us.skilsId = s.id LEFT OUTER JOIN user_friends f ON  f.userId = "'+id+'" and f.friendId = u.id WHERE u.id != "'+id+'" AND (u.name LIKE "%'+searchfield+'%" OR u.email LIKE "%'+searchfield+'%" OR u.workedCompanies LIKE "%'+searchfield+'%" OR s.skilsName LIKE "%'+searchfield+'%" )';
   const rows = await connection({ querys: querySql, values: [] });
   res.send(rows)    
});
const insertSkills = async (skills,userId) => {
   // console.log("userId",userId)
      const rows = await connection({ querys: "DELETE FROM user_skills WHERE userId='"+userId+"'", values: [] });
      const today = new Date();
      var results = await Promise.all(skills.map(async (skillId) => {
         //   console.log("skillId",skillId)
           const insertObj = {
            "userId":userId,
            "skilsId":skillId,
            "createdDate":today.getTime()
          }
          const querySql = await insertQuery(insertObj,"user_skills")
          await connection({ querys: querySql, values: [] });
     }));
} 
router.patch('/', async (req,res) => {
   const { id,name,collageId,passoutYear,photo,dateOfBirth,
      about,technicalKnowledge,achievement,yearOfExperience,workedProjects,skills,workedCompanies} = req.body;
      // console.log("skills",skills)
                   const today = new Date();
                   const whereObj = " id = "+id+" ";
                   const updateObj = {
                         "name":name,
                         "collageId":collageId,
                         "passoutYear":passoutYear,
                         "dateOfBirth":dateOfBirth,
                         "about":about,
                         "technicalKnowledge":technicalKnowledge,
                         "achievement":achievement,
                         "yearOfExperience":yearOfExperience,
                         "workedProjects":workedProjects,
                         "workedCompanies":workedCompanies,
                         "updatedDate":today.getTime()
                   }
                   const querySql = await updateQuery(updateObj,"users",whereObj)
                   const insertData = await connection({ querys: querySql, values: [] });
                       if(insertData){
                            await insertSkills(skills,id);
                           res.send({
                              result:"updated successfull"
                           })
                       }else{
                                   res.send({
                                       result:"In valid data"
                                   })
                       }
                  
           
             
          
})


//export this router to use in our index.js
module.exports = router;
