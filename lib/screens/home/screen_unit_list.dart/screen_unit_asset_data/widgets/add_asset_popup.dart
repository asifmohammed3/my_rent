import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/screen_add_single_unit_property/screen_add_single_unit_prop.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';

ValueNotifier<String> selectedAsset = ValueNotifier<String>("");

showAddAssetPopup(BuildContext context, String unitId) {
  const subTitleStyle = TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 95, 95, 95),
  );
  // set up the AlertDialog
  Widget showAddAssetPopup = AssetAlertDialogue(
    unitID: unitId,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return showAddAssetPopup;
    },
  );
}

class AssetAlertDialogue extends StatefulWidget {
  AssetAlertDialogue({
    Key? key,
    required this.unitID,
  }) : super(key: key);
  final List<String> assetList = [];
  final String unitID;

  @override
  State<AssetAlertDialogue> createState() => _AssetAlertDialogueState();
}

class _AssetAlertDialogueState extends State<AssetAlertDialogue> {
  TextEditingController itemCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(7),
      title: CustSubTitle(subtitle: "Add Assets", paddingTop: 0),
      content: Query(
          options: QueryOptions(document: gql(getAssetType)),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return Center(child: const Text('Loading'));
            }
            var repo = result.data!["asset_type"];
            print(result.data);
            widget.assetList.clear();
            for (var assetData in repo) {
              (assetData as Map<String, dynamic>).forEach((key, value) {
                if (key == "name") {
                  widget.assetList.add(value);
                }
              });
            }

            String getAssetId(assetName) {
              var data = "";
              for (var assetData in repo) {
                (assetData as Map<String, dynamic>).forEach((key, value) {
                  if (value == assetName) {
                    data = assetData["id"];
                  }
                });
              }
              return data;
            }

            return Mutation(
                options: MutationOptions(
                  onError: (error) =>
                      Text("errrr------------" + error.toString()),
                  document: gql(addUnitAsset),
                  onCompleted: (dynamic resultData) {
                    print("mutation result -----  ${resultData.toString()}");
                  },
                ),
                builder: (
                  runMutation,
                  result,
                ) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AssetDropdown(
                          assets: widget.assetList,
                         
                        ),
                        addUnitPopupTextField("Quantity", itemCountController),
                        custElevatedButton(
                          onPressed: () {
                            print(selectedAsset.value +
                                "  " +
                                itemCountController.text);

                            // final unitAsset = List.filled(
                            //     int.parse(itemCountController.text),
                            //     selectedAsset.value);
                            // print("_____" +
                            //     getAssetId(selectedAsset.value).toString());

                            final Map<String, String> unitAsset = {
                              "asset_id":
                                  getAssetId(selectedAsset.value).toString(),
                              "unit_id": widget.unitID
                            };
                            var unitAssetJson = json.encode(unitAsset);
                            List data = List.filled(
                                int.parse(itemCountController.text),
                                unitAssetJson);
                            print(data);

                            //mutation with new asset and quantity
                            runMutation({"unit_asset": data});
                          },
                          buttonName: Text("Add"),
                          buttonHeight: 40,
                          buttonWidth: 80,
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}

class AssetDropdown extends StatelessWidget {
  List<String> assets;
  VoidCallback? refetch;
  AssetDropdown({Key? key, required this.assets, this.refetch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 80,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  "Asset",
                  style: TextStyle(fontSize: 13, color: customBlue),
                ),
              ),
              Text(":")
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  emptyBuilder: (context, searchEntry) {
                    return Mutation(
                        options: MutationOptions(
                          onError: (error) {
                            print("--------");
                            print(error);
                          },
                          document: gql(addAssetType),
                          onCompleted: (dynamic resultData) {
                            print(
                                "mutation result -----${resultData.toString()}");
                          },
                        ),
                        builder: (
                          runMutation,
                          result,
                        ) {
                          return Column(
                            children: [
                              custElevatedButton(
                                  onPressed: () {
                                    print(searchEntry);
                                    runMutation({"asset_name": searchEntry});

                                    refetch;

                                    Navigator.pop(context);
                                  },
                                  buttonName: Text("Add"))
                            ],
                          );
                        });
                  },
                  errorBuilder: (context, searchEntry, exception) =>
                      Text("Something went wrong"),
                  showSearchBox: true,
                  showSelectedItems: true,
                ),
                items: assets,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: " asset",
                  ),
                ),
                onChanged: (v) {
                  selectedAsset.value = v!;

                  print(v);
                }),
          ),
        ),
      )
    ]);
  }
}

Row addUnitPopupTextField(String name, TextEditingController controller) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    SizedBox(
      width: 80,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                maxLines: 2,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                name,
                style: TextStyle(fontSize: 13, color: customBlue),
              ),
            ),
            Text("c:")
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                hintStyle: TextStyle(fontSize: 12, color: Colors.grey[600]),
                fillColor: textFieldwhite),
          ),
        ),
      ),
    )
  ]);
}

//add asset type mutation

String addAssetType = r"""mutation ADD_ASSET_TYPE($asset_name: String ) {
  insert_asset_type_one(object: {name: $asset_name}){
    created_at
  }
}
 """;

//get asset type
String getAssetType = """query GET_ASSET_TYPES {
  asset_type {
    id
    name
  }
}""";

//add new assets in a unit
String addUnitAsset =
    r"""mutation ADD_UNIT_ASSET($unit_asset: [unit_assets_insert_input!]!) {
  insert_unit_assets(objects: $unit_asset){
    returning{
      id
    }
  }
}""";
