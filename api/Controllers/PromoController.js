const axios = require('axios')
const request = require('request')
const Signature = require('../Models/Signature')
const fetch = require('node-fetch');



exports.getPromoId = async function (req, res) {
   
    let token, promo, years, date_input
    if (req.body.token) {
        var reg = /(^(\d{4})\s-\s(\w+)\s-\s(\w+)$)/
        if (!reg.test(req.body.promo)) 
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
        
        var temp = ""
        try {
            for (let i = 1; req.body.token[i] != '"'; i++) {
                temp = temp.concat('', req.body.token[i])
            }
    
            token = temp
    
            promo = req.body.promo
            date_input = req.body.date
            years = ''
            var temp = ''
    
            for (i = 0; promo[i] != ' '; i++) {
                years = years.concat('', promo[i])
                stop = i + 4
            }
            for (i = stop; promo[i]; i++) {
                temp = temp.concat('', promo[i])
            }
            promo = temp
        }catch{
            return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
        }
        
    } else if (req.query.token) {
        var reg = /(^(\d{4})\s-\s(\w+)\s-\s(\w+)$)/
        if (!reg.test(req.query.promo)) 
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
        try 
        {
            var temp = ""
            for (let i = 1; req.query.token[i] != '"'; i++) {
                temp = temp.concat('', req.query.token[i])
            }
            
            token = temp
            promo = req.query.promo
            date_input = req.query.date
            years = ''
            var temp = ''
            for (i = 0; promo[i] != ' '; i++) {
                years = years.concat('', promo[i])
                stop = i + 4
            }
            for (i = stop; promo[i]; i++) {
                temp = temp.concat('', promo[i])
            }
            promo = temp
        }catch {
            return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
        }
    } else {
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
    }


    const options = {
        method: 'GET',
        headers: {
            'Cookie': token
        },
    }
    let idPromo = -1;

    function getPromoId(url) {
        return new Promise(function (resolve, reject) {
            request({
                har: {
                    url: 'https://intra-api.etna-alternance.net/trombi',
                    method: 'GET',
                    headers: [
                        {
                            name: 'Cookie',
                            value: token
                        }
                    ],
                }
            }, function (err, res, body) {

                
                if (err) {
                    console.log(err)
                    resolve(-1)
                } else if (res.statusCode == 401) {
                    resolve(-1)
                } else {
                    let parsedBody = JSON.parse(body)
                    parsedBody[years].forEach(elem => {
                        if (elem['term_name'] == promo) {
                            resolve(elem['id']);
                        }
                })
                }
                

            });
        });
    }

    idPromo = await getPromoId();
    console.log(idPromo)
    let urlforStudent = 'https://intra-api.etna-alternance.net/trombi/'
    urlforStudent = urlforStudent.concat('', idPromo)
    console.log(urlforStudent)
    function getAllStudent(url) {
        return new Promise(function (resolve, reject) {
            request({
                har: {
                    url: urlforStudent,
                    method: 'GET',
                    headers: [
                        {
                            name: 'Cookie',
                            value: token
                        }
                    ],
                }
            }, function (err, res, body) {
                if (err) {
                    resolve(-1)
                }
                let parsedBody = JSON.parse(body)
                resolve(parsedBody)

            });
        });
    }
    if (idPromo == -1) {
        return res.status(401).json({ code: 401, message: 'Oups something failed try to relog your account or check your token' })
    }
    let students = await getAllStudent();
    students['students'].forEach(element => {
        const signa = Signature({
            login: element.login,
            firstname: element.firstname,
            lastname: element.lastname,
            date: date_input,
            promotion: promo,
            promotion_id: idPromo,
        })
        Signature.create(signa).then(resData => {

        })
            .catch((err) => {
                console.log(err)
            })

    })

    return res.status(200).json({
        code: 200, message: 'successfully logged', datas: {
            resp: students,
        }
    })

}



