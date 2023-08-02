import 'package:ecommerce_firebase/configs/app.dart';
import 'package:ecommerce_firebase/configs/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../configs/configs.dart';

class CartlistCard extends StatefulWidget {
  final snap;

  const CartlistCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<CartlistCard> createState() => _CartlistCardState();
}

class _CartlistCardState extends State<CartlistCard> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * .3,
      margin: Space.all(1, 1),
      padding: Space.all(0, 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xffb9b0a1)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: size.height * .3,
                width: size.width,
                margin: Space.h,
                // margin: Space.all(1,1),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.snap['imageurl'],
                        ),
                        fit: BoxFit.fill)),
                child: Image.network(
                  widget.snap['imageurl'],
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) =>
                      Image.asset(
                    "assets/images/mobile3.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Space.y1!,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${widget.snap['title']}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Space.y1!,
                        Row(
                          children: [
                            Space.x2!,
                            Text(
                              " Price  ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.snap['price']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 1,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: AppDimensions.normalize(15),
                          child: Chip(
                            backgroundColor: Color(0xffe8e0d2),
                            label: Text(
                              "Added",
                              style: TextStyle(color: Colors.brown),
                            ),
                            avatar: Icon(Icons.access_time_filled_sharp),
                          ),
                        ),
                        Space.y!,
                        Text(
                          DateFormat.yMMMd().format(
                            widget.snap["datePublished"].toDate(),
                          ),
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Great Choice Recommended!",
              style: TextStyle(overflow: TextOverflow.ellipsis),
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
