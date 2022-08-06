import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/widgets/after_pick_display_img.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/image_uploading_tile.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddSingleUnitProperty extends StatefulWidget {
  ScreenAddSingleUnitProperty({Key? key}) : super(key: key);

  @override
  State<ScreenAddSingleUnitProperty> createState() =>
      _ScreenAddSingleUnitPropertyState();
}

class _ScreenAddSingleUnitPropertyState
    extends State<ScreenAddSingleUnitProperty> {
  TextEditingController propertyNameController = TextEditingController();

  TextEditingController noOfRoomController = TextEditingController();

  File? imageFile;

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => imageFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustAppBar2(
            title: "Add Property",
          ),
        ),
        body: Column(
          children: [
            //------- textfields-------
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.all(10),
              child: ListView(children: [
                CustTextFieldContainer(
                  textFieldName: "Property Name",
                  controller: propertyNameController,
                ),
                CustTextFieldContainer(
                    textFieldName: "No. of Rooms",
                    controller: noOfRoomController),
                ImageUploadingTile(
                  textFieldName: "Image",
                  onPressed: () {
                    pickImage();
                  },
                ),
                //Image display section
                afterPickDisplaySection(kWidth, imageFile),
              ]),
            ),
            //------Add button------
            RoundedElevatedButton(
              onPressed: () {},
              buttonTitle: "Add",
              buttonColor: bottomNavYellow,
              borderRadius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
