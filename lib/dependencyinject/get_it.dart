import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tb_movie_app/data/core/api_client.dart';
import 'package:tb_movie_app/data/data_sources/movie_local_data_source.dart';
import 'package:tb_movie_app/data/data_sources/movie_remote_ds.dart';
import 'package:tb_movie_app/data/repository_impls/movie_repository_impl.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/check_if_movie_favourite.dart';
import 'package:tb_movie_app/domain/usercases/delete_favourite_movie.dart';
import 'package:tb_movie_app/domain/usercases/get_coming_soon.dart';
import 'package:tb_movie_app/domain/usercases/get_favourite_movies.dart';
import 'package:tb_movie_app/domain/usercases/get_movie_cast_crew.dart';
import 'package:tb_movie_app/domain/usercases/get_movie_detail.dart';
import 'package:tb_movie_app/domain/usercases/get_playing_now.dart';
import 'package:tb_movie_app/domain/usercases/get_popular.dart';
import 'package:tb_movie_app/domain/usercases/get_trending.dart';
import 'package:tb_movie_app/domain/usercases/get_videos.dart';
import 'package:tb_movie_app/domain/usercases/save_movie.dart';
import 'package:tb_movie_app/domain/usercases/search_movies.dart';
import 'package:tb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  /// api clients
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  /// remote data sources
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl());
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance(), getItInstance()));

  /// use cases
  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieCastCrew>(() => GetMovieCastCrew(getItInstance()));
  getItInstance.registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  getItInstance.registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));
  getItInstance.registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));
  getItInstance.registerLazySingleton<GetFavouriteMovies>(() => GetFavouriteMovies(getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavouriteMovie>(() => DeleteFavouriteMovie(getItInstance()));
  getItInstance.registerLazySingleton<CheckIfMovieFavourite>(() => CheckIfMovieFavourite(getItInstance()));

  /// blocs
  getItInstance.registerFactory(() => MovieCarouselBloc(getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(() => MovieTabBloc(getPopular: getItInstance(), getPlayingNow: getItInstance(), getComingSoon: getItInstance()));
  getItInstance.registerFactory(() => MovieDetailBloc(getMovieDetail: getItInstance(), castBloc: getItInstance(), videosBloc: getItInstance()));
  getItInstance.registerFactory(() => CastBloc(getCast: getItInstance()));
  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));
  getItInstance.registerFactory(() => SearchMovieBloc(searchMovies: getItInstance()));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
