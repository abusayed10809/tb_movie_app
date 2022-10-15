import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/movie_search_params.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams>{
  final MovieRepository movieRepository;

  SearchMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams params) {
    return movieRepository.getSearchedMovies(params.searchTerm);
  }

}