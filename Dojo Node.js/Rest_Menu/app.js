var express = require("express");
var bodyParser = require("body-parser");
var routes = require('./routes');

var app = express();

app.listen(4242, function(){
	console.log("El puerto 4242 funciona");
});

app.use(bodyParser.urlencoded({extend: true}));
app.use('/', routes);
