
import 'package:ecommerce_firebase/pages/cart/cart.dart';

import 'add_phone/view/add_phone_page_view.dart';
import 'contact_us/view/contactus_page_view.dart';
import 'home/home_page_view.dart';
import 'orders/orders_page_view.dart';
import 'phones/view/phones_page_view.dart';
import 'sign_in/view/sign_in_page_view.dart';
import 'sign_up/view/sign_up_page_view.dart';

final pageRoutes = {
  '/': const HomePageView(),
  '/phones': const PhonesPageView(),
  '/signup': const SignUpPageView(),
  '/signin': const SignInPageView(),
  '/contactus':  ContactUsPageView(),
  '/addphone': const AddPhonePageView(),
  '/cart': const CartScreen(),
 // '/orders': const OrdersPageView(),
  '/orders' :Application(),
 // '/message': MessageView(),
};
