import 'package:stacked/stacked.dart';

import '../../../models/phone/phone_model.dart';

class PhonesPageViewModel extends BaseViewModel {
  List<PhoneModel> _phoneModels = [];

  List<PhoneModel> get phoneModels => _phoneModels;

  void setPhoneModels(List<PhoneModel> phoneModels) {
    _phoneModels = phoneModels;
  }
}
