import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject password;
late TextFieldDataObject confirmPassword;

class PasswordStep extends StatefulWidget {
  const PasswordStep({super.key});

  @override
  State<PasswordStep> createState() => _PasswordStepState();
}

class _PasswordStepState extends State<PasswordStep> {
  @override
  void initState() {
    password = TextFieldDataObject(
      name: "passowrd",
      lable: "Password",
      hint: "********",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.lock, color: Colors.grey),
    );
    confirmPassword = TextFieldDataObject(
      name: "confirm_passowrd",
      lable: "Confirm Password",
      hint: "********",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.lock, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          MaterialTextField(textFieldDataObject: password),
          SizedBox(height: getSize(10)),
          MaterialTextField(textFieldDataObject: confirmPassword),
        ],
      )
    );
  }
}