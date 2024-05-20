import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/image_assets.dart';
import 'package:tb_movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:tb_movie_app/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/widget/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().statusBarHeight + 4.h,
        left: 16.w,
        right: 16.w,
      ),
      child: BlocBuilder<ThemeCubit, Themes>(
  builder: (context, themeState) {
    return Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              ImageAssets.menu,
              height: 20.h,
              color: themeState == Themes.dark ? AppColor.whiteColor : AppColor.vulcanColor,
            ),
          ),
          const Expanded(
            child: Logo(
              height: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate(searchMovieBloc: BlocProvider.of<SearchMovieBloc>(context),),);
            },
            icon: Icon(
              Icons.search,
              color: themeState == Themes.dark ? AppColor.whiteColor : AppColor.vulcanColor,
              size: 20.h,
            ),
          )
        ],
      );
  },
),
    );
  }
}
