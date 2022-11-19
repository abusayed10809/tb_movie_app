import 'package:flutter/material.dart';
import 'package:tb_movie_app/common/constants/route_constants.dart';
import 'package:tb_movie_app/presentation/journeys/favourite/favourite_screen.dart';
import 'package:tb_movie_app/presentation/journeys/home/home_screen.dart';
import 'package:tb_movie_app/presentation/journeys/loading/loading_screen.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:tb_movie_app/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:tb_movie_app/presentation/journeys/watch_video/watch_video_argument.dart';
import 'package:tb_movie_app/presentation/journeys/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RouteList.initial: (context) => const HomeScreen(),
    RouteList.movieDetail: (context) => MovieDetailScreen(
      movieDetailArguments: setting.arguments as MovieDetailArguments,
    ),
    RouteList.watchTrailer: (context) => WatchVideoScreen(
      watchVideoArguments: setting.arguments as WatchVideoArguments,
    ),
    RouteList.favorite: (context) => const FavouriteScreen(),
  };
}