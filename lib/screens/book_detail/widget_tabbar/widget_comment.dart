import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sumary_app/bloc/like_rate/like_rate_bloc.dart';
import 'package:sumary_app/bloc/list_book_same/list_book_same_bloc.dart';
import 'package:sumary_app/bloc/list_rate_product/list_rate_product_bloc.dart';
import 'package:sumary_app/screens/menu/relieve/discover_screen.dart';
import 'package:sumary_app/src/spacing.dart';

import '../../../bloc/list_rate_product_view/list_rate_product_view_bloc.dart';
import '../../../src/models/model_generator/rate_product.dart';
import '../../../src/src_index.dart';
import '../../../storages/share_local.dart';
import '../../../widgets/widgets.dart';

class Comment_Book extends StatefulWidget {
  String id;
  Comment_Book({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Comment_Book> createState() => _Comment_BookState();
}

class _Comment_BookState extends State<Comment_Book> {

  @override
  void initState() {
    // ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null)
    // ? ListRateProductViewBloc.of(context).add(InitGetListRateProductViewEvent(widget.id, 0, 0))
    //     : ListRateProductBloc.of(context).add(InitGetListRateProductEvent(widget.id, 0, 0));
    ListBookSameBloc.of(context).add(InitGetListBookSameEvent(widget.id, 0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ((shareLocal.getString(PreferencesKey.TOKEN)) == '' || shareLocal.getString(PreferencesKey.TOKEN) == null) ? BlocBuilder<ListRateProductViewBloc, ListRateProductViewState>(
          builder: (context, state) {
            if(state is UpdateGetListRateProductViewState){
              List<DataRateProduct> data = state.dataRateProduct;
              return buildComment(data);
            }
            else{
              return Container();
            }
          },
        ) : BlocBuilder<ListRateProductBloc, ListRateProductState>(
          builder: (context, state) {
            if(state is UpdateGetListRateProductState){
              List<DataRateProduct> data = state.dataRateProduct;
              return buildComment(data);
            }
            else{
              return Container();
            }
          },
        ),
        BlocBuilder<ListBookSameBloc, ListBookSameState>(
          builder: (context, state) {
            if(state is UpdateGetListBookSameState){
              return Stack(
                children: [
                  Image.asset('assets/images/anhtabnoibat.png',width: AppValue.widths,fit: BoxFit.fill),
                  Column(
                    children: [
                      buildTitle(icon: 'assets/icons/icondexuat.svg', title: 'Tâm Sách Đề Xuất',),
                      AppValue.vSpaceSmall,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(state.data.length, (index) =>
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                      height: 160,
                                      child: Image.network(state.data[index].images![0],
                                        fit: BoxFit.contain,
                                      )
                                  ),
                                ),
                              ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }else{
              return Container();
            }
          },
        ),
        AppValue.vSpace(15+Spacing.viewPadding.bottom),
      ],
    );
  }

  buildComment(List<DataRateProduct> data) {
    return Padding(
      padding:const EdgeInsets.only(left: 14, right: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Bình luận', style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: FontWeight.w500,
              ),),
              AppValue.hSpaceTiny,
              GestureDetector(
                onTap: (){
                  AppNavigator.navigateWriteAReview(widget.id);
                },
                child: Row(
                  children: [
                    Image.asset('assets/icons/ibox_icon1.png', width: 20, height: 15,),
                    AppValue.hSpace(5),
                    WidgetText(
                      title: 'Viết cảm nhận',
                      style: AppStyle.DEFAULT_16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: COLORS.GREY,
                          fontSize: 14,
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset('assets/icons/ibox_icon2.png',width: 20, height: 18,),
              AppValue.hSpace(5),
              WidgetText(
                title: '${data.length} Nhận xét',
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: COLORS.GREY,
                    fontSize: 14
                ),
              ),
            ],
          ),
          AppValue.vSpaceVrTiny,
          Container(
            height: 1,
            width: AppValue.widths,
            color: COLORS.PRIMARY_COLOR,
          ),
          AppValue.vSpaceSmall,
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(data.length, (index) => Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage('https://tleliteracy.com/wp-content/uploads/2017/02/default-avatar.png',
                        ),
                      ),
                      AppValue.hSpaceSmall,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(data[index].user!.name.toString(), style: AppStyle.DEFAULT_16.copyWith(
                                        fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    AppValue.hSpaceTiny,
                                    RatingBarIndicator(
                                      rating: (data[index].contentStar!.toDouble() + data[index].voiceStar!.toDouble())/2 ,
                                      itemPadding: const EdgeInsets.only(bottom: 4),
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 18,
                                    ),
                                  ],
                                ),
                                Text(AppValue.formatDate(data[index].updatedAt.toString()),style: AppStyle.DEFAULT_16.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: COLORS.GREY,
                                  fontSize: 14,
                                ),
                                )
                              ],
                            ),
                            (((data[index].contentStar!.toDouble() + data[index].voiceStar!.toDouble())/2) >= 4) ? Row(
                              children: [
                                Container(
                                  width: AppValue.widths*0.24,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: COLORS.BLUE
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                                    child: Text('Sách rất hay',
                                      style:
                                      AppStyle.DEFAULT_14
                                          .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: COLORS.WHITE),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                AppValue.hSpaceSmall,
                                Container(
                                  width: AppValue.widths*0.24,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: COLORS.VIOLET
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                                    child: Text('Hấp dẫn',
                                      style:
                                      AppStyle.DEFAULT_14
                                          .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: COLORS.WHITE),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ) : Container(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: WidgetText(
                          title: data[index].content,
                          style: AppStyle.DEFAULT_14.copyWith(
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      buildLike(id: data[index].id.toString(), isLike: data[index].isLoved!,countLike: data[index].lover!.length,),
                      AppValue.hSpace(20),
                      Image.asset('assets/icons/ibox_icon1.png',height: 15,width: 20,),
                      AppValue.hSpace(5),
                      const Text('Trả lời', ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    height: 1,width: AppValue.widths,color: COLORS.GREY_EB,)
                ],
              )
              ),
            ),
          ),
          AppValue.vSpaceTiny,
          GestureDetector(
              onTap: (){},
              child: SvgPicture.asset('assets/icons/down_icon_detailBook.svg')),
          AppValue.vSpaceTiny,
        ],
      ),
    );
  }
}

class buildLike extends StatefulWidget {
  bool isLike;
  String id;
  int countLike;

  buildLike({
    Key? key,
    required this.id,
    required this.isLike,
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
            onTap: (){
              setState(()  {
                if((shareLocal.getString(PreferencesKey.TOKEN)) != '' && shareLocal.getString(PreferencesKey.TOKEN) != null){
                  LikeRateBloc.of(context).add(LikeRateSubmitted(id: widget.id));
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
            child: widget.isLike
                ? SvgPicture.asset('assets/icons/tim.svg',height: 15,width: 18)
                : SvgPicture.asset('assets/icons/unlike.svg',height: 15,width: 18)),
        AppValue.hSpace(5),
        Text('${like}'),
      ],
    );
  }
}