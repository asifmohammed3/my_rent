import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/options_popup.dart';
import 'package:my_rent/screens/tenents/tenant_widgets/tenant_pic.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';

class ScreenTenantsDetail extends StatelessWidget {
  const ScreenTenantsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;
    var kWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: CustAppBar2(
              icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
              title: "Tenant Detail",
              textColor: Colors.white,
            ),
          ),
          body: SizedBox(
            width: kWidth,
            height: kHeight,
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: <Widget>[
                //blue scaffold background container
                Container(
                  width: kWidth,
                  height: kHeight * 1.1 / 4,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.centerRight,
                          colors: [
                        Color.fromARGB(250, 14, 76, 149),
                        Color.fromARGB(230, 50, 108, 175),
                      ])),
                ),

                //white box
                Positioned(
                  top: kHeight * 1 / 6,
                  left: kWidth * 2.6 / 20,
                  right: kWidth * 2.6 / 20,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(200, 110, 110, 110),
                        )
                      ],
                      border: Border.all(width: 0.05),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    width: 225,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        children: const [
                          Text(
                            "Tenant 1",
                            style: TextStyle(
                                color: customBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Phone Number: 1234567890",
                            style: TextStyle(
                                color: customBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Pending Amount: None",
                            style: TextStyle(
                                color: customBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //tenant pic
                Positioned(
                  top: kHeight * 1.1 / 10,
                  left: kWidth * 2.6 / 20,
                  right: kWidth * 2.6 / 20,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.05),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      width: 80,
                      height: 80,
                      child: const TenantPic(),
                    ),
                  ),
                ),
//-----------------------info section------------------------
                Positioned(
                    top: kHeight * 4.4 / 10,
                    left: 20,
                    right: 20,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //property info
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.05),
                                    color: textFieldwhite,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                  width: 150,
                                  height: 60,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Property Name",
                                          style: TextStyle(
                                              color: customBlue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),

                                        //TODO

                                        Text(
                                          "Property 1",
                                          style: TextStyle(
                                              color: customBlue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ]),
                                ),
                              ),

                              //Occuppation info
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.05),
                                  color: textFieldwhite,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                width: 150,
                                height: 60,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Occupation Date",
                                        style: TextStyle(
                                            color: customBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      //TODO

                                      Text(
                                        "01/05/2022",
                                        style: TextStyle(
                                            color: customBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ]),
                              ),
                            ],
                          ),

                          //Unit info
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.05),
                              color: textFieldwhite,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            width: 150,
                            height: 60,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Unit Number",
                                    style: TextStyle(
                                        color: customBlue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  //TODO
                                  Text(
                                    "3",
                                    style: TextStyle(
                                        color: customBlue, fontSize: 16),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )),

//------------------------buttons-------------------------
                Positioned(
                  top: kHeight * 6.4 / 10,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Options button w120 50
                          custElevatedButton(
                              buttonName: Text("Options"),
                              onPressed: () {
                                showOptionsPopup(context);
                              }),

                          //CheckOut button w120 50
                          custElevatedButton(
                              buttonName: Text("CheckOut"), onPressed: () {}),
                        ],
                      ),
                      //Unit button w250 50
                      custElevatedButton(
                          buttonWidth: 250,
                          buttonName: Text("Collect Rent"),
                          onPressed: () {}),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
