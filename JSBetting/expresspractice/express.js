var express = require('express');
var app = express();
app.disable('x-powered-by');

app.set('port', process.env.PORT || 3000);

app.get('/', function(req,res){
	res.send('Express Works');
});

app.listen(app.get('port'),function(){
	console.log('Express started...')
});