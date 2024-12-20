import 'dart:math';

import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomeProductWidget extends StatelessWidget {
  const HomeProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffdddddd),
              borderRadius: BorderRadius.circular(getSize(5)),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                    child: Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: getSize(16),
                        color: Colors.black
                      ),
                    ),
                  ),
              
                  Row(
                    children: [
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: getSize(12),
                          color: Colors.black
                        ),
                      ),
                      Icon(TablerIcons.star_filled, color: Colors.orange, size: getSize(12)),
                    ],
                  )
                ],
              ),
              Text(
                "Price: \$${(Random().nextInt(10) + 1) * Random().nextInt(10)}",
                style: TextStyle(
                  fontSize: getSize(12),
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}