import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api service',
      debugShowCheckedModeBanner: false, // 去除debug标签
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
    ).modular(); //added this
  }
}
