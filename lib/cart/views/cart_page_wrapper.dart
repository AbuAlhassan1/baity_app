import 'package:baity_app/cart/views/cart_item.dart';
import 'package:baity_app/helper/getsize.dart';
import 'package:flutter/material.dart';

class CartPageWrapper extends StatelessWidget {
  const CartPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: const Color(0xffeeeeee),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: getSize(100)),
        children: List<Widget>.generate(
          3,
          (index) => const CartItem(),
        ) + [
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            child: const ListTile(
              title: Text('Total'),
              trailing: Text('Total Price'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(20)),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}