import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: 80.w,
      padding: EdgeInsets.only(
        top: 2.h,
        bottom: 6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(1.h),
        ),
        gradient: const LinearGradient(
          colors: [
            AppColor.violetColor,
            AppColor.royalBlueColor,
          ]
        )
      ),
    );
  }
}
