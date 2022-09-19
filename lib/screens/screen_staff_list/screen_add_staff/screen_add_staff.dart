import 'package:flutter/material.dart';
import 'package:my_rent/screens/screen_staff_list/screen_add_staff/widgets/role_dropdown.dart';
import 'package:my_rent/screens/tenents/screen_tenant_details/options_button/screen_addcharges/widgets/reason_dropdown.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddStaff extends StatefulWidget {
  ScreenAddStaff({Key? key}) : super(key: key);

  @override
  State<ScreenAddStaff> createState() => _ScreenAddStaffState();
}

class _ScreenAddStaffState extends State<ScreenAddStaff> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Staff",
          ),
        ),
        body: Column(
          children: [
         
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Name",
                  controller: nameController,
                ),
                CustTextFieldContainer(
                    textFieldName: "Username", controller: usernameController),
                CustTextFieldContainer(
                    textFieldName: "Password", controller: passwordController),
                CustTextFieldContainer(
                  textFieldName: "Re-enter\nPassword",
                  controller: rePasswordController,
                ),
                RoleDropdownWidget(textFieldName: "Choose Role"),
                CustTextFieldContainer(
                    textFieldName: "Phone No.", controller: phoneNumController),
                CustTextFieldContainer(
                    textFieldName: "Email", controller: emailController),
              ]),
            ),
            //------submit button------
            RoundedElevatedButton(
              onPressed: () {
           
              },
              buttonTitle: "Add",
              borderRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
