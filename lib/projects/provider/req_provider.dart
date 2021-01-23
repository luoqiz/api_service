import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../project_bean.dart';

class ReqProvider extends ChangeNotifier implements ReassembleHandler {

  List<Req> activeReqList = [];

  void add(Req req){
    activeReqList.add(req);
    print(activeReqList.length);
    notifyListeners();
  }

  void remove(Req req){
    activeReqList.remove(req);
    notifyListeners();
  }

  @override
  void reassemble() {
    print('Did hot-reload');
  }
}

