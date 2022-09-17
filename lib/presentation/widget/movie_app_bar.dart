import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_movie_app/common/image_assets.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/widget/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + 4.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: (){

            },
            icon: SvgPicture.asset(
              ImageAssets.menu,
              height: 12.h,
            ),
          ),

         const  Expanded(
            child: Logo(
              height: 14,
            ),
          ),

          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.search,
              color: AppColor.whiteColor,
              size: 12.h,
            ),
          )
        ],
      ),
    );
  }
}
