import 'package:api_service/common/horizontal_drag.dart';
import 'package:api_service/page/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app.dart';
import 'home/home_module.dart';

/// 主路由模块
class AppModule extends MainModule {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => LoginPage()),
    //added HomeModule
    ModuleRoute('/home', module: HomeModule()),
  ];
  @override
  final Widget bootstrap = AppWidget();
}
