import 'package:flutter/material.dart';

import '../models/country_code_model.dart';

class FlagView extends StatelessWidget {
  final CountryCodeModel countryCodeModel;
  final double size;
  const FlagView(
      {required this.countryCodeModel, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      countryCodeModel.code.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) =>
              String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397)),
      style: TextStyle(fontSize: size),
    );
  }
}
