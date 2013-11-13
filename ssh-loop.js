var connection = require('ssh2');
var config = require('./ssh-loop.json');
var exec = require('child_process').exec, child;

// console.log(config.server);
// console.log(config.username);
// console.log(config.password);
// console.log(config.clientscript);

for (var i = 0; i <= config.server.length - 1; i++) {
	console.log(config.server[i]);
	var commandstr = 'node ./ssh-login.js' +
		' -h ' + config.server[i] +
		' -u ' + config.username +
		' -p ' + config.password +
		' -s ' + config.clientscript;
	//console.log(commandstr);
	exec(commandstr, function (error, stdout, stderr) {
    	if (stdout !== '') console.log('stdout: ' + stdout);
    	if (stderr !== '') console.log('stderr: ' + stderr);
    	if (error !== null) {
      		console.log('exec error: ' + error);
    	}
	});
};

