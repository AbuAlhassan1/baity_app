import 'package:baity_app/helper/getsize.dart';
import 'package:baity_app/helper/show_bottom_sheet.dart';
import 'package:flutter/material.dart';

void showStepBottomSheet({
  required BuildContext context,
  required Widget step,
  required Function onNext,
  required int stepIndex,
}) => showBottomSheeet(
  context,
  SafeArea(child: Padding(
    padding: EdgeInsets.only(top: getSize(stepIndex * 20)),
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(getSize(20))),
      child: Container(
        margin: EdgeInsets.only(top: getSize(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(getSize(20))),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(getSize(20)),
          child: Column(
            children: [

              SizedBox(height: getSize(50)),
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: getSize(30),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getSize(10)),
              Text(
                "Fill your information below",
                style: TextStyle(
                  fontSize: getSize(14),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getSize(50)),


              step,


              SizedBox(height: getSize(20)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => onNext(),
                      child: const Text("Next")
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ),
  )),
  isDismissible: stepIndex == 1,
  enableDrag: stepIndex == 1,
);