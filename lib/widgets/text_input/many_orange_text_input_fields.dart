import 'package:flutter/material.dart';
import 'many_text_controllers.dart';
import 'orange_text_form_field.dart';
import 'validators.dart';

BrownTextFormField modelInputField = BrownTextFormField(
  labelText: 'Phone Model',
  controller: modelController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateModel,
);

BrownTextFormField imageUrlInputField = BrownTextFormField(
  labelText: 'Image URL',
  controller: imageUrlController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateImageUrl,
);

BrownTextFormField socInputField = BrownTextFormField(
  labelText: 'Social Media',
  controller: socController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateSoc,
);

BrownTextFormField ramInputField = BrownTextFormField(
  labelText: 'RAM',
  controller: ramController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateRam,
);

BrownTextFormField storageInputField = BrownTextFormField(
  labelText: 'Storage',
  controller: storageController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateStorage,
);

BrownTextFormField screenSizeInputField = BrownTextFormField(
  labelText: 'Screen Size',
  controller: screenSizeController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateScreenSize,
);

BrownTextFormField batteryInputField = BrownTextFormField(
  labelText: 'Battery',
  controller: batteryController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateBattery,
);

BrownTextFormField cameraInputField = BrownTextFormField(
  labelText: 'Camera',
  controller: cameraController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateCamera,
);

BrownTextFormField priceInputField = BrownTextFormField(
  labelText: 'Price',
  controller: priceController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validatePrice,
);

BrownTextFormField stockInputField = BrownTextFormField(
  labelText: 'Stock',
  controller: stockController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateStock,
);

BrownTextFormField sarInputField = BrownTextFormField(
  labelText: 'SAR',
  controller: sarController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateSar,
);
