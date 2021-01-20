import 'package:api_service/home/page/details_page.dart';
import 'package:api_service/home/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ChildRoute('/details', child: (_, args) => DetailsPage()),
  ];
}