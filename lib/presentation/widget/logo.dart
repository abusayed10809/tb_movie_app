import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/image_assets.dart';
import 'package:tb_movie_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height})
      : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Themes>(
      builder: (context, state) {
        return Image.asset(
          ImageAssets.appLogo,
          color: state == Themes.dark ? AppColor.whiteColor : AppColor.vulcanColor,
          height: height.h,
        );
      },
    );
  }
}
