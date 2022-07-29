import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/screen_tenant_details.dart';
import 'package:my_rent/screens/tenents/tenant_widgets/tenant_pic.dart';

class TenantListTile extends StatelessWidget {
  const TenantListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return ScreenTenantsDetail();
          }));
          print("tapped tenant tile");
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.05),
            color: textFieldwhite,
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TenantPic(),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tenant",
                    style: TextStyle(
                        color: customBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Contact number",
                        style: TextStyle(
                            color: customBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text("Due: ₹ 2000"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
