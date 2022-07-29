import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/tenents/tenant_widgets/tenant_list_tile.dart';
import 'package:my_rent/widgets/cust_appbar.dart';
import 'package:my_rent/widgets/drawer_section.dart/cust_drawer.dart';
import 'package:my_rent/widgets/cust_searchbar.dart';
import 'package:my_rent/widgets/cust_subtitle.dart';

class ScreenTenents extends StatefulWidget {
  const ScreenTenents({Key? key}) : super(key: key);

  @override
  State<ScreenTenents> createState() => _ScreenTenentsState();
}

class _ScreenTenentsState extends State<ScreenTenents> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldWhite,
        key: _scaffoldKey,
        drawer: CustDrawer(),
        appBar: CustAppBar(
          scaffoldKey: _scaffoldKey,
          title: 'Tenant List',
        ),
        extendBody: true,
        body: Container(
          margin: EdgeInsets.only(right: 15, left: 15),
          child: Stack(
            children: [
              CustSearchBar(),
              CustSubTitle(
                subtitle: 'All Tenants',
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return TenantListTile();
                    })),
              ),
            ],
          ),
        ));
  }
}
