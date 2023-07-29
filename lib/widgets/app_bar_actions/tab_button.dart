import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/page_key_provider.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    this.route,
    required this.title,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final String? route;
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.9),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(
          title,
          style: TextStyle(
            color: context.watch<PageKeyProvider>().key == route
                ? Colors.white
                : Colors.brown,
          ),
        ),
        icon: Icon(
          iconData,
          color: context.watch<PageKeyProvider>().key == route
              ? Colors.white
              : Colors.brown,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            context.watch<PageKeyProvider>().key == route
                ? Color(0xffcbc9b7)
                : Color(0xffcbc9b7),
          ),
        ),
      ),
    );
  }
}
