import 'package:flutter/material.dart';

Widget buildTextFormField(control, read, label) {
  return TextFormField(
    controller: control,
    readOnly: read,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}

Widget buildTextFormField2(control, read, label) {
  return TextFormField(
    controller: control,
    readOnly: read,
    decoration: InputDecoration(
        labelText: label,
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
  );
}
