import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColor.royalBlueColor,
              AppColor.violetColor,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.sp),
          ),
        ),
        child: Text(
          text.langTranslate(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
