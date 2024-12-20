import 'package:baity_app/common/views/material_textfield.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:baity_app/home/views/home_vertical.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showSearchPage(BuildContext context){
  showMaterialModalBottomSheet(
    context: context,
    bounce: true,
    animationCurve: Curves.easeInOutCubic,
    elevation: 0,
    expand: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const SearchPageWrapper(),
  );
}

class SearchPageWrapper extends StatelessWidget {
  const SearchPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getSize(50)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(getSize(20))),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(20)),
        child: Column(
          children: [
        
            SizedBox(height: getSize(20)),

            MaterialTextField(textFieldDataObject: searchField),
        
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text("Item $index"),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}