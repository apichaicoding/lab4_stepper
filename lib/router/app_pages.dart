// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:lab4_stepper/bindings/home_bindings.dart';
import 'package:lab4_stepper/page/home_page.dart';
part "app_routes.dart";

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static String title = "Lab4 Stepper Form";

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(title),
      binding: HomeBinding(),
    ),
  ];
}
