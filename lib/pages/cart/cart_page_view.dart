import 'package:flutter/material.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
