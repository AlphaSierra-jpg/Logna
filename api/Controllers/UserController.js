const axios = require('axios')
const request = require('request')

exports.login = function (req, res) {
    let login , password
    const allDev = [ 'coste_c', 'hamia_r', 'habert_j', 'giraul_a','kaewkl_i' ]
    if (req.body.login) {
        login = req.body.login
        password = req.body.password
    }else if (req.query.login) {
        login = req.query.login
        password = req.query.password
    }else {
        return res.status(400).json({code : 400 , message : 'Something is wrong about your parameters'})
    }
    axios({
         method: 'post',
         url: 'https://auth.etna-alternance.net/identity',
          data:{
             login: login,
             password: password
         }
        })
        .then(function (response) {
          if (response.status == 200 && (response.data.groups.includes('adm') || login.includes(login))){
             let token = ''
             var stop = 0
             for(i=0;response.headers['set-cookie'][0][i]!=';';i++){
                 token = token.concat('', response.headers['set-cookie'][0][i])
                 stop = i + 3
                  }
             return res.status(200).json({code : 200 , message : 'successfully logged', datas : {
                 token : token,
                 login : response.data.login
             } })
             
          }
        })
        .catch(function (error) {
          console.log(error);
          return res.status(400).json({code : 400 , message : error})
        });
}