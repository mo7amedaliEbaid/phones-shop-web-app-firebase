import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:ecommerce_firebase/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../providers/page_key_provider.dart';
import '../../../../locator.dart';
import '../../../../widgets/text_input/validators.dart';
import '../../../services/authentication_service.dart';

class ContactPageViewModel extends BaseViewModel with Validators {
  User? user = locator<AuthenticationService>().currentUser;
  Future sendmessage({
    required BuildContext context,
    required String uid,
    required String name,
    required String email,
    required String topic,
    required String message,

  }) async {
    if (validateName(name) != null ||
        validateEmail(email) != null ||
        validateTopic(topic) != null ||
        validateMessage(message) != null ||
        user?.uid == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid details'),
          content: Text(
            '${validateName(name) ?? validateEmail(email) ?? validateTopic(topic) ?? validateMessage(message) }',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      setBusy(true);
      ContactUsModel contactUsModel = ContactUsModel(uid:user!.uid, name: name, email:email, topic:topic, message:message

      );
      await locator<FirestoreService>().sendmessage(contactUsModel);
      setBusy(false);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Message sent successfully'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Provider.of<PageKeyProvider>(context, listen: false).key =
                  '/messages';
                },
              ),
            ],
          );
        },
      );
    }
  }
  Future<void>? launched;

  Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
