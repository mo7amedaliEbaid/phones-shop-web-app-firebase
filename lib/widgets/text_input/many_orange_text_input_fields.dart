import 'package:flutter/material.dart';
import 'many_text_controllers.dart';
import 'orange_text_form_field.dart';
import 'validators.dart';

OrangeTextFormField modelInputField = OrangeTextFormField(
  labelText: 'Phone Model',
  controller: modelController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateModel,
);

OrangeTextFormField imageUrlInputField = OrangeTextFormField(
  labelText: 'Image URL',
  controller: imageUrlController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateImageUrl,
);

OrangeTextFormField socInputField = OrangeTextFormField(
  labelText: 'Social Media',
  controller: socController,
  keyboardType: TextInputType.text,
  validator: MyValidators().validateSoc,
);

OrangeTextFormField ramInputField = OrangeTextFormField(
  labelText: 'RAM',
  controller: ramController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateRam,
);

OrangeTextFormField storageInputField = OrangeTextFormField(
  labelText: 'Storage',
  controller: storageController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateStorage,
);

OrangeTextFormField screenSizeInputField = OrangeTextFormField(
  labelText: 'Screen Size',
  controller: screenSizeController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateScreenSize,
);

OrangeTextFormField batteryInputField = OrangeTextFormField(
  labelText: 'Battery',
  controller: batteryController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateBattery,
);

OrangeTextFormField cameraInputField = OrangeTextFormField(
  labelText: 'Camera',
  controller: cameraController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateCamera,
);

OrangeTextFormField priceInputField = OrangeTextFormField(
  labelText: 'Price',
  controller: priceController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validatePrice,
);

OrangeTextFormField stockInputField = OrangeTextFormField(
  labelText: 'Stock',
  controller: stockController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateStock,
);

OrangeTextFormField sarInputField = OrangeTextFormField(
  labelText: 'SAR',
  controller: sarController,
  keyboardType: TextInputType.number,
  validator: MyValidators().validateSar,
);
