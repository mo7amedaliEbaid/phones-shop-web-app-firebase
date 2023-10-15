import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../models/user/user_model.dart';
import '../../services/authentication_service.dart';
import '../../services/firestore_service.dart';
import '../app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = locator<AuthenticationService>().currentUser;
    return Drawer(
      //backgroundColor: ,
      child: ListView(
        children: [
          user == null
              ? const DrawerHeader(child: SizedBox.shrink())
              : StreamBuilder<UserModel?>(
                  stream: locator<FirestoreService>().streamUser(user.uid),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<UserModel?> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      final userModel = snapshot.data;
                      if (userModel != null) {
                        return UserAccountsDrawerHeader(
                          accountName: Text(
                            '${userModel.firstName} ${userModel.lastName}',
                          ),
                          accountEmail: Text(userModel.email),
                          decoration: BoxDecoration(
                            color: Colors.brown
                          ),
                          currentAccountPicture: CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/user.jpeg"),
                            backgroundColor: Colors.brown,
                          ),
                        );
                      } else {
                        return const DrawerHeader(
                          child: Text('Loading'),
                        );
                      }
                    } else if (snapshot.hasError) {
                      debugPrint(snapshot.error.toString());
                      return const Center(
                        child: Icon(
                          Icons.error_outline_rounded,
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
          ...desktopNavigationAppBarActions(context).map((action) {
            return SizedBox(
              height: 60,
              child: action,
            );
          }).toList()
        ],
      ),
    );
  }
}
