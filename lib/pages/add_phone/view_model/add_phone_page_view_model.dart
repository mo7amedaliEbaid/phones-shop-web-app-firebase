import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../models/phone/phone_model.dart';
import '../../../providers/page_key_provider.dart';
import '../../../services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';
import '../../../widgets/text_input/validators.dart';

class AddPhonePageViewModel extends BaseViewModel with Validators {
  Future addPhone({
    required BuildContext context,
    required String model,
    required String imageUrl,
    required String soc,
    required String ram,
    required String storage,
    required String screenSize,
    required String battery,
    required String camera,
    required String price,
    required String stock,
    required String sar,
  }) async {
    if (validateModel(model) != null ||
        validateImageUrl(imageUrl) != null ||
        validateSoc(soc) != null ||
        validateRam(ram) != null ||
        validateStorage(storage) != null ||
        validateScreenSize(screenSize) != null ||
        validateBattery(battery) != null ||
        validateCamera(camera) != null ||
        validatePrice(price) != null ||
        validateStock(stock) != null ||
        validateSar(sar) != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid details'),
          content: Text(
            '${validateModel(model) ?? validateImageUrl(imageUrl) ?? validateSoc(soc) ?? validateRam(ram) ?? validateStorage(storage) ?? validateScreenSize(screenSize) ?? validateBattery(battery) ?? validateCamera(camera) ?? validatePrice(price) ?? validateStock(stock) ?? validateSar(sar)}',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      setBusy(true);
      PhoneModel phoneModel = PhoneModel(
        model: model,
        soc: soc,
        ram: int.parse(ram),
        storage: storage,
        screenSize: double.parse(screenSize),
        battery: int.parse(battery),
        camera: camera,
        price: double.parse(price),
        stock: int.parse(stock),
        imageUrl: imageUrl,
        sar: double.parse(sar),
      );
      await locator<FirestoreService>().createPhone(phoneModel);
      setBusy(false);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Phone added successfully'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Provider.of<PageKeyProvider>(context, listen: false).key =
                      '/phones';
                },
              ),
            ],
          );
        },
      );
    }
  }
}
