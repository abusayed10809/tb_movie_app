import 'package:tb_movie_app/data/models/video_model.dart';
class VideoResultModel {
  int? id;
  List<VideoModel>? videos;

  VideoResultModel({this.id, this.videos});

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      videos = <VideoModel>[];
      json['results'].forEach((v) {
        videos?.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (videos != null) {
      data['results'] = videos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}