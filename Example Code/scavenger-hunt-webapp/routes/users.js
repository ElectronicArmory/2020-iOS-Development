var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log(req.headers);
  res.json({"username":"Mike", "password": "password123"});
});

module.exports = router;
