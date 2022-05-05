const express = require('express')
const router = express.Router()
const UserController = require('../Controllers/UserController')
const PromoController = require('../Controllers/PromoController')

router.post('/auth',UserController.login)
router.post('/createFeedData',PromoController.getPromoId)
//router.post('/getStudents',
router.put('/justification', PromoController.justification)
router.put('/checkin', PromoController.checkin)

router.get('/historyByDate/:idPromo/:date', PromoController.historyByDate)
router.get('/historyByUser/:login', PromoController.historyByUser)
router.get('/historyByUser/:login/:date', PromoController.historyByUserDate)

//router.put('/checkin/:id',

module.exports = router

