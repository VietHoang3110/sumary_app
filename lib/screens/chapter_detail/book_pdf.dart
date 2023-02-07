

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sumary_app/bloc/get_content_file_pdf/get_content_file_pdf_bloc.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../src/models/model_generator/detail_productt.dart';
import '../../src/src_index.dart';
import '../../widgets/widget_button.dart';
import '../../widgets/widget_dialog.dart';

class book_pdf extends StatefulWidget {
   book_pdf({
    Key? key,
     required this.name,
     required this.fontSize,
     required this.space,
     required this.isSave,
     required this.isBuy,
     required this.title,
     required this.nextChapter,
     required this.previousChapter,
     required this.isNext,
     required this.isPrevious,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final double space;
  final String name ;
  final bool isSave;
  final bool isBuy;
  final bool isNext;
  final bool isPrevious;
  final Function nextChapter;
  final Function previousChapter;


   @override
  State<book_pdf> createState() => book_pdfState();
}


class book_pdfState extends State<book_pdf>  {


  @override
  void initState() {
    ContentFileBloc.of(context).add(InitContentFileEvent(widget.name,isSave :widget.isSave));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentFileBloc, ContentFileState>(
      builder: (context, state) {
        if(state is UpdateContentFileState){
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetText(
                  title: widget.title,
                  style: AppStyle.DEFAULT_18.copyWith(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w500
                  ),
                ),
                WidgetText(
                  title: state.data,
                  style: TextStyle(
                    height: widget.space,
                    fontSize: widget.fontSize,
                  ),
                    textAlign: TextAlign.justify,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetButton2(
                      height: 42,
                      width: AppValue.widths*0.32,
                      onTap: ()=>widget.previousChapter(),
                      backgroundColor: widget.isPrevious ?  COLORS.PRIMARY_COLOR : COLORS.GREY_D8,
                      text: 'Chương trước',
                    ),
                    WidgetButton2(
                      height: 42,
                      width: AppValue.widths*0.32,
                      onTap: (){
                        setState(() {
                          widget.nextChapter();
                        });
                      },
                      backgroundColor: widget.isNext ?  COLORS.PRIMARY_COLOR : COLORS.BLUE,
                      text: widget.isNext ? 'Chương sau' : 'Hoàn thành',
                    )
                  ],
                ),
              ],
            ),
          );
        }
        else{
          return  Container();
        }
      },
    );
  }
}