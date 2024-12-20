import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject nameField;

class NameStep extends StatefulWidget {
  const NameStep({super.key});

  @override
  State<NameStep> createState() => _NameStepState();
}

class _NameStepState extends State<NameStep> {
  @override
  void initState() {
    nameField = TextFieldDataObject(
      name: "name",
      lable: "Name",
      hint: "John Doe",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.user, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTextField(textFieldDataObject: nameField)
    );
  }
}