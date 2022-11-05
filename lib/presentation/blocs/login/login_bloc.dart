import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/login_request_params.dart';
import 'package:tb_movie_app/domain/usercases/login_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  LoginBloc({required this.loginUser}) : super(const LoginState()) {
    on<LoginInitiateEvent>(_onLoginInitiateEvent);
  }

  FutureOr<void> _onLoginInitiateEvent(LoginInitiateEvent event, Emitter<LoginState> emit) async {
    final Either<AppError, bool> eitherResponse = await loginUser(
      LoginRequestParams(
        userName: event.username,
        password: event.password,
      ),
    );

    eitherResponse.fold(
      (l) {
        String message = getErrorMessage(l.appErrorType);
        emit(state.copyWith(networkStatus: NetworkStatus.failure, errorMessage: message));
      },
      (r) {
        emit(state.copyWith(networkStatus: NetworkStatus.success,));
      },
    );
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch(appErrorType){

      case AppErrorType.api:
        return TranslationConstants.noNetwork;
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.unauthorized:
        return TranslationConstants.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstants.sessionDenied;
      case AppErrorType.localDb:
        return TranslationConstants.somethingWentWrong;
    }
  }
}
