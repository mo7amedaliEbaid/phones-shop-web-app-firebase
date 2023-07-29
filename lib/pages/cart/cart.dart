import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/pages/cart/widgets/cartlist_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.transparent),
        leading: null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Cartlist",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('cart')
              .orderBy(
                "datePublished",
                descending: true,
              )
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  return CartlistCard(
                    snap: (snapshot.data! as dynamic).docs[index],
                  );
                }));
          }),
    );
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
