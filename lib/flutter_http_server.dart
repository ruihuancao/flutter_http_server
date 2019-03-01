library flutter_http_server;
import 'dart:io';
import 'package:http_server/http_server.dart';

class FlutterHttpServer{

  static final FlutterHttpServer _instance = new FlutterHttpServer._internal();
  factory FlutterHttpServer() {
    return _instance;
  }
  FlutterHttpServer._internal();

  HttpServer _httpServer;

  void startServer(String dir, String index, int port) async{
    var staticFiles = VirtualDirectory(dir);
    staticFiles.allowDirectoryListing = true;
    staticFiles.directoryHandler = (dir, request) {
      var indexUri = Uri.file(dir.path).resolve(index);
      staticFiles.serveFile(File(indexUri.toFilePath()), request); /*3*/
    };
    _httpServer = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    await _httpServer.forEach(staticFiles.serveRequest); /*4*/
  }

  void stopServer({bool force: false}){
    if(_httpServer != null){
      _httpServer.close(force: force);
    }
  }
}


