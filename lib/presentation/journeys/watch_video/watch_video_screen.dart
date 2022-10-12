import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/num_extensions.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/domain/entities/video_entity.dart';
import 'package:tb_movie_app/presentation/journeys/watch_video/watch_video_argument.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({Key? key, required this.watchVideoArguments}) : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.vulcanColor,
        title: Text(
          TranslationConstants.watchTrailers.langTranslate(context),
        ),
        centerTitle: true,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 1; i < _videos.length; i++)
                        SizedBox(
                          height: 0.2.height(),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.load(
                                    _videos[i].key!,
                                  );
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: 0.5.width(),
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: _videos[i].key!,
                                    quality: ThumbnailQuality.high,
                                  ),
                                ),
                              ),
                              Expanded(child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.05.width(),),
                                child: Text(
                                  _videos[i].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ))
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
