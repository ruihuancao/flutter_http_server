import 'dart:io';
import 'package:path/path.dart';
import 'flutter_http_server.dart';

void main(){
  var pathToBuild = join(dirname(Platform.script.toFilePath()), "html");
  print(pathToBuild);
  FlutterHttpServer().startServer(pathToBuild, "index.html", 8080);
}