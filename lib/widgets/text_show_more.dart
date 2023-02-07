import 'package:flutter/material.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../src/color.dart';
import '../src/styles.dart';

class TextShowMore extends StatefulWidget {
  TextShowMore({Key? key, required this.text, this.press}) : super(key: key);
  String text;
  Function? press;
  @override
  State<TextShowMore> createState() => _TextShowMoreState();
}

class _TextShowMoreState extends State<TextShowMore> {
  bool isShowMore = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowMore = !isShowMore;
        });
        if (widget.press is Function) widget.press!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            maxLines: isShowMore ? 100000 : 3,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.DEFAULT_14
                .copyWith(fontWeight: FontWeight.w400,height: 1.5),
          ),
          // isShowMore ? Container() : WidgetText(
          //   title: 'Xem thêm',
          //   style: AppStyle.DEFAULT_14.copyWith(
          //       color: COLORS.BLUE,
          //       fontWeight: FontWeight.w400),
          // )
        ],
      ),
    );
  }
}