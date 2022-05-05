const mongoose = require('mongoose')

var SignatureSchema = mongoose.Schema({
    login : {
        type : String
    },
    firstname : {
        type : String
    },
    lastname : {
        type : String
    },
    date : {
        type : Date
    }, 
    morningSignature : {
        type : String,
        default : 'Abs'
    },
    afternoonSignature : {
        type : String,
        default : 'Abs'
    },
    promotion : {
        type : String
    },
    promotion_id : {
        type : Number
    },
    creationDate : {
        type : Date,
        default : Date.now()
    },
    lastModification : {
        type : Date,
        default : Date.now()
    }

})

module.exports = mongoose.model("SignaturePost",SignatureSchema)