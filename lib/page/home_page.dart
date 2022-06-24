// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab4_stepper/controller/home_controller.dart';
import 'package:lab4_stepper/page/result_page.dart';
import 'package:lab4_stepper/widget/build_text_form_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title),
          ),
          body: Obx(() => Stepper(
                type: StepperType.vertical,
                steps: getSteps(),
                currentStep: controller.currentSteps.value,
                onStepContinue: () {
                  final isLastStep =
                      controller.currentSteps.value == getSteps().length - 1;
                  if (isLastStep) {
                    print('Complete');
                    Get.to(
                      () => ResultPage(),
                    );
                  } else {
                    controller.currentSteps.value += 1;
                  }
                },
                onStepCancel: () {
                  controller.currentSteps.value == 0
                      ? null
                      : controller.currentSteps.value -= 1;
                },
                onStepTapped: (step) {
                  controller.currentSteps.value = step;
                },
                controlsBuilder: (context, detail) {
                  final isLastStep =
                      controller.currentSteps.value == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: detail.onStepContinue,
                            child: Text(isLastStep ? 'Confirm' : 'Next'),
                          ),
                        ),
                        if (controller.currentSteps.value != 0)
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: detail.onStepCancel,
                              child: Text('Back'),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              )),
        ));
  }

  List<Step> getSteps() => [
        Step(
            title: Text("Name"),
            content: Column(
              children: [
                buildTextFormField(
                    controller.firstname.value, false, 'First Name'),
                buildTextFormField(
                    controller.lastname.value, false, 'Last Name'),
              ],
            ),
            isActive: controller.currentSteps.value >= 0,
            state: controller.currentSteps.value > 0
                ? StepState.complete
                : StepState.indexed),
        Step(
            title: Text("Address"),
            content: Column(
              children: [
                buildTextFormField(controller.address.value, false, 'Address'),
                buildTextFormField(
                    controller.postcode.value, false, 'Postcode'),
                buildTextFormField(controller.mobile.value, false, 'Mobile'),
              ],
            ),
            isActive: controller.currentSteps.value >= 1,
            state: controller.currentSteps.value > 1
                ? StepState.complete
                : StepState.indexed),
        Step(
            title: Text("Complete"),
            content: Column(
              children: [
                buildTextFormField2(
                    controller.firstname.value, true, 'First Name'),
                SizedBox(
                  height: 15,
                ),
                buildTextFormField2(
                    controller.lastname.value, true, 'Last Name'),
                SizedBox(
                  height: 15,
                ),
                buildTextFormField2(controller.address.value, true, 'Address'),
                SizedBox(
                  height: 15,
                ),
                buildTextFormField2(
                    controller.postcode.value, true, 'Postcode'),
                SizedBox(
                  height: 15,
                ),
                buildTextFormField2(controller.mobile.value, true, 'Mobile'),
              ],
            ),
            isActive: controller.currentSteps.value >= 2),
      ];
}
