import 'package:flutter/material.dart';

class FormService {
  static final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _addPhoneFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _sendMessageFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> signUpFormKey() => _signUpFormKey;

  GlobalKey<FormState> signInFormKey() => _signInFormKey;

  GlobalKey<FormState> addPhoneFormKey() => _addPhoneFormKey;

  GlobalKey<FormState> sendMessageFormKey() => _sendMessageFormKey;
}
