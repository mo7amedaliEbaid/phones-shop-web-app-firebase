import 'package:cloud_firestore/cloud_firestore.dart';

import '../locator.dart';
import '../models/phone/phone_model.dart';
import '../models/user/user_model.dart';
import 'authentication_service.dart';

class FirestoreService {
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

  // // Read Users
  // Stream<List<UserModel>> get readAllUsers {
  //   return userCollection.snapshots().map(
  //     (snapshot) {
  //       return snapshot.docs.map(
  //         (doc) {
  //           return UserModel(
  //             email: doc.get('email') as String,
  //             firstName: doc.get('firstName') as String,
  //             lastName: doc.get('lastName') as String,
  //             phoneNumber: doc.get('phoneNumber') as String,
  //             streetAddress: doc.get('streetAddress') as String,
  //             city: doc.get('city') as String,
  //             postalCode: doc.get('postalCode') as int,
  //           );
  //         },
  //       ).toList();
  //     },
  //   );
  // }

  // // Read User with specified uid
  // Stream<DocumentSnapshot> readUser({String? uid}) {
  //   return userCollection.doc(uid).snapshots();
  // }

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
}
