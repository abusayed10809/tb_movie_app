import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:tb_movie_app/data/core/api_client.dart';
import 'package:tb_movie_app/data/data_sources/movie_remote_ds.dart';
import 'package:tb_movie_app/data/repository_impls/movie_repository_impl.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/get_coming_soon.dart';
import 'package:tb_movie_app/domain/usercases/get_playing_now.dart';
import 'package:tb_movie_app/domain/usercases/get_popular.dart';
import 'package:tb_movie_app/domain/usercases/get_trending.dart';
import 'package:tb_movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:tb_movie_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));

  getItInstance.registerFactory(() => MovieCarouselBloc(getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(
    () => MovieTabBloc(
      getPopular: GetPopular(getItInstance()),
      getPlayingNow: GetPlayingNow(getItInstance()),
      getComingSoon: GetComingSoon(getItInstance()),
    ),
  );
}
