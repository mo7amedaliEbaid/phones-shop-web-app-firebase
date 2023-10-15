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
    App.init(context);
    return ResponsiveBuilder(
      builder: (
        BuildContext context,
        SizingInformation sizingInformation,
      ) {
        return sizingInformation.isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lotties/homelottie.json"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome To Our Phones Shop",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Space.y1!,
                      GestureDetector(
                        onTap: () {
                          Provider.of<PageKeyProvider>(context, listen: false)
                              .key = '/phones';
                        },
                        child: Container(
                          height: AppDimensions.normalize(25),
                          width: AppDimensions.normalize(100),
                          padding: Space.all(),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(10)),
                          child:const Center(
                              child: Text(
                            "Start Shopping",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lotties/homelottie.json"),
                  const Text(
                    "Welcome To Our Phones Shop",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<PageKeyProvider>(context, listen: false).key =
                          '/phones';
                    },
                    child: Container(
                      height: AppDimensions.normalize(25),
                      width: AppDimensions.normalize(100),
                      padding: Space.all(),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Start Shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
