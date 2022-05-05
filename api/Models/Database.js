const mongoose = require('mongoose')

mongoose.connect('mongodb://mongodb:27017/EtnaLogger',{
    useNewUrlParser: true,
    useUnifiedTopology : true,
},(err, res) => {
    if(!err){
        console.log('dataBase connected')

    }else{
        console.log('Error -> '+err)
    }
})

