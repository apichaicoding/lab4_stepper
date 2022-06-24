import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab4_stepper/controller/home_controller.dart';
import 'package:lab4_stepper/widget/build_text_form_field.dart';

class ResultPage extends GetView<HomeController> {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTextFormField2(controller.firstname.value, true, 'First Name'),
            buildTextFormField2(controller.lastname.value, true, 'Last Name'),
            buildTextFormField2(controller.address.value, true, 'Address'),
            buildTextFormField2(controller.postcode.value, true, 'Postcode'),
            buildTextFormField2(controller.mobile.value, true, 'Mobile'),
          ],
        ),
      ),
    );
  }
}
