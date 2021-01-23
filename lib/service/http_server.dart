import 'dart:io';

Future<void> startServer() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    print(request.method);
    print(request.asyncMap((event) => print(event)));
    print(request.requestedUri);
    if (request.uri.path == "/test") {
      request.response
        ..headers.contentType =
            new ContentType("text", "plain", charset: "utf-8")
        ..write('test')
        ..close();
    } else {
      request.response
        ..headers.contentType =
            new ContentType("text", "plain", charset: "utf-8")
        ..write('root file')
        ..close();
    }
  }
}
