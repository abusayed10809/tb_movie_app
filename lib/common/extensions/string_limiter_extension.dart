extension StringLimiterExtension on String{
  String intelliTrim15(){
    return length > 15 ? '${substring(0, 15)}...' : this;
  }
}