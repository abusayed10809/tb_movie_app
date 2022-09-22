import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/languages.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/presentation/app_localizations.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:tb_movie_app/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:tb_movie_app/presentation/widget/logo.dart';

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
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: TranslationConstants.language.langTranslate(context),
              onPressed: () {},
              children: Languages.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.langTranslate(context),
              onPressed: () {},
            ),
            NavigationListItem(
              title: TranslationConstants.about.langTranslate(context),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
