import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/data/core/unauthorized_exception.dart';
import 'package:tb_movie_app/data/data_sources/authentication_local_data_source.dart';
import 'package:tb_movie_app/data/data_sources/authentication_remote_data_source.dart';
import 'package:tb_movie_app/data/models/request_token_model.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    final Either<AppError, RequestTokenModel> requestTokenEitherResponse = await _getRequestToken();
    late String token1;
    requestTokenEitherResponse.fold((l) => token1 = '', (r) => token1 = r.requestToken!);
    logMessage('token value: $token1');
    try {
      params.putIfAbsent('request_token', () => token1);
      logMessage('request body: $params');
      final validateWithLoginToken = await _authenticationRemoteDataSource.validateWithLogin(params);
      final String? sessionId = await _authenticationRemoteDataSource.createSession(validateWithLoginToken.toJson());
      if (sessionId != null) {
        await _authenticationLocalDataSource.saveSessionId(sessionId);
        return const Right(true);
      }
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return const Left(AppError(AppErrorType.unauthorized));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    await Future.wait([
      _authenticationRemoteDataSource.deleteSession(sessionId),
      _authenticationLocalDataSource.deleteSessionId(),
    ]);
    print(await _authenticationLocalDataSource.getSessionId());
    return const Right(Unit);
  }
}
