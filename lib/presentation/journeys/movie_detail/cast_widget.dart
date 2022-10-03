import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/common/constants/enums.dart';
import 'package:tb_movie_app/data/core/api_constants.dart';
import 'package:tb_movie_app/domain/entities/cast_entity.dart';
import 'package:tb_movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:tb_movie_app/presentation/theme/app_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        switch (state.networkStatus) {
          case NetworkStatus.success:
            return SizedBox(
              height: 200.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.castList.length,
                itemBuilder: (context, index) {
                  final CastEntity singleCastEntity = state.castList[index];
                  return SizedBox(
                    height: 200.h,
                    width: 120.w,
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.sp,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.sp,),
                              ),
                              child: CachedNetworkImage(
                                height: 150.h,
                                width: 120.w,
                                imageUrl: '${ApiConstants.baseImageUrl}/${singleCastEntity.posterPath}',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w,),
                            child: Text(
                              singleCastEntity.name!,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.vulcanBodyText2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w, bottom: 3.h,),
                            child: Text(
                              singleCastEntity.character!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
