import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_app/constant/colors.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

class AreaWidget extends StatelessWidget {
  AreaWidget({Key? key, required this.onTap, required this.textTitle})
      : super(key: key);
  final Function onTap;
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: ColorClass.dotColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              textTitle,
              style: GoogleFonts.getFont(
                'Cairo',
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: ColorClass.textColor,
                fontSize: 18.sp,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
