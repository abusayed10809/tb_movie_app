import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/journeys/loading/loading_circle.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.vulcanColor.withOpacity(0.8),
      ),
      child: Center(
        child: LoadingCircle(size: 200.sp,),
      ),
    );
  }
}
