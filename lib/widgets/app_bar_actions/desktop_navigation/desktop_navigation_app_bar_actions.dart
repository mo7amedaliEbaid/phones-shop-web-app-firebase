import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../locator.dart';
import '../../../providers/page_key_provider.dart';
import '../../../services/authentication_service.dart';
import '../../../services/scaffold_service.dart';
import '../tab_button.dart';

List<TabButton> desktopNavigationAppBarActions(BuildContext context) {
  final user = locator<AuthenticationService>().currentUser;
  if (user == null) {
    return [
      // home icon text button
      TabButton(
        route: '/',
        title: 'Home',
        iconData: Icons.home_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/phones',
        title: 'Phones',
        iconData: Icons.phone_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/phones';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // sign up icon text button
      TabButton(
        route: '/signup',
        title: 'Sign Up',
        iconData: Icons.person_add_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/signup';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // log in icon text button
      TabButton(
        title: 'Sign In',
        iconData: Icons.login_rounded,
        onPressed: () {
          // context.watch<AuthStateProvider>().authState = true,
          Provider.of<PageKeyProvider>(context, listen: false).key = '/signin';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),

    ];
  } else {
    return [
      // home icon text button
      TabButton(
        route: '/',
        title: 'Home',
        iconData: Icons.home_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/phones',
        title: 'Phones',
        iconData: Icons.phone_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/phones';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // phone icon text button
      TabButton(
        route: '/addphone',
        title: 'Add Phone',
        iconData: Icons.add_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key =
              '/addphone';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),

      // log in icon text button
      TabButton(
        route: '/messages',
        title: 'Messages',
        iconData: Icons.message_outlined,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key = '/messages';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // contact us icon text button
      TabButton(
        route: '/contactus',
        title: 'Contact Us',
        iconData: Icons.contact_page_rounded,
        onPressed: () {
          Provider.of<PageKeyProvider>(context, listen: false).key =
              '/contactus';
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
      // contact us icon text button
      TabButton(
        title: 'Sign Out',
        iconData: Icons.logout_rounded,
        onPressed: () {
          locator<AuthenticationService>().signOut();
          if (locator<ScaffoldService>().currentState!.isEndDrawerOpen) {
            Navigator.pop(context);
          }
        },
      ),
    ];
  }
}
