import 'package:flutter/material.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityWidget extends StatelessWidget {
  CityWidget({
    Key? key,
    required this.top,
    required this.left,
    required this.textCity,
    required this.onTap,
  }) : super(key: key);
  double top;
  double left;
  String textCity;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      // padding: EdgeInsets.only(top: top, left: left),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorClass.dotColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 6,
              height: 6,
            ),
            Text(
              textCity,
              style: GoogleFonts.getFont(
                'Cairo',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: ColorClass.dotColor,
                fontSize: 9.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
