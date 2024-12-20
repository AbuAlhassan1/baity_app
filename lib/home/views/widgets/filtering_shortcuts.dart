import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';

class FilteringShortcuts extends StatelessWidget {
  const FilteringShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      // toolbarHeight: getSize(40),
      backgroundColor: const Color(0xffeeeeee),
      surfaceTintColor: const Color(0xffeeeeee),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            child: SizedBox(
              height: getSize(60),
              child: SafeArea(
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: getSize(index != 0 ? 10 : 0)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD5D5D5),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(getSize(20)),
                        ),
                      ),
                      child: Text(
                        "Filter $index",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getSize(13),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}