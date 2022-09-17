part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object?> get props => [];
}

class MovieCarouselLoadEvent extends MovieCarouselEvent{
  final int defaultIndex;

  const MovieCarouselLoadEvent({this.defaultIndex = 0}) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object?> get props => [defaultIndex];
}