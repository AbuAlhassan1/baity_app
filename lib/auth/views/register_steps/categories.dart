import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/common/views/material_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject categoryField;

class CategoriesStep extends StatefulWidget {
  const CategoriesStep({super.key});

  @override
  State<CategoriesStep> createState() => _CategoriesStepState();
}

class _CategoriesStepState extends State<CategoriesStep> {
  @override
  void initState() {
    categoryField = TextFieldDataObject(
      name: "category",
      lable: "Category",
      hint: "Category",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.category, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTextField(textFieldDataObject: categoryField)
    );
  }
}