import 'dart:io';

import 'package:flutter/material.dart';

class SidebarNav extends StatefulWidget {
  @override
  _SidebarNavState createState() => _SidebarNavState();
}

class _SidebarNavState extends State<SidebarNav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          // color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.camera,
                  // color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "最近",
                  style: TextStyle(
                    // color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            // Theme.of(context).theme
          },
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.camera,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "项目",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.camera,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "团队",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () async {
            var server =
                await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
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
          },
        ),
      ],
    );
  }
}
