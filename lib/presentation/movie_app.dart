import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/common/constants/route_constants.dart';
import 'package:tb_movie_app/common/constants/size_config.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/app_localizations.dart';
import 'package:tb_movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:tb_movie_app/presentation/fade_page_route_builder.dart';
import 'package:tb_movie_app/presentation/journeys/home/home_screen.dart';
import 'package:tb_movie_app/presentation/journeys/loading/loading_screen.dart';
import 'package:tb_movie_app/presentation/routes.dart';
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
  late LoadingBloc _loadingBloc;

  @override
  initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    _loadingBloc = getItInstance<LoadingBloc>();
  }

  @override
  dispose() {
    _languageBloc.close();
    _loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LanguageBloc>.value(
              value: _languageBloc,
            ),
            BlocProvider<LoadingBloc>.value(
              value: _loadingBloc,
            ),
          ],
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
                    appBarTheme: const AppBarTheme(
                      elevation: 0,
                      color: AppColor.vulcanColor,
                    ),
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
                  builder: (context, child) {
                    return LoadingScreen(
                      screen: child!,
                    );
                  },
                  initialRoute: RouteList.initial,
                  onGenerateRoute: (RouteSettings settings) {
                    final routes = Routes.getRoutes(settings);
                    final WidgetBuilder builder = routes[settings.name]!;
                    return FadePageRouteBuilder(
                      builder: builder,
                      settings: settings,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
