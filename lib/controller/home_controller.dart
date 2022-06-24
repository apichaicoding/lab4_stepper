// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentSteps = 0.obs;
  final firstname = TextEditingController().obs;
  final lastname = TextEditingController().obs;
  final address = TextEditingController().obs;
  final postcode = TextEditingController().obs;
  final mobile = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
