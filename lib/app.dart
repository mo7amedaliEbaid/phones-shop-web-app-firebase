import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';
import 'pages/pages.dart';
import 'providers/page_key_provider.dart';
import 'providers/sizing_information_provider.dart';
import 'services/scaffold_service.dart';
import 'theme.dart';
import 'widgets/app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';
import 'widgets/app_bar_actions/mobile_navigation/mobile_navigation_app_bar_actions.dart';
import 'widgets/drawer/mobile_drawer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  changePage(String key) {
    setState(() {
      context.watch<PageKeyProvider>().key = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation = sizingInformation;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            key: locator<ScaffoldService>().scaffoldKey,
            endDrawer: context
                    .watch<SizingInformationProvider>()
                    .sizingInformation
                    .isDesktop
                ? null
                : const MobileDrawer(),
            appBar: AppBar(
              leadingWidth: 120,
              leading: Padding(
                padding: const EdgeInsets.all(6.9),
                child: TextButton(
                  onPressed: () =>
                      Provider.of<PageKeyProvider>(context, listen: false).key =
                          '/',
                  child: Text("Phones Shop",style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold
                  ),)
                ),
              ),
              centerTitle: false,
              elevation: 6,
              //backgroundColor: Colors.white,
              shadowColor: Colors.blueGrey,
              actions: sizingInformation.isDesktop
                  ? desktopNavigationAppBarActions(context)
                  : mobileNavigationAppBarActions(context),
            ),
            body: pageRoutes[context.watch<PageKeyProvider>().key]!,
          );
        },
      ),
    );
  }
}
