import 'package:tb_movie_app/common/constants/size_config.dart';

extension NumExtension on num {
  String convertToPercentageString() {
    return "${(this * 10).toStringAsFixed(0)} %";
  }

  double width() {
    return (this * SizeConfig.width);
  }

  double height() {
    return (this * SizeConfig.height);
  }

  double fontSize(){
    return (this * SizeConfig.fontSize);
  }

  double heightFull(){
    return (this * SizeConfig.heightFull);
  }
}
