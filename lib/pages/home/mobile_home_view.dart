import 'package:ecommerce_firebase/configs/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/app.dart';
import '../../providers/page_key_provider.dart';
import 'widgets/mobile_image_list_view.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    App.init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: -10,
              left: -150,
              child: Row(
                children: [
                  ImageListView(starIndex: 0),
                  ImageListView(starIndex: 1),
                  ImageListView(starIndex: 2),
                ],
              )),
          Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: AppDimensions.normalize(120),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                      Colors.transparent,
                      Colors.white60,
                          Color(0xffe0ded3),
                          Color(0xffcbc9b7),
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to \n our phones shop',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600,color: Colors.brown),
                      textAlign: TextAlign.center,
                    ),
                    Space.y2!,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Don\'t have a phone?\n',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Color(0xff6c520e),
                                ),
                            children: [
                              TextSpan(
                                text: 'Start shopping',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.brown,
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
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
              )),
          /*Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: TapGestureRecognizer()
                      ..onTap = () {
                        Provider.of<PageKeyProvider>(context, listen: false)
                            .key = '/phones';
                      },
                    child: const Text("Sign Up with Email")),
              ))*/
        ],
      ),
    );
  }
}
