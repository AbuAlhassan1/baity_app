import 'package:baity_app/common/models/textfield_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

late TextFieldDataObject searchField;

class HomeVertical extends StatefulWidget{
  const HomeVertical({super.key});

  @override
  State<HomeVertical> createState() => _HomeVerticalState();
}

class _HomeVerticalState extends State<HomeVertical> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    searchField = TextFieldDataObject(
      name: "search",
      hint: "Search",
      validator: (regex, value) => null,
      icon: const Icon(TablerIcons.search, color: Colors.grey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}