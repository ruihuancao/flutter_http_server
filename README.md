# flutter_http_server

Flutter Http Server

## Getting Started

```

import 'dart:io';
import 'package:path/path.dart';
import 'flutter_http_server.dart';

void main(){
  var pathToBuild = join(dirname(Platform.script.toFilePath()), "html");
  FlutterHttpServer().startServer(pathToBuild, "index.html", 8080);
}

```