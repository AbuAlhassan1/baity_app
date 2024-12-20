import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showBottomSheeet(
  BuildContext context,
  Widget widget,
  {
    bool isDismissible = true,
    bool enableDrag = true
  }
) => showMaterialModalBottomSheet(
  context: context,
  bounce: true,
  animationCurve: Curves.easeInOutCubic,
  duration: const Duration(milliseconds: 400),
  elevation: 0,
  expand: true,
  enableDrag: enableDrag,
  isDismissible: isDismissible,
  backgroundColor: Colors.transparent,
  builder: (context) => widget,
);