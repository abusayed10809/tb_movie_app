import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/image_assets.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height}) : assert(height>0, 'height should be greater than 0'), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.appLogo,
      color: AppColor.whiteColor,
      height: height.h,
    );
  }
}
