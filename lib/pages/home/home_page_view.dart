import 'package:ecommerce_firebase/pages/home/desktop_home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../providers/page_key_provider.dart';
import 'mobile_home_view.dart';

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
                ?  BoxConstraints(maxWidth: sizingInformation.screenSize.width*.925)
                : BoxConstraints(
                    maxWidth: sizingInformation.screenSize.width,
                  ),
            duration: const Duration(milliseconds: 60),
            padding: sizingInformation.isDesktop
                ? const EdgeInsets.symmetric(horizontal: 90)
                : const EdgeInsets.symmetric(horizontal: 0),
            child: sizingInformation.isDesktop
                ? DesktopHomeView()
                : MobileHomeView());
      },
    );
  }
}
