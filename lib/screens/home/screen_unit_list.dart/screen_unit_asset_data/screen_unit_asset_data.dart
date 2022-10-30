import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_unit_asset_data/widgets/add_asset_popup.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_unit_asset_data/widgets/unit_asset_tile.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenUnitAssetData extends StatefulWidget {
  ScreenUnitAssetData(
      {Key? key,
      required this.unitName,
      required this.currentTenant,
      required this.unitStatus,
      required this.agreeRenewDate,
      required this.statusColor,
      required this.unitID})
      : super(key: key);

  Color statusColor;
  String unitName;
  String currentTenant;
  String unitStatus;
  String agreeRenewDate;
  String unitID;

  @override
  State<ScreenUnitAssetData> createState() => _ScreenUnitAssetDataState();
}

class _ScreenUnitAssetDataState extends State<ScreenUnitAssetData> {
  TextEditingController assetSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: widget.unitName,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showAddAssetPopup(context, widget.unitID);
            },
            backgroundColor: customBlue,
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            )),
        body: Query(
            options: QueryOptions(
                document: gql(getUnitAsset), variables: {"uid": widget.unitID}),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              print(result.data);
              var repo = result.data!["property_unit"][0];
              List assetData = repo["unit_assets"];
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 110,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: widget.statusColor,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.home,
                                    size: 55,
                                    color: widget.statusColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Current Tenant: ${widget.currentTenant}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: pieChartEmptyColor2),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "Current Status: ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: pieChartEmptyColor2),
                                          children: [
                                        TextSpan(
                                          text: widget.unitStatus,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: widget.statusColor,
                                          ),
                                        )
                                      ])),
                                  Text(
                                    "Agreement Renews on ${widget.agreeRenewDate}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: pieChartEmptyColor2),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Divider(
                      color: bottomNavYellow,
                      endIndent: 30,
                      indent: 30,
                      thickness: 1.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: CustSubTitle(
                          subtitle: "Assets",
                          fontWeight: FontWeight.w500,
                          fontsize: 18,
                          paddingTop: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: assetData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UnitAssetTile(
                              assetName: repo["unit_assets"][index]["asset"]
                                      ["name"]
                                  .toString(),
                              assetCount: repo["unit_assets"][index]
                                      ["asset_count"]["count"]
                                  .toString(),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

//
const String getUnitAsset = r"""query GET_UNIT_ASSET($uid: uuid) {
  property_unit(where: {id: {_eq: $uid}}) {
    id
    unit_assets(distinct_on: asset_id) {
      asset {
        name
      }
      asset_count {
        count
      }
    }
  }
}""";
