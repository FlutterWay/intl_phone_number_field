import 'package:flutter/material.dart';
import '../models/country_code_model.dart';
import '../models/dialog_config.dart';
import 'country_widget.dart';
import 'rixa_textfield.dart';

class CountryCodeBottomSheet extends StatefulWidget {
  final List<CountryCodeModel> countries;
  final Function(CountryCodeModel countryCodeModel) onSelected;
  final CountryCodeModel? selected;
  final DialogConfig dialogConfig;
  const CountryCodeBottomSheet(
      {super.key,
      required this.countries,
      required this.onSelected,
      this.selected,
      required this.dialogConfig});

  @override
  State<CountryCodeBottomSheet> createState() => _CountryCodeBottomSheetState();
}

class _CountryCodeBottomSheetState extends State<CountryCodeBottomSheet> {
  late List<CountryCodeModel> mainCountries, searchCountries;
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    mainCountries = widget.countries;
    searchCountries = widget.countries.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Container(
              height: 5,
              width: 145,
              decoration: BoxDecoration(
                  color: const Color(0xFFBEBEBE),
                  borderRadius: BorderRadius.circular(30)),
            )),
            const SizedBox(height: 25),
            Text(
              "Country Codes",
              style: widget.dialogConfig.titleStyle,
            ),
            const SizedBox(height: 14),
            RixaTextField(
              hintText: "Search",
              controller: searchController,
              textStyle: widget.dialogConfig.searchBoxTextStyle,
              hintStyle: widget.dialogConfig.searchBoxHintStyle,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 24),
                child: Icon(
                  Icons.search,
                  color: widget.dialogConfig.searchBoxIconColor,
                  size: 20,
                ),
              ),
              onChanged: (value) {
                search(value);
              },
              isUnderline: false,
              noInputBorder: true,
              backgroundColor: widget.dialogConfig.searchBoxBackgroundColor,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (var country in searchCountries)
                    TextButton(
                        onPressed: () {
                          widget.onSelected(country);
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: CountryWidget(
                            countryCodeModel: country,
                            isSelected: widget.selected != null &&
                                widget.selected!.code == country.code &&
                                widget.selected!.dial_code ==
                                    country.dial_code &&
                                widget.selected!.name == country.name,
                            dialogConfig: widget.dialogConfig))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void search(String search) {
    searchCountries = mainCountries
        .where((element) =>
            element.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    setState(() {});
  }
}
