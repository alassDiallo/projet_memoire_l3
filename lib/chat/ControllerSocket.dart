import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket socket;

  createSocketConnection() {
    socket = IO.io("http://10.156.81.236:3000/", <String, dynamic>{
      'transports': ['websocket'],
    });

    this.socket.on("connect", (_) => print('Connected'));
    this.socket.on("disconnect", (_) => print('Disconnected'));
  }
}
