import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/screens/book_detail/widget_tabbar/widget_comment.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';
import 'package:sumary_app/widgets/text_show_more.dart';

import '../../../bloc/like_quote/like_quote_bloc.dart';
import '../../../bloc/list_quote/list_quote_bloc.dart';
import '../../../bloc/list_quote_view/list_quote_view_bloc.dart';
import '../../../bloc/save_quote/save_quote_bloc.dart';
import '../../../src/models/model_generator/list_quote.dart';
import '../../../src/src_index.dart';
import '../../../storages/share_local.dart';
import '../../../widgets/widget_dialog.dart';
import '../../../widgets/widget_text.dart';


class introBook extends StatelessWidget {
   DataDetailProduct data;
   double avgRate;
   introBook({
    Key? key,
    required this.data,
    required this.avgRate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppValue.vSpace(18),
        Intro_Book(data: data,avgRate: avgRate),
        AppValue.vSpace(12),
        Quote_Book(id: data.book!.Id.toString(),),
        AppValue.vSpaceMedium,
        Comment_Book(id: data.book!.Id.toString(),)
      ]
    );
  }
}

class Quote_Book extends StatelessWidget {
  String id;

  Quote_Book({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: WidgetText(
              title: 'Trích dẫn tâm sách:',
              style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w500
              ),
            ),
        ),
        AppValue.vSpace(12),
        ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null)
            ? BlocBuilder<ListQuoteViewBloc, ListQuoteViewState>(
        builder: (context, state) {
            if(state is UpdateListQuoteViewState){
              List<DataQuote>? data = state.data;
              return buildQuote(data);
            }else{
              return Center(
                  child: WidgetText(title: 'Sách chưa có trích dẫn !!!',),
              );
            }
          },
        ) :
        BlocBuilder<ListQuoteBloc, ListQuoteState>(
          builder: (context, state) {
            if(state is UpdateListQuoteState){
              List<DataQuote>? data = state.data;
              return buildQuote(data);
            }else{
              return Center(
                child: WidgetText(title: 'Sách chưa có trích dẫn !!!',),
              );
            }
          },
        ),
      ],
    );
  }

  buildQuote(List<DataQuote>? data) {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: (data!.isNotEmpty) ? Row(
                children:  List.generate(data!.length, (index) => Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: AppValue.widths*0.67,
                    decoration: BoxDecoration(
                        color: HexColor('F2F2F2'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(data[index].slides![0].image.toString(),
                                  width: AppValue.widths*0.62,
                                  height: AppValue.heights*0.15,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: WidgetText(
                                  title: data[index].slides![0].text,
                                  style: AppStyle.DEFAULT_16.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: COLORS.WHITE
                                  ),
                                  maxLine: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          AppValue.vSpaceTiny,
                          Row(
                            children: [
                              buildLike(isLike: data[index].isLoved!, id: data[index].id.toString(),countLike: data[index].lover!.length,),
                              AppValue.hSpace(15),
                              GestureDetector(
                                onTap: ()  {
                                   FlutterShare.share(
                                      title: 'Chia sẻ trích dẫn',
                                      text: 'Chia sẻ trích dẫn',
                                      linkUrl: data[index].url,
                                      chooserTitle: 'Chia sẻ trích dẫn'
                                  );
                                },
                                  child: SvgPicture.asset('assets/icons/share_out.svg')),
                              const Spacer(),
                              buildSaveQuote(isSave: data[index].isSaved!,id: data[index].id.toString())
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
                ),
              ) : Container(
                width: AppValue.widths,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetText(title: 'Sách chưa có trích dẫn !!!', textAlign: TextAlign.center)
                  ],
                ),
              )
            );
  }
}

class buildSaveQuote extends StatefulWidget {
  bool isSave;
  String id;
  buildSaveQuote({
    Key? key,
    required this.isSave,
    required this.id,
  }) : super(key: key);

  @override
  State<buildSaveQuote> createState() => _buildSaveQuoteState();
}

class _buildSaveQuoteState extends State<buildSaveQuote> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          setState(()  {
            if((shareLocal.getString(PreferencesKey.TOKEN)) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
              SaveQuoteBloc.of(context).add(SaveQuoteSubmitted(id: widget.id));
              widget.isSave = !widget.isSave;
            }else{
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return WidgetDialog(
                      title: MESSAGES.NOTIFICATION,
                      content: "Bạn cần đăng nhập !!",
                      onTap1: () {
                        setState((){
                          Get.back();
                        });
                      }
                  );
                },
              );
            }
          });
        },
        child: widget.isSave ? SvgPicture.asset('assets/icons/save_quote.svg') : SvgPicture.asset('assets/icons/save_quote2.svg'));
  }
}