exports.checkin = function (req, res) {
    
    if (req.body.QrData) {
        QrData = req.body.QrData
        dateTime = req.body.dateTime
        isMorning = req.body.isMorning
    } else if (req.query.QrData) {
        QrData = req.query.QrData
        dateTime = req.query.dateTime
        isMorning = req.query.isMorning
    } else {
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
    }
    let login = ''
    var stop = 0
    for(i=0;QrData[i]!="|";i++){
        login = login.concat('', QrData[i])
        stop ++
    }

     var updateQuery = { login: login, date: dateTime }

     if (isMorning == 1) {
         console.log(isMorning)
         data = { morningSignature: 'present', lastModification: dateTime }
     } else if (isMorning == 0) {
         console.log(isMorning)
         data = { afternoonSignature: 'present', lastModification: dateTime }
     } else {
         return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
     }

     Signature.updateOne(updateQuery, {
         $set: data
     })

         .then(resData => {

             if (resData.length == 0) {
                 return res.status(404).json({
                     code: 404, message: 'Something is wrong about your parameters', datas: {
                         resp: resData,
                     }})
             } else {
                 return res.status(200).json({
                 code: 200, message: 'successfully update', datas: {
                     resp: resData,
                 }
             })}
         })
         .catch((err) => {
             console.log(err)
         })

}

exports.justification = function (req, res) {
    if (req.body.login) {
        login = req.body.login
        dateTime = req.body.dateTime
        isMorning = req.body.isMorning
    } else if (req.query.login) {
        login = req.query.login
        dateTime = req.query.dateTime
        isMorning = req.query.isMorning
    } else {
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
    }

    var updateQuery = { login: login, date: dateTime }

    if (isMorning == 1) {
        console.log(isMorning)
        data = { morningSignature: 'Late', lastModification: dateTime }
    } else if (isMorning == 0) {
        console.log(isMorning)
        data = { afternoonSignature: 'Late', lastModification: dateTime }
    } else {
        return res.status(400).json({ code: 400, message: 'Something is wrong about your parameters' })
    }

    Signature.updateOne(updateQuery, {
        $set: data
    })

        .then(resData => {

            if (resData.length == 0) {
                return res.status(404).json({
                    code: 404, message: 'Something is wrong about your parameters', datas: {
                        resp: resData,
                    }})
            } else {
                return res.status(200).json({
                code: 200, message: 'successfully update', datas: {
                    resp: resData,
                }
            })}
        })
        .catch((err) => {
            console.log(err)
        })

}

exports.historyByDate =function (req, res) {

    console.log("IdPromo:")
    console.log(req.params.idPromo)
    console.log("Date:")
    console.log(req.params.date)
   
    Signature.find({ promotion_id: req.params.idPromo, date: req.params.date })
    .then(resData => {

        if (resData.length == 0) {
            return res.status(404).json({
                code: 404, message: 'Does not exist', datas: {
                    resp: resData,
                }})
        } else {
            return res.status(200).json({
            code: 200, message: 'successfully get', datas: {
                resp: resData,
            }
        })}

        
    })
    .catch((err) => {
        console.log(err)
    })

}

exports.historyByUser =function (req, res) {

    console.log("Login:")
    console.log(req.params.login)

   
    Signature.find({ login: req.params.login})
    .then(resData => {
        if (resData.length == 0) {
            return res.status(404).json({
                code: 404, message: 'Does not exist', datas: {
                    resp: resData,
                }})
        } else {
            return res.status(200).json({
            code: 200, message: 'successfully get', datas: {
                resp: resData,
            }
        })}
    })
    .catch((err) => {
        console.log(err)
    })

}

exports.historyByUserDate =function (req, res) {

    console.log("Login:")
    console.log(req.params.login)
    console.log("Date:")
    console.log(req.params.date)

   
    Signature.find({ login: req.params.login, date: req.params.date})
    .then(resData => {
        if (resData.length == 0) {
            return res.status(404).json({
                code: 404, message: 'Does not exist', datas: {
                    resp: resData,
                }})
        } else {
            return res.status(200).json({
            code: 200, message: 'successfully get', datas: {
                resp: resData,
            }
        })
        }
        
    })
    .catch((err) => {
        console.log(err)
    })

}

