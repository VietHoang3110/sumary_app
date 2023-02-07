
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/detail_product/detail_product_bloc.dart';
import 'package:sumary_app/src/models/model_generator/detail_productt.dart';

import '../../../../bloc/blocs.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';
import 'index.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  String id = Get.arguments;

  @override
  void initState() {
    super.initState();
    DetailProductBloc.of(context).add(InitDetailProductEvent(id));
    // DetailProductBloc.of(context).add(InitDetailProductEvent("629d82715100f771c2def1d2"));
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlocBuilder<DetailProductBloc, DetailProductState>(
            builder: (context, state) {
            if(state is UpdateGetDetailProductState){
              return WidgetText(
                title: 'Chi tiết sách',
                style: AppStyle.DEFAULT_18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              );
            }
            else{
              return WidgetText(
                title: '',
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w500
                ),
              );;
            }
          },
          ),
          leading: InkWell(
              onTap: ()=> AppNavigator.navigateBack(),
              child: Icon(Icons.arrow_back,color: Colors.black,)
          ),
          actions: [
            InkWell(
              onTap: (){},
                child: SvgPicture.asset('assets/icons/home.svg')
            ),
            AppValue.hSpace(10),
            InkWell(
              onTap: (){},
                child: SvgPicture.asset('assets/icons/save.svg')),
            AppValue.hSpaceSmall
          ],
        ),
        body: Container(
          child: BlocBuilder<DetailProductBloc,DetailProductState>(
            builder: (context,state) {
              if(state is UpdateGetDetailProductState){
                DataDetailProduct data = state.data;
                return Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: AppValue.widths,
                          height: AppValue.heights*0.3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                                  HexColor('#2896FF'),
                                  HexColor('#6EE1FF')
                                ],
                              )
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: Image.network(data.book!.image!??""),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WidgetText(
                                title: data.book!.name?? "",
                                style: AppStyle.DEFAULT_18.copyWith(
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Row(
                                children: [
                                  WidgetText(
                                    title: ((data.book!.avgVoiceRate!.toDouble()+data.book!.avgContentRate!.toDouble())/2).toStringAsFixed(1),
                                    style: AppStyle.DEFAULT_16.copyWith(
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  AppValue.hSpace(3),
                                  RatingBarIndicator(
                                    rating: (data.book!.avgVoiceRate!.toDouble()+data.book!.avgContentRate!.toDouble())/2,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 17.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          WidgetText(
                            title: data.book!.author!.name ?? "",
                            style: AppStyle.DEFAULT_14,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/bcoin.svg'),
                              AppValue.hSpaceTiny,
                              WidgetText(
                                title: '${data.book!.price} Bcoin',
                                style: AppStyle.DEFAULT_16_BOLD.copyWith(
                                    color: COLORS.RED
                                ),
                              ),
                              AppValue.hSpaceTiny,
                              RichText(
                                text: TextSpan(
                                  text: '${data.book!.prePrice}',
                                  style: TextStyle(fontSize: 10,color: COLORS.GREY_400,
                                      decoration: TextDecoration.lineThrough),
                                  children: const <TextSpan>[
                                    TextSpan(text: ' Bcoin'),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(width: AppValue.widths,height: 1,color: COLORS.GREY_400),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 2, color: COLORS.GREY_E7)
                          )
                      ),
                      child: TabBar(
                          isScrollable: true,
                          unselectedLabelColor: HexColor('#777777'),
                          unselectedLabelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          labelColor: HexColor('#EE4D2C'),
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#EE4D2C')
                          ),
                          indicatorColor: HexColor('#EE4D2C'),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(color: HexColor('#EE4D2C'), width: 1.0),
                            insets: EdgeInsets.symmetric(horizontal: 15),
                          ),

                          tabs: const [
                            tabView(text: 'Giới thiệu'),
                            tabView(text: 'Cảm nhận'),
                          ]
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                          children: [
                            // IntroduceBook(data.book!.file!,data.book!.author!.description!,data.is_buy),
                            // FeelingBook(data.book!.id!,data.is_buy)
                          ],
                        )
                    ),
                    _buildButtonRead(state.data.book!.Id!),
                  ],
                );
              }
              else {
                return Container();
              }

            }
          ),
        ),
      ),
    );
  }
  
  _buildButtonRead(String id) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return WidgetButton2(
            height: 50,
            // onTap: () => state.status.isValidated ? bloc.add(FormSubmitted()) : null,
            onTap: (){
              // AppNavigator.navigateChapterDetail(id);
            },
            //enable: state.status.isValidated,
            backgroundColor: HexColor('#FF9F00'),
            text: 'Đọc tâm sách',
          );
        }
    );
  }

}

class tabView extends StatelessWidget {
  const tabView({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValue.widths*0.5-20,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 1,color: COLORS.GREY_400),
        )
      ),
        child: Text(text,textAlign: TextAlign.center)
    );
  }
}
