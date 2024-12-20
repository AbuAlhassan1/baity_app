import 'package:baity_app/home/views/home_horizontal.dart';
import 'package:baity_app/home/views/home_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(databaseRef.child("DriverShowOrdersDialog").get().toString());
    return LayoutBuilder(
      builder: (context, constraints) {
        if ((constraints.maxWidth + 100.sp) < constraints.maxHeight) {
          return const HomeVertical();
        } else {
          return const HomeHorizontal();
        }
      },
    );
  }
}