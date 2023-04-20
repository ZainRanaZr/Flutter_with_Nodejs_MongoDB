// Importing Express Module
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
require('dotenv').config()

const app = express();
const PORT = process.env.PORT || 3000;
const server = http.createServer(app);
const Room = require('./models/room');
// const io = require('socket.io')(server);
const {Server} = require('socket.io');
const io = new  Server(server);
// Client -> Middle ware -> Server
// Middle ware
app.use(express.json());
const DB = process.env.DBURI;
io.on('connection', (socket) => {
    console.log("connected");

    socket.on('createRoom', async ({ nickname }) => {
        console.log(nickname);
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname,
                playerType: 'X',
            }
            room.players.push(player);
            room.turn = player;

            room = await room.save();

            console.log(room);
            const roomId = room._id.toString();
            console.log(roomId);
            socket.join(roomId);

            // io -> send datato everyone
            // socket -> sending / manipulating data to yourself
            io.to(roomId).emit('createRoomSuccess', room); 
        } catch (e) {
            console.log(e);
        }
    });
});

mongoose.connect(DB).then(() => {
    console.log("Connection Successfull!");
}).catch((e) => {
    console.log(e);
});

app.get('/', (req, res) => {
    res.send('data');
})

server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is starting on PORT ${PORT}`);
})