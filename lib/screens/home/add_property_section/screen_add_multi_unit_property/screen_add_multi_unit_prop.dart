import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/screens/home/add_property_section/widgets/after_pick_display_img.dart';
import 'package:my_rent/widgets/cust_textfield_pre_title.dart';
import 'package:my_rent/widgets/cust_appbar2.dart';
import 'package:my_rent/widgets/cust_textbutton.dart';
import 'package:my_rent/widgets/image_uploading_tile.dart';
import 'package:my_rent/widgets/rounded_elevated_button.dart';

class ScreenAddMultiUnitProperty extends StatefulWidget {
  ScreenAddMultiUnitProperty({Key? key}) : super(key: key);

  @override
  State<ScreenAddMultiUnitProperty> createState() =>
      _ScreenAddMultiUnitPropertyState();
}

class _ScreenAddMultiUnitPropertyState
    extends State<ScreenAddMultiUnitProperty> {
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController noOfRoomController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final storageRef = FirebaseStorage.instance.ref();
  var id = "";
  String imgName = "";
  File? imageFile;

  var result;

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (image == null) return;

      final imageTemp = File(image.path);
      imgName = image.name;
      setState(() => imageFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadImage() async {
    try {
      print(imgName);
      final imagesRef = storageRef.child(imgName);
      print(imagesRef);

      await imagesRef.putFile(
          imageFile!,
          SettableMetadata(
              contentType: "image/jpeg",
              customMetadata: {"propertyId": "$id"}));
    } catch (e) {
      print('Failed $e');
    }
  }

//TODO upload img  (not a text field)
  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;

    return Mutation(
      options: MutationOptions(
        document: gql(ADD_PROPERTY),

        onError: (error) => print("mutation errrr" +
            error.toString()), // this is the mutation string you just created

        onCompleted: (dynamic resultData) {
          id = resultData["insert_property_owner_one"]["property"]["id"];
          print(resultData["insert_property_owner_one"]["property"]["id"]);
          uploadImage();
        },
      ),
      builder: (
        runMutation,
        result,
      ) {
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
                    CustTextFieldContainer(
                        textFieldName: "Address",
                        controller: addressController),
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
                  onPressed: () {
                    runMutation({
                      'no_of_rooms': noOfRoomController.text,
                      'property_name': propertyNameController.text,
                      'address': addressController.text,
                    });

                    // uploadImage();
                  },
                  buttonTitle: "Add",
                  buttonColor: bottomNavYellow,
                  borderRadius: 12,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

String ADD_PROPERTY =
    r"""mutation ADD_PROPERTY($no_of_rooms: Int, $property_name: String , $address: String ) {
  insert_property_owner_one(object: {property: {data: {no_of_rooms: $no_of_rooms, property_name: $property_name, address: $address}}}){
    property{
      id
    }
  }
}



""";
