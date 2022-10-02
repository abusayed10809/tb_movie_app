import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/cast_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/usercases/get_movie_cast_crew.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetMovieCastCrew getCast;
  CastBloc({required this.getCast}) : super(const CastState()) {
    on<LoadCastEvent>(_onLoadCastEvent);
  }

  FutureOr<void> _onLoadCastEvent(LoadCastEvent event, Emitter<CastState> emit) async {
    Either<AppError, List<CastEntity>> eitherResponse = await getCast(MovieParams(event.movieId));
    eitherResponse.fold(
      (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, castList: <CastEntity>[]),);
      },
      (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success, castList: r),);
      },
    );
  }
}
