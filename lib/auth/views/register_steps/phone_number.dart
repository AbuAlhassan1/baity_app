import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject phoneNumberField;

class PhoneNumberStep extends StatefulWidget {
  const PhoneNumberStep({super.key});

  @override
  State<PhoneNumberStep> createState() => _PhoneNumberStepState();
}

class _PhoneNumberStepState extends State<PhoneNumberStep> {
  @override
  void initState() {
    phoneNumberField = TextFieldDataObject(
      name: "phone_number",
      lable: "Phone Number",
      hint: "0700000000",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.phone, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTextField(textFieldDataObject: phoneNumberField)
    );
  }
}