import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_rent/constants/color_constants.dart';
import 'package:my_rent/widgets/cust_elevatedbutton.dart';

class ImageUploadingTile extends StatefulWidget {
  ImageUploadingTile({
    Key? key,
    required this.textFieldName,
    required this.onPressed,
  }) : super(key: key);
  String textFieldName;
  void Function() onPressed;

  @override
  State<ImageUploadingTile> createState() => _ImageUploadingTileState(
        onPressed: onPressed,
      );
}

class _ImageUploadingTileState extends State<ImageUploadingTile> {
  _ImageUploadingTileState({
    required this.onPressed,
  });

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          width: kWidth,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 100,
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
                        widget.textFieldName,
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
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: onPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: textFieldwhite,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                            ),
                            Text(
                              "(Accepted formats - jpeg,jpg,&png)\nsize - maximum upto 5 mb",
                              style: TextStyle(
                                fontSize: 9,
                                color: Color.fromARGB(255, 95, 95, 95),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
