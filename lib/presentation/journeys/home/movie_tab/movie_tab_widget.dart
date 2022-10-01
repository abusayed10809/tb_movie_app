import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_list_view.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_constants.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab_title_widget.dart';
import 'package:tb_movie_app/presentation/widget/app_error_widget.dart';

class MovieTabWidget extends StatefulWidget {
  const MovieTabWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabWidget> createState() => _MovieTabWidgetState();
}

class _MovieTabWidgetState extends State<MovieTabWidget> with SingleTickerProviderStateMixin {
  MovieTabBloc get movieTabBloc => BlocProvider.of<MovieTabBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabBloc, MovieTabState>(
      builder: (context, upperTabState) {
        return Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < MovieTabConstants.movieTabs.length; i++)
                    MovieTabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabConstants.movieTabs[i].index == upperTabState.currentTabIndex,
                    ),
                ],
              ),
              Expanded(
                child: BlocBuilder<MovieTabBloc, MovieTabState>(
                  builder: (context, state) {
                    switch (state.networkStatus) {
                      case NetworkStatus.initial:
                        return const SizedBox.shrink();
                      case NetworkStatus.loading:
                        return const SizedBox.shrink();
                      case NetworkStatus.success:
                        if (state.movies!.isEmpty) {
                          return emptyData(message: TranslationConstants.noMovies.langTranslate(context));
                        }
                        return MovieListView(
                          movies: state.movies!,
                        );
                      case NetworkStatus.failure:
                        return AppErrorWidget(
                          appErrorType: state.appErrorType!,
                          onPressed: () {
                            movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: state.currentTabIndex));
                          },
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
