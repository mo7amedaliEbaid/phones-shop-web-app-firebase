import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../configs/app.dart';
import '../../configs/configs.dart';
import '../../providers/page_key_provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    App.init(context);

      return Stack(
        children: [
          Lottie.asset("assets/lotties/homelottie.json"),
          Positioned(
            bottom: size.height * .8,
            left: size.width*0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have a phone?         ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.black, fontSize: 35),
                    children: [
                      TextSpan(
                        text: 'Start shopping',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Provider.of<PageKeyProvider>(context,
                                    listen: false)
                                .key = '/phones';
                          },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      );

  }
}
