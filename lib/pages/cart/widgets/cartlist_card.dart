import 'package:ecommerce_firebase/configs/app.dart';
import 'package:ecommerce_firebase/configs/app_dimensions.dart';
import 'package:ecommerce_firebase/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartlistCard extends StatefulWidget {
  final snap;

  const CartlistCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<CartlistCard> createState() => _CartlistCardState();
}

class _CartlistCardState extends State<CartlistCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.normalize(1),
            vertical: AppDimensions.normalize(1)),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          color: Color(0xffc4b495),
          child: Padding(
            padding: Space.v!,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown,
                radius: 30,
                foregroundImage: NetworkImage(
                  widget.snap['imageurl'],
                ),
              ),
              title: Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.normalize(4)),
                  child: Row(
                    children: [
                      SizedBox(
                        //width: AppDimensions.normalize(50),
                        child: Text(
                          "${widget.snap['title']}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )),
              trailing: Column(
                children: [
                  Container(
                     height: AppDimensions.normalize(12),
                    child: Chip(
                      backgroundColor: Color(0xffe8e0d2),
                      label: Text(
                        "Added",
                        style: TextStyle(color: Colors.brown),
                      ),
                      avatar: Icon(Icons.access_time_filled_sharp),
                    ),
                  ),
                  Space.yf(.25),
                  Text(
                    DateFormat.yMMMd().format(
                      widget.snap["datePublished"].toDate(),
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              subtitle: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      " Price  ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    Text(
                      "${widget.snap['price']}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 19, 18, 18),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
