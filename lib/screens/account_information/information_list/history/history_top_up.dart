import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_history_recharge/list_history_recharge_bloc.dart';

import '../../../../src/src_index.dart';
import '../../../../widgets/widgets.dart';

class HistoryTopUp extends StatefulWidget {
  const HistoryTopUp({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryTopUp> createState() => _HistoryTopUpState();
}

class _HistoryTopUpState extends State<HistoryTopUp> {

  late int page = 1;
  @override
  void initState() {
    ListHistoryRechargeBloc.of(context).add(InitGetListHistoryRechargeEvent('RECHARGE', page, 10));

    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListHistoryRechargeBloc.of(context).add(InitGetListHistoryRechargeEvent('RECHARGE', page + 1, 10));
        page = page + 1;
      } else {}
    });
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ListHistoryRechargeBloc, ListHistoryRechargeState>(
          builder: (context, state) {
            if(state is UpdateGetListHistoryRechargeState){
              return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  WidgetText(
                                    title: 'Mã nạp:',
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                  Spacer(),
                                  WidgetText(
                                    title: state.data[index].recharge_code,
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  WidgetText(
                                    title: 'Số tiền nạp:',
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                  Spacer(),
                                  WidgetText(
                                    title: '${state.data[index].bcoin!.round()} Bcoin',
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        color: HexColor('#EE4D2C')
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  WidgetText(
                                    title: '(${state.data[index].amount} vnđ)',
                                    style: AppStyle.DEFAULT_14.copyWith(
                                        color: HexColor('#5A5A5A')
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Container(width: AppValue.heights,height: 1, color: HexColor('#D8D9DB')),
                              ),
                              Row(
                                children: [
                                  WidgetText(
                                    title: state.data[index].method,
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                  Spacer(),
                                  WidgetText(
                                    title: AppValue.formatStringDate1(state.data[index].create_at.toString()),
                                    style: AppStyle.DEFAULT_14,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(height: 1,width: AppValue.widths, color: HexColor('#D8D9DB')),
                      ],
                    );
                  });
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
    );
  }
}