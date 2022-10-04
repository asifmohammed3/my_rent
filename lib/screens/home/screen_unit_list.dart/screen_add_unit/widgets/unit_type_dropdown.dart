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

typedef dataCallBack = void Function(String data);

class unitItemDropdown extends StatefulWidget {
  const unitItemDropdown({super.key, required this.ondataChanged});
  final dataCallBack ondataChanged;

  @override
  State<unitItemDropdown> createState() => _CountrySearchDropdownState();
}

class _CountrySearchDropdownState extends State<unitItemDropdown> {
  // final countryPhoneFormKey = GlobalKey<FormState>();

  List<String> unitTypes = [];

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        document: gql(getUnitTypes),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          print(result.exception.toString());
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(child: const Text('Loading'));
        }
        List<dynamic> list = result.data!["unit_types"];
        print(result.data);
        for (var countryData in list) {
          (countryData as Map<String, dynamic>).forEach((key, value) {
            if (key == "type") {
              unitTypes.add(value);
            }
          });
        }
        print(unitTypes);

        return DropdownSearch<String>(
            popupProps: PopupProps.menu(
              errorBuilder: (context, searchEntry, exception) =>
                  Text("Something went wrong"),
              showSearchBox: true,
              showSelectedItems: false,
            ),
            items: unitTypes,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Type",
                hintText: "Select Unit type",
              ),
            ),
            onChanged: (v) {
              var selectedItem = v!;
              widget.ondataChanged(
                selectedItem,
              );
              print(v);
            });
      },
    );
  }
}

String getUnitTypes = """query UNIT_TYPES {
  unit_types {
    type
    description
  }
}
""";
