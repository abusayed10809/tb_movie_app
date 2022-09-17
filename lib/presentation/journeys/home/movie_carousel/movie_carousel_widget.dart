import 'package:flutter/material.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:tb_movie_app/presentation/widget/movie_app_bar.dart';
import 'package:tb_movie_app/presentation/widget/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget({Key? key, required this.movies, required this.defaultIndex}) : assert(defaultIndex>=0, 'default index cannot be less than 0'), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            const MovieDataWidget(),
            const Separator(),
          ],
        ),
      ],
    );
  }
}
