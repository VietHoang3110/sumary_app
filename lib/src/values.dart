import 'dart:convert';
import 'dart:ui';
import 'dart:io' show File, Platform;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sumary_app/src/messages.dart';

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

class AppValue {
  AppValue._();

  static format_money(double money) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    return currencyFormatter.format(money);
  }

  static final APP_MONEY_FORMAT = new NumberFormat.currency(locale: 'vi', symbol: MESSAGES.MONEY_UNIT); // ignore: non_constant_identifier_names
  static final APP_DATE_FORMAT = DateFormat('yyyy-MM-ddTkk:mm'); // ignore: non_constant_identifier_names
  static final APP_DATE_FORMAT_1 = DateFormat('kk:mm dd-MM-yyyy'); // ignore: non_constant_identifier_names
  static final DATE_FORMAT = DateFormat('dd/MM/yyyy'); // ignore: non_constant_identifier_names
  static final SHORT_DATE_FORMAT = DateFormat('dd/MM/yy'); // ignore: non_constant_identifier_names
  static final APP_DATE_FORMAT_ONLY_DATE = DateFormat('dd-MM-yyyy'); // ignore: non_constant_identifier_names
  static final YEAR_MONTH_DAY = DateFormat('yyyy-MM-dd'); // ignore: non_constant_identifier_names
  static final FORMAT_PRICE = new NumberFormat("#,##0.00", "en_US"); // ignore: non_constant_identifier_names

  static const FONT_SIZE_10 = 10.0;
  static const FONT_SIZE_12 = 12.0;
  static const FONT_SIZE_14 = 14.0;
  static const FONT_SIZE_16 = 16.0;
  static const FONT_SIZE_18 = 18.0;
  static const FONT_SIZE_20 = 20.0;
  static const FONT_SIZE_24 = 24.0;

  static const ACTION_BAR_HEIGHT = 45.0;

  static const INPUT_FORM_HEIGHT = 55.0;

  static const PRODUCT_HORIZONTAL_HEIGHT = 320.0;
  static const PRODUCT_HORIZONTAL_WIDTH = 200.0;
  static const PRODUCT_HORIZONTAL_SALE = 50.0;

  static const REFRESHER_CONTAINER_VIEW_HEIGHT = 80.0;
  static const REFRESHER_CONTAINER_VIEW_WIDTH = 80.0;

  static const CART_PROMOTION_MENU_HEIGHT = 50.0;

  static const VERIFY_RESEND_TIME = Duration(seconds: 60);
  static const FAKE_TIME_RELOAD = Duration(milliseconds: 500);

  static const PROFILE_MENU_HEIGHT = 40.0;

  static const BoxFit IMAGE_FIT_MODE = BoxFit.fill;


//  RATIO
  static const double BANNER_RATIO =
      16 / 9; //not use this, get device width/height in runtime
  static const double CATEGORIES_RATIO = 1 / 1;
  static const double CATEGORIES_RATIO_NAME = 1.25;
  static const double PRODUCT_IMAGE_RATIO = 0.7;
  static const double NEWS_IMAGE_RATIO = 1.6;

  static const double PRODUCT_GRID_RATIO =
      PRODUCT_HORIZONTAL_WIDTH / PRODUCT_HORIZONTAL_HEIGHT;

  static const double PRODUCT_FILTER_PRICE_BEGIN = 0;
  static const double PRODUCT_FILTER_PRICE_END = 5000000;
  static const double PRODUCT_FILTER_STEP_PRICE = 100000;

  static const APP_HORIZONTAL_PADDING = 10.0;


  static const Widget kEmptyWidget = SizedBox();

  static Widget hSpace(double width) => SizedBox(width: width);
  static const Widget hSpaceTiny = SizedBox(width: 8.0);
  static const Widget hSpaceVrTiny = SizedBox(width: 6.0);
  static const Widget hSpaceSmall = SizedBox(width: 16.0);
  static const Widget hSpaceMedium = SizedBox(width: 32.0);

  static Widget vSpace(double height) => SizedBox(height: height);
  static const Widget vSpaceVrTiny = SizedBox(height: 4.0);
  static const Widget vSpaceTiny = SizedBox(height: 8.0);
  static const Widget vSpaceSmall = SizedBox(height: 16.0);
  static const Widget vSpaceMedium = SizedBox(height: 32.0);
  static const Widget vSpaceLarge = SizedBox(height: 64.0);
  static const Widget vSpaceMassive = SizedBox(height: 128.0);

  static double widths = MediaQueryData.fromWindow(window).size.width;
  static double heights = MediaQueryData.fromWindow(window).size.height;

  static String formatStringDate(String dateString) => APP_DATE_FORMAT.format(DateTime.parse(dateString));

  static String formatStringDate1(String dateString) => APP_DATE_FORMAT_1.format(DateTime.parse(dateString));

  static String formatStringOnlyDate(String dateString) => APP_DATE_FORMAT_ONLY_DATE.format(DateTime.parse(dateString));

  static String formatDate(String dateString) => DATE_FORMAT.format(DateTime.parse(dateString));

  static String formatShortDate(String dateString) => SHORT_DATE_FORMAT.format(DateTime.parse(dateString));

  static String formatDateMonthYear(String dateString) => YEAR_MONTH_DAY.format(DateTime.parse(dateString));


  static bool isIOS() => Platform.isIOS;

  static String intToTimeLeft(int value) {

    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);

    String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
    m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
    s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  static String convertFileToBase64(File? file) {
    if (file == null) {
      return '';
    }
    List<int> imageBytes = file.readAsBytesSync();
    print(imageBytes);
    return base64Encode(imageBytes);
  }

}
