import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:tb_movie_app/presentation/journeys/loading/loading_circle.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (state is LoadingStarted)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.vulcanColor.withOpacity(0.8),
                ),
                child: Center(
                  child: LoadingCircle(
                    size: 200.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
