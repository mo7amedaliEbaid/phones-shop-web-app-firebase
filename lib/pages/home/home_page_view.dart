import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../providers/page_key_provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (
        BuildContext context,
        SizingInformation sizingInformation,
      ) {
        return AnimatedContainer(
          constraints: sizingInformation.isDesktop
              ? const BoxConstraints(maxWidth: 1200)
              : BoxConstraints(
                  maxWidth: sizingInformation.screenSize.width,
                ),
          duration: const Duration(milliseconds: 60),
          padding: sizingInformation.isDesktop
              ? const EdgeInsets.symmetric(horizontal: 90)
              : const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have a phone?\n',
                style: Theme.of(context).textTheme.headline2,
                children: [
                  TextSpan(
                    text: 'Start shopping',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Provider.of<PageKeyProvider>(context, listen: false)
                            .key = '/phones';
                      },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
