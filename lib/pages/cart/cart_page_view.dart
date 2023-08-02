import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/configs/app_dimensions.dart';
import 'package:ecommerce_firebase/configs/configs.dart';
import 'package:ecommerce_firebase/pages/cart/widgets/cartlist_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import '../../services/authentication_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _commentTextEditingController =
      TextEditingController();
  bool isPostedComment = false;

  //pay package for the app
  late final Future<PaymentConfiguration> _googlePayConfigFuture;
  List<PaymentItem> _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  @override
  void initState() {
    super.initState();
    _googlePayConfigFuture = PaymentConfiguration.fromAsset('pay.json');
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = locator<AuthenticationService>().currentUser;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.transparent),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Cartlist",
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
        ),
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 60),
            constraints: sizingInformation.isDesktop
                ? const BoxConstraints(maxWidth: 1400)
                : BoxConstraints(
                    maxWidth: sizingInformation.screenSize.width,
                  ),
            child: Padding(
              padding: sizingInformation.isDesktop
                  ? Space.all(7, 2)
                  : Space.all(1, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(user!.uid)
                            .collection('cart')
                            .orderBy(
                              "datePublished",
                              descending: true,
                            )
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.brown,
                              ),
                            );
                          }
                          return Container(
                            height: sizingInformation.isMobile
                                ? sizingInformation.screenSize.height * .75
                                : sizingInformation.isDesktop
                                    ? sizingInformation.screenSize.height * .78
                                    : sizingInformation.screenSize.height * .8,
                            width: sizingInformation.screenSize.width,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing:
                                            AppDimensions.normalize(1),
                                        crossAxisSpacing:
                                            AppDimensions.normalize(1),
                                        crossAxisCount:
                                            sizingInformation.isDesktop
                                                ? 3
                                                : sizingInformation.isMobile
                                                    ? 1
                                                    : 2,
                                        childAspectRatio:
                                            sizingInformation.isMobile
                                                ? 1.1
                                                : sizingInformation.isDesktop
                                                    ? .688
                                                    : 0.75),
                                itemBuilder: ((context, index) {
                                  return CartlistCard(
                                    snap:
                                        (snapshot.data! as dynamic).docs[index],
                                  );
                                })),
                          );
                        }),
                    sizingInformation.isMobile
                        ? Align(
                      alignment: Alignment.center,
                          child: Container(
                            height: sizingInformation.screenSize.height * .06,
                            width: sizingInformation.screenSize.height * .25,
                            child: FutureBuilder<PaymentConfiguration>(
                                future: _googlePayConfigFuture,
                                builder: (context, snapshot) => snapshot
                                        .hasData
                                    ? GooglePayButton(
                                        paymentConfiguration: snapshot.data!,
                                        paymentItems: _paymentItems,
                                        type: GooglePayButtonType.buy,
                                      //  margin: Space.hf(2),
                                        onPaymentResult: onGooglePayResult,
                                        loadingIndicator: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Container()),
                          ),
                        )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        }));
  }

  OutlineInputBorder outlineborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      gapPadding: 4,
    );
  }
}
