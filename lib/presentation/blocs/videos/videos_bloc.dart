import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/entities/video_entity.dart';
import 'package:tb_movie_app/domain/usercases/get_videos.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({required this.getVideos}) : super(const VideosState()) {
    on<LoadVideosEvent>(_onLoadVideosEvent);
  }

  FutureOr<void> _onLoadVideosEvent(LoadVideosEvent event, Emitter<VideosState> emit) async {
    final Either<AppError, List<VideoEntity>> eitherResponse = await getVideos(MovieParams(event.movieId));
    eitherResponse.fold(
      (l) {
        emit(state.copyWith(networkStatus: NetworkStatus.failure, videos: <VideoEntity>[]));
      },
      (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success, videos: r));
      },
    );
  }
}
