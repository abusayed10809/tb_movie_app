part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();
}

class LoadFavouriteMovieEvent extends FavouriteEvent{
  @override
  List<Object?> get props => [];
}

class DeleteFavouriteMovieEvent extends FavouriteEvent{
  final int movieId;
  const DeleteFavouriteMovieEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class ToggleFavouriteMovieEvent extends FavouriteEvent{
  final MovieEntity movieEntity;
  final bool isFavourite;

  const ToggleFavouriteMovieEvent({required this.isFavourite, required this.movieEntity});

  @override
  List<Object?> get props => [movieEntity, isFavourite];
}

class CheckIfMovieFavouriteEvent extends FavouriteEvent{
  final int movieId;

  const CheckIfMovieFavouriteEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];

}