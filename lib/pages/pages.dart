import 'add_phone/view/add_phone_page_view.dart';
import 'cart/cart_page_view.dart';
import 'contact_us/contact_us_page_view.dart';
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
  '/contactus': const ContactUsPageView(),
  '/addphone': const AddPhonePageView(),
  '/cart': const CartPageView(),
  '/orders': const OrdersPageView(),
};
