import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/presentation/journeys/home/movie_tab/movie_tab.dart';

class MovieTabConstants{
  static const List<MovieTab> movieTabs = [
    MovieTab(index: 0, title: TranslationConstants.popular),
    MovieTab(index: 1, title: TranslationConstants.now),
    MovieTab(index: 2, title: TranslationConstants.soon),
  ];
}