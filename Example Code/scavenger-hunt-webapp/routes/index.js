var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  var geoCaches = [
    {
    "id": 0,
    "name":"Star Wars Toy",
    "location": { "latitude":43.60278575, "longitude":-116.1958694 },
    "description":"Luke Skywalker"
    },
    {
    "id": 1,
    "name":"Ham Sandwich",
    "location": { "latitude":43.60683334, "longitude":-116.2075746 },
    "description":"Moldy, but good."
    },
    {
    "id": 2,
    "name":"Pokemon Expansion",
    "location": { "latitude":43.61533262132795, "longitude":-116.20355129241943 },
    "description":"CS402"
    },
    {
    "id": 3,
    "name":"Book",
    "location": { "latitude":43.60080457674612, "longitude":-116.19821906089783 },
    "description":"Edgar Allan Poe book. Original signed."
    }
  ];
  res.json(geoCaches);
});

module.exports = router;
