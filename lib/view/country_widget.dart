import 'package:flutter/material.dart';
import '../models/country_code_model.dart';
import '../models/dialog_config.dart';
import 'flag_view.dart';

class CountryWidget extends StatelessWidget {
  final CountryCodeModel countryCodeModel;
  final DialogConfig dialogConfig;
  final bool isSelected;
  const CountryWidget(
      {required this.countryCodeModel,
      required this.dialogConfig,
      required this.isSelected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 25, bottom: 30),
      child: SizedBox(
        height: (dialogConfig.textStyle.fontSize ?? 16) * 2.3,
        child: Row(children: [
          FlagView(countryCodeModel: countryCodeModel, size: 25),
          const SizedBox(width: 30),
          Expanded(
            child: Row(
              children: [
                Text(
                  countryCodeModel.name.length >
                          dialogConfig.overflowCountryNameLimit
                      ? "${countryCodeModel.name.substring(0, dialogConfig.overflowCountryNameLimit - 3)}..."
                      : countryCodeModel.name,
                  style: dialogConfig.textStyle,
                ),
                if (isSelected)
                  dialogConfig.selectedIcon,
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            countryCodeModel.dial_code,
            style: dialogConfig.textStyle,
          )
        ]),
      ),
    );
  }
}
