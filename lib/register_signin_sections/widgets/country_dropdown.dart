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

class CountrySearchDropdown extends StatefulWidget {
  const CountrySearchDropdown({super.key});

  @override
  State<CountrySearchDropdown> createState() => _CountrySearchDropdownState();
}

class _CountrySearchDropdownState extends State<CountrySearchDropdown> {
  TextEditingController countryController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController contactNumController = TextEditingController();

  TextEditingController currencyController = TextEditingController();
  String selectedItem = "";
  List countryDetails = [];
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
          return const Text('Loading');
        }
        List<dynamic> list = result.data!["countries"];
        for (var countryData in list) {
          (countryData as Map<String, dynamic>).forEach((key, value) {
            if (key == "name") {
              countryNames.add(value);
            }
          });
        }
        getcodeAndCurrency(list, selectedItem, countryDetails);
        print(countryDetails);
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: RegisterTextfield(
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
                        setState(() {
                          selectedItem = v!;
                          getcodeAndCurrency(
                              list, selectedItem, countryDetails);
                        });

                        print(v);
                      },
                      selectedItem: selectedItem,
                    ),
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
                        controller: codeController,
                        title: "",
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: RegisterTextfield(
                    controller: contactNumController,
                    title: "Contact No.",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Contact Number");
                      }
                    },
                    onChanged: (value) {
                      //  widget._regFormKey.currentState!.validate();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
    ;
  }
}

// Query<Object?> countrySearchDropdown(
//   String query,
//   List<String> countryNames,
//   currencyController,
//   contactNumController,
//   codeController,
// ) {
//   String selectedItem = "";
//   List countryDetails = [];

// String query = "";
//     List<String> countryNames = [];

//   return Query(
//     options: QueryOptions(
//       fetchPolicy: FetchPolicy.cacheAndNetwork,

//       document: gql(GET_COUNTRY_LIST),
//       variables: {
//         'filter_by': '${query}%',
//       }, // this is the query string you just created
//     ),
//     builder: (QueryResult result,
//         {VoidCallback? refetch, FetchMore? fetchMore}) {
//       if (result.hasException) {
//         return Text(result.exception.toString());
//       }

//       if (result.isLoading) {
//         return const Text('Loading');
//       }
//       List<dynamic> list = result.data!["countries"];
//       for (var countryData in list) {
//         (countryData as Map<String, dynamic>).forEach((key, value) {
//           if (key == "name") {
//             countryNames.add(value);
//           }
//         });
//       }
//       getcodeAndCurrency(list, selectedItem, countryDetails);
//       print(countryDetails);
//       return Column(
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Expanded(
//                   flex: 1,
//                   child: RegisterTextfield(
//                     readOnly: true,
//                     controller: currencyController,
//                     title: "Currency",
//                   )),
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: DropdownSearch<String>(
//                     popupProps: PopupProps.menu(
//                       errorBuilder: (context, searchEntry, exception) =>
//                           Text("Something went wrong"),
//                       showSearchBox: true,
//                       // searchFieldProps:
//                       //     TextFieldProps(,),
//                       showSelectedItems: true,
//                     ),
//                     items: countryNames,
//                     dropdownDecoratorProps: DropDownDecoratorProps(
//                       dropdownSearchDecoration: InputDecoration(
//                         labelText: "Country",
//                         hintText: "Select your country",
//                       ),
//                     ),
//                     onChanged: (v) {
//                       selectedItem = v!;
//                       print(v);
//                     },
//                     selectedItem: selectedItem,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                   flex: 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: RegisterTextfield(
//                       readOnly: true,
//                       controller: codeController,
//                       title: "",
//                     ),
//                   )),
//               Expanded(
//                 flex: 3,
//                 child: RegisterTextfield(
//                   controller: contactNumController,
//                   title: "Contact No.",
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return ("Enter Contact Number");
//                     }
//                   },
//                   onChanged: (value) {
//                     //  widget._regFormKey.currentState!.validate();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }

List samp = [];
getcodeAndCurrency(list, selectedItem, countryDetails) {
  list.forEach((countryData) {
    (countryData as Map<String, dynamic>)
        .entries
        .where((e) => e.value == selectedItem)
        .forEach((element) {
      print(element);
    });
  });
}

String GET_COUNTRY_LIST = """query GET_COUNTRY_LIST(\$filter_by: String ) {
  countries(where: {name: {_like: \$filter_by}}) {
    id
    name
    dial
    currency
  }
} """;
