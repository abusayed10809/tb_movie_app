import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/image_assets.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/common/constants/route_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:tb_movie_app/presentation/journeys/favourite/favourite_screen.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/widget/app_dialog.dart';
import 'package:tb_movie_app/presentation/widget/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 20.h,
                left: 20.w,
              ),
              child: Logo(
                height: 20.h,
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favouriteMovies.langTranslate(context),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteList.favorite,
                );
              },
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.langTranslate(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(Languages.languages[index]),
                );
              },
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.langTranslate(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.langTranslate(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showAboutDialog(context);
              },
            ),
            const Spacer(),
            BlocBuilder<ThemeCubit, Themes>(builder: (context, theme) {
              return Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  icon: Icon(
                    theme == Themes.dark ? Icons.brightness_4_sharp : Icons.brightness_7_sharp,
                    color: context.read<ThemeCubit>().state == Themes.dark ? Colors.white : AppColor.vulcanColor,
                    size: 40.sp,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  _showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AppDialog(
            title: TranslationConstants.about,
            description: TranslationConstants.aboutDescription,
            buttonText: TranslationConstants.okay,
            image: Image.asset(
              ImageAssets.tmdbLogo,
              height: 60.h,
            ),
          );
        });
  }
}
