import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/journeys/home/home_screen.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            primaryColor: AppColor.vulcanColor,
            scaffoldBackgroundColor: AppColor.vulcanColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: AppText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0),
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
