import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SizingInformationProvider with ChangeNotifier {
  SizingInformation? _sizingInformation;

  SizingInformation get sizingInformation => _sizingInformation!;

  set sizingInformation(SizingInformation? sizingInformation) {
    _sizingInformation = sizingInformation;
  }
}
