import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

import '../../../../src/models/model_generator/detail_productt.dart';
import '../../../../widgets/text_show_more.dart';
import '../../../../widgets/widget_dialog.dart';

class IntroduceBook extends StatefulWidget {
  final List<DataFile> file;
  final DataDetailProductFull book;
  final String descriptionAuthor;
  final bool isBuy;

  IntroduceBook(this.file, this.descriptionAuthor, this.isBuy, this.book);


  @override
  State<IntroduceBook> createState() => _IntroduceBookState();
}

class _IntroduceBookState extends State<IntroduceBook> {

  // bool checkStatus = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/book.svg'),
                AppValue.hSpaceTiny,
                WidgetText(
                  title: 'Về sách & tác giả',
                  style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            TextShowMore(
              text: widget.descriptionAuthor,
            ),
            // ReadMoreText(
            //   widget.descriptionAuthor,
            //   trimLines: 5,
            //   colorClickableText: Colors.pink,
            //   trimMode: TrimMode.Line,
            //   trimCollapsedText: '...xem thêm',
            //   trimExpandedText: '...',
            //   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            // ),
            AppValue.vSpaceTiny,
            Row(
              children: [
                Image.asset('assets/icons/ic_tag.png',color: COLORS.PRIMARY_COLOR,height: 18,width: 18,),
                AppValue.hSpaceTiny,
                WidgetText(
                  title: 'Tag',
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
            ( widget.book.tags is List && widget.book.tags!.length != 0) ? Wrap(
              children: List.generate(widget.book.tags!.length,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: COLORS.PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                        child: WidgetText(
                          title: widget.book.tags![index] ?? '',
                          style: AppStyle.DEFAULT_16.copyWith(
                              fontWeight: FontWeight.w400,
                              color: COLORS.WHITE
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WidgetText(
                  title: "Sách chưa có tag !!",
                  style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            AppValue.vSpaceTiny,
            Container(width: AppValue.widths,height: 1,color: COLORS.GREY_400,),
            AppValue.vSpaceTiny,
            Row(
              children: [
                SvgPicture.asset('assets/icons/list_book.svg'),
                AppValue.hSpaceTiny,
                WidgetText(
                  title: 'Danh sách chương',
                  style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            Column(
              children: List.generate(widget.file.length,
                      (index) {
                List<String> nameBook= widget.file[index].name!.split(":");
                String chapter = nameBook.removeAt(0);
                String contentChapter = nameBook.join() ;
                return GestureDetector(
                onTap: (){
                  if(widget.isBuy || index == 0){
                    AppNavigator.navigateChapterDetail(widget.book.Id.toString(),index);
                  }
                  else{
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return WidgetDialog(
                          title: MESSAGES.NOTIFICATION,
                          content: 'Bạn chưa mua sách',
                          onTap1: (){
                            Get.back();
                          },
                        );
                      },
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: HexColor('#E7E7E7'),width: 1),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          AppValue.hSpaceTiny,
                          SvgPicture.asset('assets/icons/book2.svg'),
                          AppValue.hSpaceTiny,
                          Expanded(
                            child: WidgetText(
                              title: chapter+": "+contentChapter,
                              style: AppStyle.DEFAULT_14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          AppValue.hSpaceTiny,
                          if (widget.isBuy || index == 0 ) SvgPicture.asset('assets/icons/r.svg')
                            else SvgPicture.asset('assets/icons/lock_1.svg'),
                          AppValue.hSpaceTiny,
                        ],
                      ),
                    ),
                  ),
                ),
              );}),
            )
          ],
        ),
      ),
    );
  }
}