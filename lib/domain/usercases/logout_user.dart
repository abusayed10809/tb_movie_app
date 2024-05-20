import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/repositories/authentication_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams>{
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(params) async{
    return _authenticationRepository.logoutUser();
  }
}