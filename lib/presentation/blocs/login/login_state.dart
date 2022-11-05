part of 'login_bloc.dart';

class LoginState extends Equatable {
  final NetworkStatus networkStatus;
  final String errorMessage;
  const LoginState({
    this.networkStatus = NetworkStatus.initial,
    this.errorMessage = '',
  });

  LoginState copyWith({
    NetworkStatus? networkStatus,
    String? errorMessage,
  }) {
    return LoginState(
      networkStatus: networkStatus ?? this.networkStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [networkStatus, errorMessage];
}
