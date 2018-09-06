const server = require('net').createServer();

let counter=0;  

server.on('connection', socket1=>{
    socket1.id=counter++;
    console.log('Client Connection');
    socket1.write('Welcome to new Client !! \n');
    socket1.on('data', data1=>{
        console.log('data: ', data1);
        socket1.write('Client Window [' + socket1.id + '] :'+ data1);
    });
    socket1.on('end', ()=> {
        console.log('Client disconnected !!');
    })
    socket1.setEncoding('utf8');


    
})

server.listen(8000, ()=> { console.log("Server Bound")});