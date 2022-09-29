import 'package:flutter/material.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final Widget child;
  final String languageCode;

  const WiredashApp({Key? key, required this.child, required this.languageCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: "tbmovieapp-ju7havj",
      secret: "ScZstLdjrP_ejRLxdxPf7kaMpx0D2HvK",
      options: WiredashOptionsData(
          locale: Locale.fromSubtags(
        languageCode: languageCode,
      )),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlueColor,
        secondaryColor: AppColor.violetColor,
        secondaryBackgroundColor: AppColor.vulcanColor,
      ),
      child: child,
    );
  }
}
