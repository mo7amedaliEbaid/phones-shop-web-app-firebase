import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../providers/page_key_provider.dart';
import '../../../services/authentication_service.dart';
import '../../../widgets/text_input/validators.dart';

class SignUpPageViewModel extends BaseViewModel with Validators {
  final _authenticationService = locator<AuthenticationService>();

  Future signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String streetAddress,
    required String postalCode,
    required String city,
  }) async {
    if (validateEmail(email) != null ||
        validatePassword(password) != null ||
        validatePassword(confirmPassword) != null ||
        validateFirstName(firstName) != null ||
        validateLastName(lastName) != null ||
        validatePhoneNumber(phoneNumber) != null ||
        validateStreetAddress(streetAddress) != null ||
        validatePostalCode(postalCode) != null ||
        validateCity(city) != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid details'),
          content: Text(
            '${validateEmail(email) ?? validatePassword(password) ?? validateConfirmPassword(password, confirmPassword) ?? validateFirstName(firstName) ?? validateLastName(lastName) ?? validatePhoneNumber(phoneNumber) ?? validateStreetAddress(streetAddress) ?? validatePostalCode(postalCode) ?? validateCity(city)}',
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
      var result = await _authenticationService.signUpWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        streetAddress: streetAddress,
        city: city,
        postalCode: postalCode,
      );
      setBusy(false);
      if (result is bool) {
        if (result) {
          showDialog(

            context: context,
            builder: (context) => AlertDialog(

              title: const Text('Success'),
              content: const Text('Account created successfully'),
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
