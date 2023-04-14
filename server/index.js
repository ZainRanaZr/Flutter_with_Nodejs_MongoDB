// Importing Express Module
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const PORT = process.env.PORT || 3000;
const server = http.createServer(app);

// const io = require('socket.io')(server);
const {Server} = require('socket.io');
const io = new  Server(server);
// Client -> Middle ware -> Server
// Middle ware
app.use(express.json());

const DB = "mongodb+srv://flutterapp:app%40flutter!1211@cluster0.zq0nkxz.mongodb.net/flutterDb?retryWrites=true&w=majority";
io.on('connection', (socket) => {
    console.log("connected");

    socket.on('createRoom', ({nickname})=>{
        console.log(nickname);
    });
});



mongoose.connect(DB).then(()=>{
    console.log("Connection Successfull!");
}).catch((e)=>{
    console.log(e);
});

app.get('/', (req, res)=>{
    res.send('data');
})

server.listen(PORT, '0.0.0.0' ,()=>{
   console.log(`Server is starting on PORT ${PORT}`); 
})