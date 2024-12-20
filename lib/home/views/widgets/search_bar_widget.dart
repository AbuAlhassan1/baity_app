import 'package:baity_app/common/views/material_textfield.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:baity_app/home/views/home_vertical.dart';
import 'package:baity_app/home/views/widgets/search_page.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(20)),
        child: InkWell(
          onTap: () => showSearchPage(context),
          child: IgnorePointer(
            child: MaterialTextField(textFieldDataObject: searchField),
          ),
        ),
      ),
    );
  }
}