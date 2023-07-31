import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:ecommerce_firebase/pages/orders/messagefield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase/configs/configs.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ContactUsModel message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool _isHovered = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return widget.message.uid == _auth.currentUser!.uid
        ? MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: Card(
              elevation: _isHovered ? 12 : 0,
              shadowColor: _isHovered ? Colors.orange : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
                side: BorderSide(
                  color: _isHovered ? Colors.orangeAccent : Colors.grey,
                  width: 3,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.space(1.5),
                    vertical: AppDimensions.space(1.5)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Padding(
                padding: Space.v!,
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.phone.imageUrl,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.red.shade700,
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(
                        value: downloadProgress.progress,
                      );
                    },
                    fit: BoxFit.contain,
                  ),
                ),
              ),*/
                    // model
                    MessageField(
                      fieldName: 'Topic',
                      fieldValue: widget.message.topic,
                    ),
                    // soc
                    MessageField(
                      fieldName: 'Message',
                      fieldValue: widget.message.message,
                    ),
                    // ram
                    /* SpecificationField(
                fieldName: 'Ram',
                fieldValue: '${widget.phone.ram} GB',
              ),
              // storage
              SpecificationField(
                fieldName: 'Storage',
                fieldValue: widget.phone.storage,
              ),
              // screen size
              SpecificationField(
                fieldName: 'Screen size',
                fieldValue: '${widget.phone.screenSize} inch',
              ),
              // camera
              SpecificationField(
                fieldName: 'Camera',
                fieldValue: widget.phone.camera,
              ),
              // sar
              SpecificationField(
                fieldName: 'SAR',
                fieldValue: '${widget.phone.sar} W/kg',
              ),
              // price
              SpecificationField(
                fieldName: 'Price',
                fieldValue: '€${widget.phone.price}',
              ),
              // quantity
              SpecificationField(
                fieldName: 'Stock',
                fieldValue: '${widget.phone.stock}',
              ),*/
                    /*   Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: BuyPhoneBusyButton(phone: widget.phone),
              ),*/
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
/*
class BuyPhoneBusyButton extends StatelessWidget {
  const BuyPhoneBusyButton({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final PhoneModel phone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BusyButton(
        title: 'Buy',
        onPressed: ()async {

          if (phone.stock > 0) {
            if (locator<AuthenticationService>().currentUser != null) {
              await FirestoreService().addToCart(
                uid: FirebaseAuth.instance.currentUser!.uid,
                productpic: phone.imageUrl,
                productPrice: phone.price.toString(),
                productTitle: phone.model,
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('${phone.model} added to cart'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('You need to be logged in'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          } else  {

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('${phone.model} is out of stock'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
