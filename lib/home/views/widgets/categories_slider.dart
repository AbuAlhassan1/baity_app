import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  const CategoriesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(20)),
        child: SizedBox(
          height: getSize(120),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: getSize(index != 0 ? 10 : 0)),
                width: getSize(80),
                child: Column(
                  children: [
                    Container(
                      width: getSize(80),
                      height: getSize(80),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDDDDDD),
                        borderRadius: BorderRadius.circular(getSize(50)),
                      ),
                    ),
                    SizedBox(height: getSize(5)),
                    Text(
                      "Category $index",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getSize(14),
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}