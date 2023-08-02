import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_firebase/configs/configs.dart';

import 'messagefield.dart';

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
                    Text(
                      "Thanks for sharing your thoughts",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Space.y!,
                    MessageField(
                      fieldName: 'Topic',
                      fieldValue: widget.message.topic,
                    ),
                    // soc
                    MessageField(
                      fieldName: 'Message',
                      fieldValue: widget.message.message,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
