import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/common/constants/size_config.dart';
import 'package:tb_movie_app/common/constants/translation_constants.dart';
import 'package:tb_movie_app/common/helpers/helper_functions.dart';
import 'package:tb_movie_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:tb_movie_app/presentation/widget/custom_button.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    // final fontSize = MediaQuery.of(context).textScaleFactor;
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
              width: SizeConfig.width * 0.8,
              onPressed: () {

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
