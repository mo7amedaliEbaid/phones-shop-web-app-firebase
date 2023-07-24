import 'package:flutter/foundation.dart';

class PageKeyProvider with ChangeNotifier {
  String _key = '/';

  String get key => _key;

  set key(String value) {
    _key = value;
    notifyListeners();
  }
}
