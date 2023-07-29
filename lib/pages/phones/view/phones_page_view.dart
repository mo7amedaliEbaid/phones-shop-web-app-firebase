import 'package:ecommerce_firebase/configs/configs.dart';
import 'package:ecommerce_firebase/pages/phones/view/widgets/phone_specifications_card.dart';
import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../configs/app.dart';
import '../../../configs/ui.dart';
import '../../../locator.dart';
import '../../../models/phone/phone_model.dart';
import '../../../services/firestore_service.dart';
import '../view_model/phones_page_view_model.dart';

class PhonesPageView extends StatelessWidget {
  const PhonesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
   // Size size=UI.mediaQuery().size;
    return StreamBuilder<List<PhoneModel>>(
        stream: locator<FirestoreService>().readPhones,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PhoneModel>> snapshot,
        ) {
          return ViewModelBuilder<PhonesPageViewModel>.reactive(
            viewModelBuilder: () => PhonesPageViewModel(),
            builder: (
              BuildContext context,
              PhonesPageViewModel model,
              Widget? child,
            ) {
              List<Widget> phoneCards = [];
              int middle = phoneCards.length ~/ 2;
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  model.setPhoneModels(snapshot.data!);
                  model.setPhoneModels(snapshot.data!);
                  phoneCards = List.generate(
                    model.phoneModels.length,
                    (index) => PhoneSpecificationsCard(
                      phone: model.phoneModels[index],
                    ),
                  );
                  middle = phoneCards.length ~/ 2;
                } else {
                  phoneCards = [
                    Center(
                      child: Text(
                        'No Phones',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ];
                }
              } else if (snapshot.hasError) {
                phoneCards = [
                  const Center(
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                    ),
                  )
                ];
              } else {
                phoneCards = [
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
                              'Browse Phones',
                              style: Theme.of(context).textTheme.headlineMedium,
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
                                          phoneCards.sublist(0, middle).map(
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
                                          phoneCards.sublist(middle).map(
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
                              ...phoneCards,
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
