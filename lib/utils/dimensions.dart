import 'package:get/get.dart';


class Dimensions{

  static double screenHeight = Get.context!.height;
  //834.9090909090909
  static double screenWidth = Get.context!.width;
  //392.72727272727275

  static double paddingWith_10 = screenWidth / 30;
  static double paddingWith_15 = screenWidth / 22;
  static double paddingWith_20 = screenWidth / 15;

  static double paddingHeight_10 = screenWidth / 75;
  static double paddingHeight_20 = screenWidth / 35;
  static double paddingHeight_30 = screenWidth / 17;
  static double paddingHeight_40 = screenWidth / 8;

  //**************** font size ***************
  //12
  static double fontVVerySmallSize = screenWidth / 32.66;
  //14
  static double fontVerySmallSize = screenWidth / 28;
  //16
  static double fontSmallSize = screenWidth / 24.5;
  //19
  static double fontMiddleSize = screenWidth / 20.63;
  //24
  static double fontLargeSize = screenWidth / 16.33;

  //**************** icon size ***************
  //26
  static double iconSmallSize = screenWidth / 15.07;
  //50
  static double iconMiddleSize = screenWidth / 7.84;

  //**************** radius size ***************
  //5
  static double smallRadius = screenWidth / 78.4;
  //8
  static double middleRadius = screenWidth / 49;

//**************** description box size ***************
  //200
  static double descriptionBoxSize = screenWidth / 1.96;
  //250
  static double descriptionDetailBoxSize = screenWidth / 1.568;
}