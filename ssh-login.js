var Connection = require('ssh2');
var argv = require('optimist')
    .usage('Usage: $0 -h [hostname] -u [username] -p [password] -s [clientscript]')
    .demand(['h', 'u', 'p', 's'])
    .argv;

var c = new Connection();
// c.on('connect', function() {
//   console.log('Connection :: connect');
// });
c.on('ready', function() {
  // console.log('Connection :: ready');
  c.sftp(function(err, sftp) {
    if (err) throw err;
    // sftp.on('end', function() {
    //   console.log('SFTP :: SFTP session closed');
    // });
    sftp.fastPut(argv.s, '/tmp/client.bash', function(err){
      if (err) throw err;
      c.exec('chmod +x /tmp/client.bash && bash /tmp/client.bash', function(err, stream) {
        if (err) throw err;
        stream.on('data', function(data, extended) {
          console.log((extended === 'stderr' ? 'STDERR: ' : 'STDOUT: ')
                      + data);
        });
        // stream.on('end', function() {
        //   console.log('Stream :: EOF');
        // });
        // stream.on('close', function() {
        //   console.log('Stream :: close');
        // });
        stream.on('exit', function(code, signal) {
          // console.log('Stream :: exit :: code: ' + code + ', signal: ' + signal);
          c.end();
        });
      });
    });
  });
});
c.on('error', function(err) {
  if (error !== null) console.log('Connection :: error :: ' + err);
});
// c.on('end', function() {
//   console.log('Connection :: end');
// });
// c.on('close', function(had_error) {
//   console.log('Connection :: close');
// });
c.connect({
  host: argv.h,
  port: 22,
  username: argv.u,
  //privateKey: require('fs').readFileSync('/home/rlee/key')
  password: argv.p
});

// example output:
// Connection :: connect
// Connection :: ready
// STDOUT:  17:41:15 up 22 days, 18:09,  1 user,  load average: 0.00, 0.01, 0.05
//
// Stream :: exit :: code: 0, signal: undefined
// Connection :: end
// Connection :: close
