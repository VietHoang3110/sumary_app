import 'package:flutter/cupertino.dart';

class ButtonMenuModel {
  final String? image;
  final String title;
  final GestureTapCallback? onTap;
  final bool isSelect;

  ButtonMenuModel({
    this.image,
    required this.title,
    this.onTap,
    required this.isSelect
  });

}
