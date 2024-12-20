import 'package:baity_app/cart/views/cart_page_wrapper.dart';
import 'package:baity_app/categories/views/categories_page_wrapper.dart';
import 'package:baity_app/common/views/bottom_navigation_bar.dart';
import 'package:baity_app/home/views/home_page_wrapper.dart';
import 'package:flutter/material.dart';

late TabController tabController;

class PagesWrapper extends StatefulWidget {
  const PagesWrapper({super.key});

  @override
  State<PagesWrapper> createState() => _PagesWrapperState();
}

class _PagesWrapperState extends State<PagesWrapper> with SingleTickerProviderStateMixin {
  
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          TabBarView(
            controller: tabController,
            children: const [
              HomePageWrapper(),
              CartPageWrapper(),
              CategoriesPageWrapper(),
              Scaffold(backgroundColor: Colors.grey),
              HomePageWrapper(),
            ],
          ),
          
          const CustomBottomNavigationBar(),
          
        ],
      ),
    );
  }
}