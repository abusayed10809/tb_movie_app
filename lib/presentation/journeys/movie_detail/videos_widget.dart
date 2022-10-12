import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/size_config.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/extensions/string_extension.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/watch_video/watch_video_argument.dart';
import 'package:tb_movie_app/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:tb_movie_app/presentation/widget/custom_button.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) {
        switch (state.networkStatus) {
          case NetworkStatus.initial:
            return loadingData();
          case NetworkStatus.success:
            if (state.videos.isEmpty) {
              return emptyData();
            }
            return CustomButton(
              text: TranslationConstants.watchTrailers,
              width: SizeConfig.width * 0.95,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WatchVideoScreen(
                      watchVideoArguments: WatchVideoArguments(state.videos),
                    ),
                  ),
                );
              },
            );
          case NetworkStatus.failure:
            return failedData();
          default:
            return emptyData(message: 'Some error occurred');
        }
      },
    );
  }
}
