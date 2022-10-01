import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
