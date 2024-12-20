import 'dart:math';
import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getSize(20), vertical: getSize(10)),
      child: Row(
        children: [
          Container(
            width: getSize(100),
            height: getSize(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://picsum.photos/id/${Random().nextInt(200)}/200/300"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(getSize(5)),
              border: Border.all(color: Colors.black.withOpacity(0.1), width: getSize(0.5)),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product Name'),
              Text('Price'),
              Text('Quantity'),
            ],
          ),

          // Remove button
          const Spacer(),
          IconButton(
            icon: const Icon(TablerIcons.trash),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}