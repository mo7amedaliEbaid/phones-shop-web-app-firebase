import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  /// Message Collection Reference
  CollectionReference<Map<String, dynamic>> get messagescollection =>
      _firestore.collection('messages');


  /// Order Collection Reference
  CollectionReference<Map<String, dynamic>> get ordersCollection =>
      _firestore.collection('orders');

  /// User Snapshot Stream
  Stream<QuerySnapshot<Object?>> get userSnapshot => userCollection.snapshots();

  /// Phone Snapshot Stream
  Stream<QuerySnapshot<Object?>> get phoneStream => phoneCollection.snapshots();


  /// Order Snapshot Stream
  Stream<QuerySnapshot<Object?>> get messagesstream =>
      messagescollection.snapshots();

  /// Order Snapshot Stream
  Stream<QuerySnapshot<Object?>> get orderStream =>
      ordersCollection.snapshots();



  // Create Phone
  Future<void> createPhone(PhoneModel phoneModel) async {
    return await phoneCollection.doc().set(phoneModel.toDocument());
  }

// Send Message
  Future<void> sendmessage(ContactUsModel contactUsModel) async {
    return await messagescollection.doc().set(contactUsModel.toDocument());
  }


  // Create User
  Future<void> createUser(UserModel userModel) async {
    return userCollection
        .doc(locator<AuthenticationService>().currentUser!.uid)
        .set(userModel.toDocument());
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
  // Read Messages
  Stream<List<ContactUsModel>> get readmessages {
    return messagescollection.snapshots().map(
          (snapshot) {
        return snapshot.docs.map(
              (doc) {
            return ContactUsModel.fromDocument(doc);
          },
        ).toList();
      },
    );
  }



}
