
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

