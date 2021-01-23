import 'package:api_service/projects/provider/req_provider.dart';
import 'package:api_service/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ReqProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, model, child) => MaterialApp(
          title: 'api service',
          debugShowCheckedModeBanner: false,
          // 去除debug标签
          theme: model.currentTheme,
          initialRoute: "/login",
        ).modular(),
      ),
    ); //added this
  }
}
