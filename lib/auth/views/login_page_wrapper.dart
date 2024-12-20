import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:baity_app/helper/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

void showLoginPage(BuildContext context) => showBottomSheeet(
  context,
  SafeArea(child: Padding(
    padding: EdgeInsets.only(top: getSize(20)),
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(getSize(20))),
      child: const LoginPageWrapper()
    ),
  )),
);

late TextFieldDataObject emailField;
late TextFieldDataObject passwordField;

class LoginPageWrapper extends StatefulWidget {
  const LoginPageWrapper({super.key});

  @override
  State<LoginPageWrapper> createState() => _LoginPageWrapperState();
}

class _LoginPageWrapperState extends State<LoginPageWrapper> {

  @override
  void initState() {
    emailField = TextFieldDataObject(
      name: "email",
      lable: "Email",
      hint: "example@example.com",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.mail, color: Colors.grey),
    );
    passwordField = TextFieldDataObject(
      name: "password",
      lable: "Password",
      hint: "********",
      validator: (regex, value) => null,
      isPassword: true,
      icon: const Icon(TablerIcons.lock, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(getSize(20)),
        child: Column(
          children: [

            SizedBox(height: getSize(50)),
            Text(
              "Sign in",
              style: TextStyle(
                fontSize: getSize(30),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: getSize(10)),
            Text(
              "Hi! Welcome back, you've been missed",
              style: TextStyle(
                fontSize: getSize(14),
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: getSize(50)),
            MaterialTextField(textFieldDataObject: emailField),
            SizedBox(height: getSize(20)),
            MaterialTextField(textFieldDataObject: passwordField),
            SizedBox(height: getSize(20)),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text("Sign in")
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}