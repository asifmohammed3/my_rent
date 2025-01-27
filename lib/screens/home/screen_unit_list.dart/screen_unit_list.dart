import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/screen_home.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_add_unit/screen_add_unit.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/unit_list_header_tile.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/unit_list_tile.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/widgets/vacant_occupied_count_sec.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';

class ScreenUnitList extends StatefulWidget {
  ScreenUnitList({Key? key, required this.propertyId}) : super(key: key);

  final String propertyId;
  @override
  State<ScreenUnitList> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenUnitList> {
  final GlobalKey<ScaffoldState> _scaffolddKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        fetchPolicy: FetchPolicy.cacheAndNetwork,

        document:
            gql(LIST_PROPERTIES), // this is the query string you just created
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var repositories = result.data;

        if (repositories == null) {
          return const Text('No repositories');
        }
        print(repositories);
        List<dynamic> list = result.data!["property"];

        print(repositories);

        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: scaffoldWhite,
            drawer: const PreferredSize(
                preferredSize: Size.fromHeight(50.0), child: CustDrawer()),
            appBar: CustAppBar(
              scaffoldKey: _scaffolddKey,
              title: 'Unit List',
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: SizedBox(
                width: 122,
                height: 52,
                child: FloatingActionButton(
                  backgroundColor: customBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  onPressed: () {
                    //navigate to add unit page
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return ScreenAddUnit(propertyId: widget.propertyId,);
                    })));
                  },
                  child: Row(children: const [
                    Icon(
                      Icons.add,
                      size: 21,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Add Unit",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ]),
                ),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  //header tile
                  unitListHeaderTile(
                      "https://www.nobroker.in/blog/wp-content/uploads/2021/03/buying-residential.jpg",
                      "",
                      ""),

                  // no of vacant occuppied circle dot section
                  vacantOccupiedCountSec("1", "0"),

                  //Unit tile lists
                  Expanded(
                    child: ListView(
                      children: [
                        unitListTile(
                          unitName: "Unit 1",
                          currentTenant: "Tenant 1",
                          unitStatus: "Vacant", //"Occupied"  or "Vacant"
                          agreeRenewDate: "30/11/2023",
                        ),
                        unitListTile(
                          unitName: "Unit 1",
                          currentTenant: "Tenant 1",
                          unitStatus: "Occupied", //"Occupied"  or "Vacant"
                          agreeRenewDate: "30/11/2023",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//add unit

String addPropertyUnit = r""" 
query LIST_PROPERTY {
  property {
    id
    property_name
    address
    property_images {
      path
    }
  }
}
 """;
