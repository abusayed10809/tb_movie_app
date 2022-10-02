import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/cast_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class GetMovieCastCrew extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository movieRepository;

  GetMovieCastCrew(this.movieRepository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await movieRepository.getMovieCastCrew(params.id);
  }
}
