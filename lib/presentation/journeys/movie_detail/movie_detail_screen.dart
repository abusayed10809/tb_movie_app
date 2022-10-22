import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/dependencyinject/get_it.dart';
import 'package:tb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/big_poster.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/videos_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;
  late FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _favouriteBloc = _movieDetailBloc.favouriteBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _videosBloc.close();
    _favouriteBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MovieDetailBloc>.value(
              value: _movieDetailBloc,
            ),
            BlocProvider<CastBloc>.value(
              value: _castBloc,
            ),
            BlocProvider<VideosBloc>.value(
              value: _videosBloc,
            ),
            BlocProvider<FavouriteBloc>.value(
              value: _favouriteBloc,
            ),
          ],
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
              switch (state.networkStatus) {
                case NetworkStatus.initial:
                  return const SizedBox.shrink();
                case NetworkStatus.loading:
                  return const SizedBox.shrink();
                case NetworkStatus.success:
                  final movieDetail = state.movieDetailEntity;
                  return Column(
                    children: [
                      BigPoster(
                        movie: movieDetail!,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          movieDetail.overview!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          TranslationConstants.cast.langTranslate(context),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const CastWidget(),
                      SizedBox(height: 10.h,),
                      const VideosWidget(),
                    ],
                  );
                case NetworkStatus.failure:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
