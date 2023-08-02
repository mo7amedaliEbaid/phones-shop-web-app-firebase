
import 'package:ecommerce_firebase/models/contact_us/contact_us_model.dart';
import 'package:ecommerce_firebase/pages/messages/view/widgets/messagecard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import '../../../configs/app.dart';
import '../../../locator.dart';
import '../../../services/firestore_service.dart';
import 'package:ecommerce_firebase/configs/configs.dart';
import '../view_model/messages_viewmodel.dart';

class MessagesPageView extends StatelessWidget {
  const MessagesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return StreamBuilder<List<ContactUsModel>>(
        stream: locator<FirestoreService>().readmessages,
        builder: (
            BuildContext context,
            AsyncSnapshot<List<ContactUsModel>> snapshot,
            ) {
          return ViewModelBuilder<MessagesViewModel>.reactive(
            viewModelBuilder: () => MessagesViewModel(),
            builder: (
                BuildContext context,
                MessagesViewModel model,
                Widget? child,
                ) {
              List<Widget> messagecards = [];
              int middle = messagecards.length ~/ 2;
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  model.setmessages(snapshot.data!);
                  model.setmessages(snapshot.data!);
                  messagecards = List.generate(
                    model.contactusmodel.length,
                        (index) => MessageCard(
                      message: model.contactusmodel[index],
                    ),
                  );
                  middle = messagecards.length ~/ 2;
                } else {
                  messagecards = [
                    Center(
                      child: Text(
                        'No messages',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ];
                }
              } else if (snapshot.hasError) {
                messagecards = [
                  const Center(
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                    ),
                  )
                ];
              } else {
                messagecards = [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ];
              }
              return ResponsiveBuilder(
                builder: (
                    BuildContext context,
                    SizingInformation sizingInformation,
                    ) {
                 // log("llllllllllllllll==============${messagecards.length.toString()}");
                  return SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        constraints: sizingInformation.isDesktop
                            ? const BoxConstraints(maxWidth: 1200)
                            : BoxConstraints(
                          maxWidth: sizingInformation.screenSize.width,
                        ),
                        duration: const Duration(milliseconds: 60),
                        padding: sizingInformation.isDesktop
                            ? const EdgeInsets.symmetric(horizontal: 90)
                            : Space.h1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Browse Recent Messages',
                              style: Theme.of(context).textTheme.headlineSmall,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            if (!(sizingInformation.isMobile))

                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children:
                                      messagecards.sublist(0, middle).map(
                                            (item) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: item,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children:
                                      messagecards.sublist(middle).map(
                                            (item) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: item,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              )
                            else
                              ...messagecards,
                          ].map(
                                (item) {
                              return Padding(
                                padding:Space.v!,
                                //const EdgeInsets.symmetric(vertical: 9),
                                child: item,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        });
  }
}
/*
class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String? _token;
  String? initialMessage;
  bool _resolved = false;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
          (value) => setState(
            () {
          _resolved = true;
          initialMessage = value?.data.toString();
        },
      ),
    );

    FirebaseMessaging.onMessage.listen(FCMService().showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        '/message',
        arguments: MessageArguments(message, true),
      );
    });
  }

  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: FCMService().constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Messaging'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: onActionSelected,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'subscribe',
                  child: Text('Subscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'unsubscribe',
                  child: Text('Unsubscribe to topic'),
                ),
                const PopupMenuItem(
                  value: 'get_apns_token',
                  child: Text('Get APNs token (Apple only)'),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: sendPushMessage,
          backgroundColor: Colors.white,
          child: const Icon(Icons.send),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MetaCard('Permissions', Permissions()),
            MetaCard(
              'Initial Message',
              Column(
                children: [
                  Text(_resolved ? 'Resolved' : 'Resolving'),
                  Text(initialMessage ?? 'None'),
                ],
              ),
            ),
            MetaCard(
              'FCM Token',
              TokenMonitor((token) {
                _token = token;
                return token == null
                    ? const CircularProgressIndicator()
                    : SelectableText(
                  token,
                  style: const TextStyle(fontSize: 12),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseMessaging.instance
                    .getInitialMessage()
                    .then((RemoteMessage? message) {
                  if (message != null) {
                    Navigator.pushNamed(
                      context,
                      '/message',
                      arguments: MessageArguments(message, true),
                    );
                  }
                });
              },
              child: const Text('getInitialMessage()'),
            ),
            MetaCard('Message Stream', MessageList()),
          ],
        ),
      ),
    );
  }
}*/
