part of 'videos_bloc.dart';

class VideosState extends Equatable {
  final NetworkStatus networkStatus;
  final List<VideoEntity> videos;
  const VideosState({
    this.networkStatus = NetworkStatus.initial,
    this.videos = const <VideoEntity>[],
  });

  VideosState copyWith({NetworkStatus? networkStatus, List<VideoEntity>? videos}){
    return VideosState(
      networkStatus: networkStatus ?? this.networkStatus,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object?> get props => [networkStatus, videos];

}