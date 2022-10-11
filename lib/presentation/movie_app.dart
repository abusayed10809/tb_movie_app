import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/common/constants/size_config.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/app_localizations.dart';
import 'package:tb_movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/home/home_screen.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';
import 'package:tb_movie_app/presentation/widget/wiredash_app.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;

  @override
  initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocProvider<LanguageBloc>.value(
            value: _languageBloc,
            child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                return WiredashApp(
                  languageCode: state.locale.languageCode,
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Movie App',
                    theme: ThemeData(
                      unselectedWidgetColor: AppColor.royalBlueColor,
                      primaryColor: AppColor.vulcanColor,
                      accentColor: AppColor.royalBlueColor,
                      scaffoldBackgroundColor: AppColor.vulcanColor,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      textTheme: AppText.getTextTheme(),
                      appBarTheme: const AppBarTheme(elevation: 0),
                    ),
                    supportedLocales: Languages.languages
                        .map(
                          (e) => Locale(e.code),
                        )
                        .toList(),
                    locale: state.locale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    home: child,
                  ),
                );
              },
            ),
          );
        },
        child: const HomeScreen(),
      );
    });
  }
}
