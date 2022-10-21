import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/register_signin_sections/widgets/country_dropdown.dart';
import 'package:my_rent/register_signin_sections/widgets/register_textfield_with_title.dart';

typedef dataCallBack = void Function(List data);

class CountrySearchDropdown extends StatefulWidget {
  const CountrySearchDropdown({super.key, required this.ondataChanged});
  final dataCallBack ondataChanged;

  @override
  State<CountrySearchDropdown> createState() => _CountrySearchDropdownState();
}

class _CountrySearchDropdownState extends State<CountrySearchDropdown> {
  // final countryPhoneFormKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();
  TextEditingController contactNumController = TextEditingController();

  TextEditingController currencyController = TextEditingController();
  int countryId = 0;
  String selectedItem = "";
  String countryCode = '';
  String currency = "";
  List data = [];
  String query = "";
  List<String> countryNames = [];

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        fetchPolicy: FetchPolicy.cacheAndNetwork,

        document: gql(GET_COUNTRY_LIST),
        variables: {
          'filter_by': '${query}%',
        }, // this is the query string you just created
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(child: const Text('Loading'));
        }
        List<dynamic> list = result.data!["countries"];
        for (var countryData in list) {
          (countryData as Map<String, dynamic>).forEach((key, value) {
            if (key == "name") {
              countryNames.add(value);
            }
          });
        }

        return Form(
          // key: countryPhoneFormKey,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: RegisterTextfield(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        controller: currencyController,
                        title: "Currency",
                      )),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            errorBuilder: (context, searchEntry, exception) =>
                                Text("Something went wrong"),
                            showSearchBox: true,
                            // searchFieldProps:
                            //     TextFieldProps(,),
                            showSelectedItems: true,
                          ),
                          items: countryNames,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Country",
                              hintText: "Select your country",
                            ),
                          ),
                          onChanged: (v) {
                            selectedItem = v!;
                            data = getcodeAndCurrency(
                                list,
                                selectedItem,
                                countryCode,
                                countryId,
                                currency);

                            // getcodeAndCurrency(list, selectedItem, countryDetails,
                            //     currency, countryCode);

                            setState(() {
                              currencyController.text = data[2];
                              codeController.text = data[1];
                            });
                            widget.ondataChanged([
                              data[3],
                              selectedItem,
                              codeController.text,
                              contactNumController.text,
                            ]);
                            print(v);
                            selectedItem:
                            selectedItem;
                          }),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RegisterTextfield(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          controller: codeController,
                          title: "",
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: RegisterTextfield(
                      keyboardType: TextInputType.phone,
                      controller: contactNumController,
                      title: "Contact No.",
                      validator: (value) {
                        if (value!.isEmpty || value == "") {
                          return ("Enter Contact Number");
                        }
                      },
                      onChanged: (value) {
                        // countryPhoneFormKey.currentState!.validate();

                        
                        widget.ondataChanged([
                          data[3],
                          selectedItem,
                          codeController.text,
                          contactNumController.text,
                        ]);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

getcodeAndCurrency(
    list, selectedItem, countryCode, countryId, currency) {
  for (var countryData in list) {
    (countryData as Map<String, dynamic>).forEach((key, value) {
      if (value == selectedItem) {
        (countryData.entries.forEach((element) {
          if (element.key == "currency") {
            currency = element.value.toString();
          }
          if (element.key == "dial") {
            countryCode = element.value.toString();
          }
          if (element.key == "id") {
            countryId = element.value.toString();
          }
        }));
      }
    });
  }
  print([selectedItem, countryCode, currency, countryId]);
  return [selectedItem, countryCode, currency, countryId];
}

String GET_COUNTRY_LIST = """query GET_COUNTRY_LIST(\$filter_by: String ) {
  countries(where: {name: {_like: \$filter_by}}) {
    id
    name
    dial
    currency
  }
} """;
