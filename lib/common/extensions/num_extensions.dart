import 'package:tb_movie_app/common/constants/size_config.dart';

extension NumExtension on num {
  String convertToPercentageString() {
    return "${((this ?? 0) * 10).toStringAsFixed(0)} %";
  }

  double width() {
    return (this ?? 0) * SizeConfig.width;
  }

  double height() {
    return (this ?? 0) * SizeConfig.height;
  }

  double fontSize(){
    return (this ?? 0) * SizeConfig.fontSize;
  }

  double heightFull(){
    return (this ?? 0) * SizeConfig.heightFull;
  }
}
