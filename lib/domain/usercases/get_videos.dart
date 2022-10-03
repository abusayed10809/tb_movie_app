import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/entities/video_entity.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetVideos(this.movieRepository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async{
    return await movieRepository.getVideos(params.id);
  }
}