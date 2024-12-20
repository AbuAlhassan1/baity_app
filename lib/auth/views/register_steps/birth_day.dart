import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:flutter/material.dart';

late TextFieldDataObject birthDayField;

class BirthDayStep extends StatefulWidget {
  const BirthDayStep({super.key});

  @override
  State<BirthDayStep> createState() => _BirthDayStepState();
}

class _BirthDayStepState extends State<BirthDayStep> {
  @override
  void initState() {
    birthDayField = TextFieldDataObject(
      name: "birthDay",
      lable: "Birth Day",
      hint: "01/01/1990",
      validator: (regex, value) => null,
      icon: const Icon(Icons.cake, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTextField(textFieldDataObject: birthDayField)
    );
  }
}