
/* main file of Simple Chat Server Client */

var readline = require('readline');
var WebSocketClient = require('websocket').client

var host = process.argv[2];

rl = readline.createInterface(process.stdin, process.stdout);

rl.setPrompt('> ');
rl.prompt();
var client = new WebSocketClient();

client.on('connectFailed', function(error) {
    console.log('Connect Error: ' + error.toString());
    process.exit();
});

client.on('connect', function(connection) {
    connection.on('error', function(error) {
        console.log("Connection Error: " + error.toString());
        process.exit();
    });

    connection.on('close', function(reasonCode, description) {
        console.log('chat Connection Closed. Code=' + reasonCode + ' (' + description +')');
    });

    connection.on('message', function(message) {
        if (message.type === 'utf8') {
            console.log('\r=> ' + message.utf8Data);
            rl.prompt();
        }
    });

    rl.on('line', function(line) {
        connection.sendUTF(line);
        rl.prompt();
    });

    rl.on('close', function() {
        connection.close();
        console.log('Have a great day!');
        process.exit(0);
    });

    rl.prompt();
});
client.connect("ws://" + host +"/terminal", "chat");
