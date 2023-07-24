import 'package:flutter/material.dart';

class OrdersPageView extends StatelessWidget {
  const OrdersPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Orders Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
