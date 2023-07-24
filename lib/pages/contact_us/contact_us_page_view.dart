import 'package:flutter/material.dart';

class ContactUsPageView extends StatelessWidget {
  const ContactUsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact Us Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
