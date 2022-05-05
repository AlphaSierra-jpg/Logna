/**
~jha~ 
This file is the application Server entry point
**/

// Constant initialization  
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const cors = require('cors')
const PORT = 8000

//handling DataBase
require('./Models/Database')

//init bodyParser
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))
//init cors
app.use(cors())

//routes importations 
app.use(require('./routes/UserRouter'))


//Starting server listner 
app.listen(PORT, function(req, res) {
    console.log("Server is running on : http://localhost")
})
