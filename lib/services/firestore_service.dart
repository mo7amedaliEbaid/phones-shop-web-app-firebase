import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/models/cart/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../locator.dart';
import '../models/phone/phone_model.dart';
import '../models/user/user_model.dart';
import 'authentication_service.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseFirestore get fireStore => _firestore;

  /// User Collection Reference
  CollectionReference<Map<String, dynamic>> get userCollection =>
      _firestore.collection('users');

  /// Phone Collection Reference
  CollectionReference<Map<String, dynamic>> get phoneCollection =>
      _firestore.collection('phones');

  /// Cart Collection Reference
  CollectionReference<Map<String, dynamic>> get cartCollection =>
      _firestore.collection('cart');

  /// Order Collection Reference
  CollectionReference<Map<String, dynamic>> get ordersCollection =>
      _firestore.collection('orders');

  /// User Snapshot Stream
  Stream<QuerySnapshot<Object?>> get userSnapshot => userCollection.snapshots();

  /// Phone Snapshot Stream
  Stream<QuerySnapshot<Object?>> get phoneStream => phoneCollection.snapshots();

  /// Cart Snapshot Stream
  Stream<QuerySnapshot<Object?>> get cartStream => cartCollection.snapshots();

  /// Order Snapshot Stream
  Stream<QuerySnapshot<Object?>> get orderStream =>
      ordersCollection.snapshots();

  //Create Cart
  Future<void> createCart(CartModel cartmodel) async {
    return await cartCollection.doc().set(cartmodel.toDocument());
  }

  // Create Phone
  Future<void> createPhone(PhoneModel phoneModel) async {
    return await phoneCollection.doc().set(phoneModel.toDocument());
  }

  // Create User
  Future<void> createUser(UserModel userModel) async {
    return userCollection
        .doc(locator<AuthenticationService>().currentUser!.uid)
        .set(userModel.toDocument());
  }

  // Read User
  Future<UserModel?> readUser(String documentId) async {
    var snapshot = await userCollection.doc(documentId).get();
    if (snapshot.exists) {
      return UserModel.fromDocument(snapshot);
    } else {
      return null;
    }
  }

  //  Stream User Model
  Stream<UserModel?> streamUser(String? documentId) {
    return userCollection
        .doc(documentId)
        .snapshots()
        .map((snapshot) => UserModel.fromJson(snapshot.data()!));
  }


  // Read Phone Catalog
  Stream<List<PhoneModel>> get readPhones {
    return phoneCollection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return PhoneModel.fromDocument(doc);
          },
        ).toList();
      },
    );
  }

  // Read Cart
  Stream<List<CartModel>> get readCart {
    return cartCollection.snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return CartModel.fromDocument(doc);
          },
        ).toList();
      },
    );
  }

  String cartId = Uuid().v1();
  Future<void> addToCart({
    required String uid,
    required String productpic,
    required String productPrice,
    required String productTitle,
  }) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection("cart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "uid": uid,
      "imageurl": productpic,
      "price": productPrice,
      "title":productTitle,
      "datePublished": DateTime.now(),
    });
  }
}
