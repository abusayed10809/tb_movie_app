import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_movie_app/presentation/journeys/loading/loading_circle.dart';

logMessage(Object object) {
  if (kDebugMode) {
    print(" ");
    print("------------sssssssss-------------");
    print('xxxxxxxxxx log message xxxxxxxxxx');
    print(object);
    print('xxxxxxxxxx log message xxxxxxxxxx');
    print('----------------------------------');
  }
}

Widget emptyData({String? message}) {
  return Center(
    child: Text(
      message ?? 'Empty Data',
      style: TextStyle(
        fontSize: 15.sp,
      ),
    ),
  );
}

Widget loadingData(){
  return Center(
    child: LoadingCircle(size: 100.w,),
  );
}

Widget failedData({String? message}) {
  return Center(
    child: Text(
      message ?? 'Some error occurred, please try again.',
      style: TextStyle(
        fontSize: 15.sp,
      ),
    ),
  );
}

// Widget loadingData(){
//   return const Center(
//     child: CircularProgressIndicator(),
//   );
// }