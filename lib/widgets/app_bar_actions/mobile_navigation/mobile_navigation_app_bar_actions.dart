import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../services/scaffold_service.dart';
import '../tab_button.dart';

List<TabButton> mobileNavigationAppBarActions(BuildContext context) {
  return [
    TabButton(
      title: 'Menu',
      iconData: Icons.menu_rounded,
      onPressed: () {
        locator<ScaffoldService>().scaffoldKey.currentState!.openEndDrawer();
      },
    ),
  ];
}
