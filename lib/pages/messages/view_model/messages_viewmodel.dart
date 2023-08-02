import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:stacked/stacked.dart';

class MessagesViewModel extends BaseViewModel {
  List<ContactUsModel> _contactusmodel = [];

  List<ContactUsModel> get contactusmodel => _contactusmodel;

  void setmessages(List<ContactUsModel> contactusmodel) {
    _contactusmodel = contactusmodel;
  }
}
