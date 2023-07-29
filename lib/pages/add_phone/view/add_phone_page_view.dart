import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../services/form_service.dart';
import '../../../widgets/busy_button.dart';
import '../../../widgets/text_input/orange_text_form_field.dart';
import '../view_model/add_phone_page_view_model.dart';

class AddPhonePageView extends StatelessWidget {
  const AddPhonePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPhonePageViewModel>.reactive(
      viewModelBuilder: () => AddPhonePageViewModel(),
      builder: (
        BuildContext context,
        AddPhonePageViewModel model,
        Widget? child,
      ) {
        final modelController = TextEditingController();
        final imageUrlController = TextEditingController();
        final socController = TextEditingController();
        final ramController = TextEditingController();
        final storageController = TextEditingController();
        final screenSizeController = TextEditingController();
        final batteryController = TextEditingController();
        final cameraController = TextEditingController();
        final priceController = TextEditingController();
        final stockController = TextEditingController();
        final sarContrller = TextEditingController();

        final modelInputfield = BrownTextFormField(
          controller: modelController,
          labelText: 'Model',
          validator: model.validateModel,
          keyboardType: TextInputType.text,
        );
        final imageUrlInputfield = BrownTextFormField(
          controller: imageUrlController,
          labelText: 'Image Url',
          validator: model.validateImageUrl,
          keyboardType: TextInputType.url,
        );
        final socInputfield = BrownTextFormField(
          controller: socController,
          labelText: 'Soc',
          validator: model.validateSoc,
          keyboardType: TextInputType.text,
        );
        final ramInputfield = BrownTextFormField(
          controller: ramController,
          labelText: 'Ram',
          validator: model.validateRam,
          keyboardType: TextInputType.number,
        );
        final storageInputfield = BrownTextFormField(
          controller: storageController,
          labelText: 'Storage',
          validator: model.validateStorage,
          keyboardType: TextInputType.text,
        );
        final screenSizeInputfield = BrownTextFormField(
          controller: screenSizeController,
          labelText: 'Screen Size',
          validator: model.validateScreenSize,
          keyboardType: TextInputType.number,
        );
        final batteryInputfield = BrownTextFormField(
          controller: batteryController,
          labelText: 'Battery',
          validator: model.validateBattery,
          keyboardType: TextInputType.number,
        );
        final cameraInputfield = BrownTextFormField(
          controller: cameraController,
          labelText: 'Camera',
          validator: model.validateCamera,
          keyboardType: TextInputType.text,
        );
        final priceInputfield = BrownTextFormField(
          controller: priceController,
          labelText: 'Price',
          validator: model.validatePrice,
          keyboardType: TextInputType.number,
        );
        final stockInputfield = BrownTextFormField(
          controller: stockController,
          labelText: 'Stock',
          validator: model.validateStock,
          keyboardType: TextInputType.number,
        );
        final sarInputfield = BrownTextFormField(
          controller: sarContrller,
          labelText: 'Sar',
          validator: model.validateSar,
          keyboardType: TextInputType.number,
        );

        final addPhoneformFields = [
          modelInputfield,
          imageUrlInputfield,
          socInputfield,
          ramInputfield,
          storageInputfield,
          screenSizeInputfield,
          batteryInputfield,
          cameraInputfield,
          priceInputfield,
          stockInputfield,
          sarInputfield,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
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
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: locator<FormService>().addPhoneFormKey(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Phone',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      if (!sizingInformation.isMobile)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: addPhoneformFields.sublist(0, 6).map(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: addPhoneformFields.sublist(6).map(
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
                        ...addPhoneformFields,
                      BusyButton(
                        title: 'Add Phone',
                        busy: model.isBusy,
                        onPressed: () {
                          model.addPhone(
                            context: context,
                            model: modelController.text,
                            imageUrl: imageUrlController.text,
                            soc: socController.text,
                            ram: ramController.text,
                            storage: storageController.text,
                            screenSize: screenSizeController.text,
                            battery: batteryController.text,
                            camera: cameraController.text,
                            price: priceController.text,
                            stock: stockController.text,
                            sar: sarContrller.text,
                          );
                        },
                      ),
                    ].map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: item,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
