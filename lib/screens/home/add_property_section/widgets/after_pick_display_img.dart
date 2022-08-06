import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

SizedBox afterPickDisplaySection(double kWidth, imageFile) {
  return SizedBox(
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
                  "",
                  style: TextStyle(fontSize: 13, color: customBlue),
                ),
              ),
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                  width: 200,
                  height: 150,
                  child: imageFile != null
                      ? Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        )
                      : SizedBox()),
            ),
          ),
        ),
      ),
    ]),
  );
}
