import 'package:baity_app/common/models/textfield_model.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:baity_app/home/views/widgets/categories_slider.dart';
import 'package:baity_app/home/views/widgets/current_location_bar.dart';
import 'package:baity_app/home/views/widgets/filtering_shortcuts.dart';
import 'package:baity_app/home/views/widgets/home_product_widget.dart';
import 'package:baity_app/home/views/widgets/search_bar_widget.dart';
import 'package:baity_app/home/views/widgets/specials_slider.dart';
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
    return Scaffold(
      body: CustomScrollView(
        clipBehavior: Clip.none,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: getSize(10))),
            
          // Current Location & Notification
          const CurrentLocationBar(),
          
          SliverToBoxAdapter(child: SizedBox(height: getSize(20))),
          
          // Search Bar
          const SearchBarWidget(),
            
          SliverToBoxAdapter(child: SizedBox(height: getSize(20))),
            
          // Slider
          const SpecialsSlider(),
            
          SliverToBoxAdapter(child: SizedBox(height: getSize(20))),
          
          // Categories
          const CategoriesSlider(),
          
          // SliverToBoxAdapter(child: SizedBox(height: getSize(20))),
            
          // Filtering Shortcuts
          const FilteringShortcuts(),
            
          SliverToBoxAdapter(child: SizedBox(height: getSize(10))),
            
          // Products List
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: getSize(10),
                mainAxisSpacing: getSize(10),
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => const HomeProductWidget(),
                childCount: 20,
              ),
            ),
          ),
            
          SliverToBoxAdapter(child: SizedBox(height: getSize(100))),
        ],
      ),
    );
  }
}