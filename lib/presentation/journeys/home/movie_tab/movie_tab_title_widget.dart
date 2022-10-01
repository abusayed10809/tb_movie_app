import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';

class MovieTabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const MovieTabTitleWidget({Key? key, required this.title, required this.onTap, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlueColor : Colors.transparent,
              width: 1.w,
            ),
          ),
        ),
        child: Text(
          title.langTranslate(context),
          style: isSelected ? Theme.of(context).textTheme.royalBlueSubtitle2 : Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }
}
