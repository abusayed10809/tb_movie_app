import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class DeleteFavouriteMovie extends UseCase<void, MovieParams>{
  final MovieRepository movieRepository;

  DeleteFavouriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams params) async{
    return await movieRepository.deleteFavouriteMovies(params.id);
  }

}