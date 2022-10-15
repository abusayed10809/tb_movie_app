import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/num_extensions.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';
import 'package:tb_movie_app/presentation/widget/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate({required this.searchMovieBloc});

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        iconSize: 20.sp,
        onPressed: query.isEmpty
            ? null
            : () {
                query = '';
              },
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlueColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 15.sp,
        // size: 20.width(),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(SearchTermChangedEvent(query));
    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        switch (state.networkStatus) {
          case NetworkStatus.initial:
            return const SizedBox.shrink();
          case NetworkStatus.loading:
            return loadingData();
          case NetworkStatus.success:
            final movies = state.movies;
            if (movies.isEmpty) {
              return emptyData(
                message: TranslationConstants.noMoviesSearched.langTranslate(context),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return SearchMovieCard(
                  movie: movies[index],
                );
              },
              itemCount: movies.length,
              scrollDirection: Axis.vertical,
            );
          case NetworkStatus.failure:
            return AppErrorWidget(
              appErrorType: AppErrorType.api,
              onPressed: () {
                searchMovieBloc.add(SearchTermChangedEvent(query));
              },
            );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
