import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../providers/page_key_provider.dart';
import '../../../locator.dart';
import '../../../services/authentication_service.dart';
import '../../../widgets/text_input/validators.dart';

class SignInPageViewModel extends BaseViewModel with Validators {
  final _authenticationService = locator<AuthenticationService>();

  Future signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (validateEmail(email) != null || validatePassword(password) != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid details'),
          content: Text(
            '${validateEmail(email) ?? validatePassword(password)}',
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
      var result = await _authenticationService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: const Text('You have successfully logged in'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<PageKeyProvider>(context, listen: false).key =
                        '/';
                  },
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Something went wrong'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(
              result
                  .toString()
                  .substring(result.toString().indexOf(' ', 1) + 1),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }
}
