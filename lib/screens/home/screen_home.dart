import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/register_signin_sections/authentication/authentication.dart';
import 'package:my_rent/register_signin_sections/screen_signin.dart';
import 'package:my_rent/register_signin_sections/widgets/country_dropdown.dart';
import 'package:my_rent/screens/home/add_property_section/add_property_popup.dart';
import 'package:my_rent/screens/home/screen_unit_list.dart/screen_unit_list.dart';
import 'package:my_rent/screens/home/widgets/property_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section/cust_drawer.dart';
import 'package:my_rent/widgets/cust_searchbar.dart';
import 'package:my_rent/widgets/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldWhite,
        key: _scaffoldKey,
        drawer: const PreferredSize(
            preferredSize: Size.fromHeight(50.0), child: CustDrawer()),
        appBar: CustAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Property List',
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
                showAddropertyPopup(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(children: const [
                  Icon(
                    Icons.add,
                    size: 21,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Add Property",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ]),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: Stack(
            children: [
              CustSearchBar(),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Query(
                  options: QueryOptions(
                    fetchPolicy: FetchPolicy.cacheAndNetwork,

                    document: gql(
                        getOwnerDetails), // this is the query string you just created
                  ),
                  // Just like in apollo refetch() could be used to manually trigger a refetch
                  // while fetchMore() can be used for pagination purpose
                  builder: (QueryResult result,
                      {VoidCallback? refetch, FetchMore? fetchMore}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }

                    if (result.isLoading) {
                      return const Text('Loading');
                    }

                    var repositories = result.data;

                    if (repositories == null) {
                      return const Text('No repositories');
                    }

                    print(repositories);

                    print(repositories.runtimeType);

                    return Center(child: Text(repositories.toString()));
                    // ListView.builder(
                    //       itemCount: 1,
                    //       itemBuilder: (context, index) {
                    //         return PropertyTile(
                    //           propertyName: "test property",
                    //           branchLocation: "test location",
                    //           numberOfUnits: "4",
                    //           imageSrc:
                    //               "https://www.nobroker.in/blog/wp-content/uploads/2021/03/buying-residential.jpg",
                    //         );
                    //       },
                    //     );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

const String getOwnerDetails = """
  query GET_OWNER_DETAILS(\$user_Id: String) {
  owner_details(where: {uid: {_eq: \$user_Id}}){
    business_name,
    business_type,
    address
  }
}
""";
