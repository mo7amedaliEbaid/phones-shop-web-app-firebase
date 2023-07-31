import 'package:ecommerce_firebase/pages/home/widgets/desktop_image_list_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/configs.dart';
import '../../providers/page_key_provider.dart';
class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
            Row(
                  children: [
                    DesktopImageListView(starIndex: 0),
                    DesktopImageListView(starIndex: 1),
                    DesktopImageListView(starIndex: 2),
                  ],
                ),
          Expanded(child: Space.xf(20)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space.yf(7),
                Expanded(
                  child: Text(
                    'Welcome to \n our phones shop',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w600,color: Colors.brown),
                    textAlign: TextAlign.center,
                  ),
                ),
                Space.y1!,
                 RichText(
                   text: TextSpan(
                     text: 'Don\'t have a phone?\n',
                     style: Theme.of(context)
                         .textTheme
                         .titleLarge
                         ?.copyWith(
                       color: Color(0xff6c520e),
                       fontSize: 35
                     ),
                     children: [
                       TextSpan(
                         text: 'Start shopping',
                         style: Theme.of(context)
                             .textTheme
                             .displaySmall!
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
                Space.yf(7),
              ],
            ),
          ),
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