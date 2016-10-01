function route(handle,pathname,response){
	console.log('Se va a invocar la función para '+ pathname);
	if(typeof handle[pathname]=== 'function'){
		return handle[pathname](response);
	}else{
		console.log('No se encontró el manipulador para ' + pathname);
		response.writeHead(404,{'Content-Type':'text/html'});
		response.write('Dirección no disponible');
		response.end();
	}
}
exports.route = route;