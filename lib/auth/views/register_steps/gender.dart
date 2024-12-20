import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject genderField;

class GenderStep extends StatefulWidget {
  const GenderStep({super.key});

  @override
  State<GenderStep> createState() => _GenderStepState();
}

class _GenderStepState extends State<GenderStep> {
  @override
  void initState() {
    genderField = TextFieldDataObject(
      name: "gender",
      lable: "Gender",
      hint: "Male",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.gender_agender, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTextField(textFieldDataObject: genderField)
    );
  }
}