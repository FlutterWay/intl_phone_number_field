// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String? data;

  @override
  void initState() {
    loadFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InternationalPhoneNumberInput(
                  height: 60,
                  controller: controller,
                  inputFormatters: const [],
                  formatter: MaskedInputFormatter('### ### ## ##'),
                  initCountry: CountryCodeModel(
                      name: "United States", dial_code: "+1", code: "US"),
                  betweenPadding: 23,
                  onChanged: (phone) {
                    print(phone.code);
                  },
                  loadFromJson: loadFromJson,
                  dialogConfig: DialogConfig(
                    backgroundColor: const Color(0xFF444448),
                    searchBoxBackgroundColor: const Color(0xFF56565a),
                    searchBoxIconColor: const Color(0xFFFAFAFA),
                    overflowCountryNameLimit: 25,
                    selectedIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/check.png",
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    textStyle: TextStyle(
                        color: const Color(0xFFFAFAFA).withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    searchBoxTextStyle: TextStyle(
                        color: const Color(0xFFFAFAFA).withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    titleStyle: const TextStyle(
                        color: Color(0xFFFAFAFA),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    searchBoxHintStyle: TextStyle(
                        color: const Color(0xFFFAFAFA).withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  countryConfig: CountryConfig(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xFF3f4046)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      noFlag: false,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  phoneConfig: PhoneConfig(
                    focusedColor: const Color(0xFF6D59BD),
                    enabledColor: const Color(0xFF6D59BD),
                    radius: 8,
                    hintText: "Phone Number",
                    borderWidth: 2,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<String> loadFromJson() async {
    return await rootBundle.loadString('assets/countries/country_list.json');
  }
}
