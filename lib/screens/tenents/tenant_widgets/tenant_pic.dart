import 'package:flutter/material.dart';
import 'package:my_rent/constants/color_constants.dart';

class TenantPic extends StatelessWidget {
  const TenantPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60.0,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage(
                'https://previews.123rf.com/images/metelsky/metelsky1809/metelsky180900233/109815470-man-avatar-profile-male-face-icon-vector-illustration-.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: bottomNavYellow,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
