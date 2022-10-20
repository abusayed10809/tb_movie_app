import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
