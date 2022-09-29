import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/widget/custom_button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Widget? image;

  const AppDialog({Key? key, required this.title, required this.description, required this.buttonText, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 32.sp,
      insetPadding: EdgeInsets.all(32.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcanColor,
              blurRadius: 16.sp,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.langTranslate(context),
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 6.h,
              ),
              child: Text(
                description.langTranslate(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            image ?? const SizedBox.shrink(),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              text: TranslationConstants.okay,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
