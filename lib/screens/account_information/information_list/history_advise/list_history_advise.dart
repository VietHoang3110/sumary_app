import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../bloc/list_history_advise/list_history_advise_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';

class ListHistoruAdvise extends StatefulWidget {
  const ListHistoruAdvise({
    Key? key,
  }) : super(key: key);

  @override
  State<ListHistoruAdvise> createState() => _ListHistoruAdviseState();
}

class _ListHistoruAdviseState extends State<ListHistoruAdvise> {

  late int page = 1;
  @override
  void initState() {
    ListHistoryAdviseBloc.of(context).add(InitGetListHistoryAdviseEvent(page, 10));

    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListHistoryAdviseBloc.of(context).add(InitGetListHistoryAdviseEvent(page + 1, 10));
        page = page + 1;
      } else {}
    });
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Lịch sử tư vấn',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: ()=> AppNavigator.navigateBack(),
            child: const Icon(Icons.arrow_back,color: Colors.black,)
        ),
      ),
      body: SafeArea(
          child: BlocBuilder<ListHistoryAdviseBloc, ListHistoryAdviseState>(
            builder: (context, state) {
              if(state is UpdateGetListHistoryAdviseState){
                return ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          color: COLORS.WHITE,
                          border: const Border(
                            bottom: BorderSide(color: COLORS.GREY_D8,width: 1)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetText(
                                    title: 'Tham vấn ${index+1}',
                                    style: AppStyle.DEFAULT_16.copyWith(
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      AppNavigator.navigateDetailHistoryAdvise(
                                          state.data[index].name.toString(),
                                          state.data[index].issueType!.name.toString(),
                                          state.data[index].appointmentDate.toString(),
                                          state.data[index].phoneNumber.toString(),
                                          state.data[index].email.toString(),
                                          state.data[index].content.toString(),
                                          state.data[index].issueType!.id.toString()
                                      );
                                    },
                                    child: WidgetText(
                                      title: 'Chỉnh sửa',
                                      style: AppStyle.DEFAULT_16.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: COLORS.PRIMARY_COLOR
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              AppValue.vSpace(12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetText(
                                    title: 'Lịch hẹn :',
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        fontWeight: FontWeight.w400
                                    )
                                  ),
                                  WidgetText(
                                    title: AppValue.formatStringDate1(state.data[index].appointmentDate.toString()) ,
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        fontWeight: FontWeight.w400
                                    )
                                  )
                                ],
                              ),
                              AppValue.vSpace(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetText(
                                      title: 'Thời gian gửi :',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                        fontWeight: FontWeight.w400
                                      )
                                  ),
                                  WidgetText(
                                      title: AppValue.formatStringDate1(state.data[index].createdAt.toString()) ,
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                                ],
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8),
                                  height: 1,width: AppValue.widths,color: COLORS.GREY_D8
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetText(
                                      title: 'Vấn đề gặp phải :',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                  WidgetText(
                                      title: state.data[index].issueType!.name,
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                                ],
                              ),
                              AppValue.vSpace(8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WidgetText(
                                      title: 'Nội dung tư vấn : ',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                  AppValue.hSpaceMedium,
                                  Expanded(
                                    child: WidgetText(
                                        title: state.data[index].content,
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w400
                                        ),
                                      textAlign: TextAlign.end,
                                      maxLine: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              AppValue.vSpace(5)
                            ],
                          ),
                        ),
                      );
                    }
                    );
              }
              else{
                return Center(
                  child: WidgetText(
                    title: "Không có dữ liêu !!",
                    style: AppStyle.DEFAULT_16,
                  ),
                );
              }
            },
          )
      ),
    );
  }
}