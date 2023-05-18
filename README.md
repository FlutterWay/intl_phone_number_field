
# intl_phone_number_field

A customised Flutter TextFormField to input international phone number along with the country code.

<img src="https://raw.githubusercontent.com/FlutterWay/files/main/intl_phone_number_field/intl_phone_number_slayt.png"/>

# Usage
InternationalPhoneNumberInput

## Available Parameters

```dart
InternationalPhoneNumberInput(
  height: 60,
  controller: controller,
  inputFormatters: const [],
  formatter: MaskedInputFormatter('### ### ## ##'),
  initCountry: CountryCodeModel(
      name: "United States", dial_code: "+1", code: "US"),
  betweenPadding: 23,
  onInputChanged: (phone) {
    print(phone.code);
    print(phone.dial_code);
    print(phone.number);
    print(phone.rawFullNumber);
    print(phone.rawNumber);
    print(phone.rawDialCode);
  },
  loadFromJson: loadFromJson,
  dialogConfig: DialogConfig(
    backgroundColor: const Color(0xFF444448),
    searchBoxBackgroundColor: const Color(0xFF56565a),
    searchBoxIconColor: const Color(0xFFFAFAFA),
    countryItemHeight: 55,
    topBarColor: const Color(0xFF1B1C24),
    selectedItemColor: const Color(0xFF56565a),
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
```

| Parameter                           | Datatype                         |             Initial Value             |
|---------------------------------    |----------------------------------|---------------------------------------|
| controller                          | TextEditingController            |        TextEditingController()        |
| height                              | double                           |                  60                   |
| inputFormatters                     | List<TextInputFormatter>         |                  []                   |
| formatter                           | MaskedInputFormatter             | MaskedInputFormatter('### ### ## ##') |
| initCountry                         | CountryCodeModel                 | CountryCodeModel(name: "United States", dial_code: "+1", code: "US") |
| betweenPadding                      | double                           |                  23                   |
| onInputChanged                      | Function(IntPhoneNumber number)  |                 null                  |
| loadFromJson                        | Future<String?> Function()       |                 null                  |
| dialogConfig                        | DialogConfig                     |            DialogConfig()             |
| countryConfig                       | CountryConfig                    |            CountryConfig()            |
| phoneConfig                         | PhoneConfig                      |            PhoneConfig()              |

## IntPhoneNumber
Function "onInputChanged" will return an object with IntPhoneNumber type to you. <br></br>
IntPhoneNumber:
```dart
print(phone.code);          //US
print(phone.dial_code);     //+1
print(phone.number);        //553 142 88 74
print(phone.rawFullNumber); //15531428874
print(phone.rawNumber);     //5531428874
print(phone.rawDialCode);   //1
```

## Load JSON data
You can fetch the country codes from your own json file and upload them to the package.<br></br>
For that, you must fill your json file with a certain format. Example on this:

```json
[
    {
        "name": "Aland Islands",
        "dial_code": "+358",
        "code": "AX"
    },
    {
        "name": "Albania",
        "dial_code": "+355",
        "code": "AL"
    },
    {
        "name": "Algeria",
        "dial_code": "+213",
        "code": "DZ"
    }
]
```


```dart
InternationalPhoneNumberInput(loadFromJson: loadFromJson)
Future<String> loadFromJson() async {
   return await rootBundle.loadString('assets/countries/country_list.json');
 }
```

See the `example` file for a more detailed example


## To Contribute
* If you **found a bug** or **have a feature request**, open an issue.
* If you **want to contribute**, submit a pull request.