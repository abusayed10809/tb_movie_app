import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/presentation/widget/custom_button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final VoidCallback onPressed;

  const AppErrorWidget({Key? key, required this.appErrorType, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.network ? TranslationConstants.somethingWentWrong.langTranslate(context) : TranslationConstants.checkNetwork.langTranslate(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          ButtonBar(
            children: [
              CustomButton(
                onPressed: onPressed,
                text: TranslationConstants.retry,
              ),
              CustomButton(
                onPressed: () {
                  Wiredash.of(context).show();
                },
                text: TranslationConstants.feedback,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
