import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'app.dart';
import 'locator.dart';
import 'providers/page_key_provider.dart';
import 'providers/sizing_information_provider.dart';
import 'services/authentication_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider.value(
          value: locator<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => PageKeyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SizingInformationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
