part of 'cast_bloc.dart';

class CastState extends Equatable {
  final NetworkStatus networkStatus;
  final List<CastEntity> castList;
  const CastState({
    this.networkStatus = NetworkStatus.initial,
    this.castList = const <CastEntity>[],
  });

  CastState copyWith({NetworkStatus? networkStatus, List<CastEntity>? castList}) {
    return CastState(
      networkStatus: networkStatus ?? this.networkStatus,
      castList: castList ?? this.castList,
    );
  }

  @override
  List<Object?> get props => [networkStatus, castList];
}
