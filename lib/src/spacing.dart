import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  static final MediaQueryData mediaQueryData =
  MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  static final EdgeInsets viewPadding = mediaQueryData.viewPadding;
  static final double paddingHorizontal = 14.sp;
  static final double heightHeader = 55.sp;
  static final double realHeightHeader = viewPadding.top + heightHeader;
  static final double width = mediaQueryData.size.width;
  static final double height = mediaQueryData.size.height;
}