part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final NetworkStatus networkStatus;
  final AppErrorType? appErrorType;
  final MovieDetailEntity? movieDetailEntity;

  const MovieDetailState({
    this.networkStatus = NetworkStatus.initial,
    this.movieDetailEntity,
    this.appErrorType,
  });

  MovieDetailState copyWith({NetworkStatus? networkStatus, MovieDetailEntity? movieDetailEntity, AppErrorType? appErrorType}) {
    return MovieDetailState(
      networkStatus: networkStatus ?? this.networkStatus,
      movieDetailEntity: movieDetailEntity ?? this.movieDetailEntity,
      appErrorType: appErrorType ?? this.appErrorType,
    );
  }

  @override
  List<Object?> get props => [networkStatus, movieDetailEntity, appErrorType];
}
