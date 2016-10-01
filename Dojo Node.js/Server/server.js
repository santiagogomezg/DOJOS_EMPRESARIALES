var http = require('http');
var url = require('url');

function start(route,handle){
	function onRequest(request, response){
		var pathname = url.parse(request.url).pathname;
		console.log('La petición para ' + pathname +'  fue recibida');
		route(handle,pathname,response);
	}

	http.createServer(onRequest).listen(8888);
	console.log('El servidor fue iniciado');
}
exports.start = start;