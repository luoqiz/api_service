import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:window_size/window_size.dart' as window_size;

import 'app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    // 获取窗口信息，然后设置窗口信息
    window_size.getWindowInfo().then((window) {
      if (window.screen != null) {
        //设置窗口顶部标题
        window_size.setWindowTitle('api-service');
        window_size.setWindowMaxSize(Size.infinite);

        final screenFrame = window.screen.visibleFrame;
        final width = math.max((screenFrame.width / 2).roundToDouble(), 1400.0);
        final height =
            math.max((screenFrame.height / 2).roundToDouble(), 900.0);
        final left = ((screenFrame.width - width) / 2).roundToDouble();
        final top = ((screenFrame.height - height) / 3).roundToDouble();
        final frame = Rect.fromLTWH(left, top, width, height);
        //设置窗口信息
        window_size.setWindowFrame(frame);
      }
    });
  }

  runApp(ModularApp(
    module: AppModule(),
  ));
}
