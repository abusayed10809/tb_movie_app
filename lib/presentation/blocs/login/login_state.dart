part of 'login_bloc.dart';

class LoginState extends Equatable {
  final NetworkStatus networkStatus;
  final NetworkStatus logoutNetworkStatus;
  final String errorMessage;
  const LoginState({
    this.networkStatus = NetworkStatus.initial,
    this.logoutNetworkStatus = NetworkStatus.initial,
    this.errorMessage = '',
  });

  LoginState copyWith({
    NetworkStatus? networkStatus,
    NetworkStatus? logoutNetworkStatus,
    String? errorMessage,
  }) {
    return LoginState(
      networkStatus: networkStatus ?? this.networkStatus,
      logoutNetworkStatus: logoutNetworkStatus ?? this.logoutNetworkStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [networkStatus, errorMessage, logoutNetworkStatus];
}
