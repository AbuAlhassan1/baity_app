import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  const CategoryCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      padding: EdgeInsets.only(left: getSize(10), right: getSize(10), bottom: getSize(10)),
      // margin: EdgeInsets.only(bottom: getSize(20)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getSize(10)),
          const Text("Category Name"),
          SizedBox(height: getSize(10)),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),

                SizedBox(width: getSize(10)),

                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),

                SizedBox(width: getSize(10)),

                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                )
              ]
            ),
          ),

          SizedBox(height: getSize(10)),
          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),

                SizedBox(width: getSize(10)),

                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
                
                SizedBox(width: getSize(10)),

                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                )
              ]
            ),
          ),

        ]
      ),
    );
  }
}