class buildLike extends StatefulWidget {
  bool isLike;
  String id;
  int countLike;
  buildLike({
    Key? key,
    required this.isLike,
    required this.id,
    required this.countLike
  }) : super(key: key);

  @override
  State<buildLike> createState() => _buildLikeState();
}

class _buildLikeState extends State<buildLike> {

  int like = 0;

  @override
  void initState() {
    like = widget.countLike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: ()  {
              setState(()  {
                if((shareLocal.getString(PreferencesKey.TOKEN)) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
                  LikeQuoteBloc.of(context).add(LikeQuoteSubmitted(id: widget.id));
                  widget.isLike = !widget.isLike;
                  if(widget.isLike){
                    like = like + 1;
                  }else{
                    like = like - 1;
                  }
                }else{
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return WidgetDialog(
                          title: MESSAGES.NOTIFICATION,
                          content: "Bạn cần đăng nhập !!",
                          onTap1: () {
                            setState((){
                              Get.back();
                            });
                          }
                      );
                    },
                  );
                }
              });
            },
            child: widget.isLike ? SvgPicture.asset('assets/icons/tim.svg') : SvgPicture.asset('assets/icons/unlike.svg')
        ),
        AppValue.hSpace(7),
        Text('${like}',style: AppStyle.DEFAULT_20,),
      ],
    );
  }
}

class Intro_Book extends StatelessWidget {
  DataDetailProduct data;
  double avgRate;
  Intro_Book({
    Key? key,
    required this.data,
    required this.avgRate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              SizedBox(
                width: AppValue.widths*0.22,
                child: WidgetText(
                  title: 'Tác phẩm:',
                  style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              WidgetText(
                title: data.book!.name,
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),

        AppValue.vSpace(12),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              SizedBox(
                width: AppValue.widths*0.22,
                child: WidgetText(
                  title: 'Tác giả:',
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(
                width: AppValue.widths*0.3,
                child: WidgetText(
                  title: data.book!.author!.name,
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w400
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/file.svg'),
                  WidgetText(
                    title: ' Tổng ${data.listBookOfAuthor!.length} Tâm Sách ',
                    style: AppStyle.DEFAULT_14.copyWith(
                      fontWeight: FontWeight.w400,
                      color: HexColor('#9F9F9F')
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Icon(Icons.chevron_right_sharp,color: HexColor('#9F9F9F')),
                ],
              )
            ],
          ),
        ),

        AppValue.vSpace(12),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              SizedBox(
                width: AppValue.widths*0.22,
                child: WidgetText(
                  title: 'Đánh giá:',
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              RatingBarIndicator(
                rating: avgRate,
                itemBuilder: (context, index) =>
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 18,
              ),
            ],
          ),
        ),

        AppValue.vSpace(12),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              SizedBox(
                width: AppValue.widths*0.22,
                child: WidgetText(
                  title: 'Thể loại:',
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
             Row(
               children: List.generate(data.listCategory!.length, (index) => Padding(
                 padding: const EdgeInsets.only(right: 5),
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       border: Border.all(width: 1, color: HexColor('#3843A5'))
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(3),
                     child: WidgetText(
                       title: data.listCategory![index].name,
                       style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                     ),
                   ),
                 ),
               )),
             )
            ],
          ),
        ),
        AppValue.vSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextShowMore(
            text: data.book!.description.toString(),
          ),
        ),
      ],
    );
  }
}
