import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_history_appellation/list_history_appellation_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_history_appellation_received.dart';

import '../../../../src/src_index.dart';
import '../../../../src/styles.dart';
import '../../../../widgets/widgets.dart';

class HistoryReceive extends StatefulWidget {
  const HistoryReceive({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryReceive> createState() => _HistoryReceiveState();
}

class _HistoryReceiveState extends State<HistoryReceive> {

  late int page = 1;
  @override
  void initState() {
    ListHistoryAppellationBloc.of(context).add(InitGetListHistoryAppellationEvent('APPELATION_RECEIVED', page, 15));

    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListHistoryAppellationBloc.of(context).add(InitGetListHistoryAppellationEvent('APPELATION_RECEIVED', page + 1, 15));
        page = page + 1;
      } else {}
    });
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ListHistoryAppellationBloc, ListHistoryAppellationState>(
          builder: (context, state) {
            if(state is UpdateGetListHistoryAppellationState){
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  title: 'Mã nhận:',
                                  style: AppStyle.DEFAULT_14,
                                ),
                                WidgetText(
                                  title: state.data[index].trans_code,
                                  style: AppStyle.DEFAULT_14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidgetText(
                                  title: 'Số Bcoin đã nhận:',
                                  style: AppStyle.DEFAULT_14,
                                ),
                                WidgetText(
                                  title: '${state.data[index].bcoin_received!.round()} Bcoin',
                                  style: AppStyle.DEFAULT_14.copyWith(
                                      color: HexColor('#EE4D2C')
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Container(width: AppValue.heights,height: 1, color: HexColor('#D8D9DB')),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: WidgetText(
                                    title: state.data[index].note,
                                    style: AppStyle.DEFAULT_14,
                                    maxLine: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                AppValue.hSpace(10),
                                WidgetText(
                                  title: AppValue.formatStringDate1(state.data[index].create_at.toString()),
                                  style: AppStyle.DEFAULT_14,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
              return Container();
            }
          },
        )
    );
  }
}