import 'package:flutter/foundation.dart';

logMessage(Object object){
  if (kDebugMode) {
    print(" ");
    print("------------sssssssss-------------");
    print('xxxxxxxxxx log message xxxxxxxxxx');
    print(object);
    print('xxxxxxxxxx log message xxxxxxxxxx');
    print('----------------------------------');
  }
}