import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/bloc/list_history_wallet/list_history_wallet_bloc.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widget_text.dart';

class HistoryBuy extends StatefulWidget {
  const HistoryBuy({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryBuy> createState() => _HistoryBuyState();
}

class _HistoryBuyState extends State<HistoryBuy> {
  @override
  void initState() {
    ListHistoryWalletBloc.of(context)
        .add(InitGetListHistoryWalletEvent('BUY_USE_WALLET', page, 10));

    _scrollController.addListener(() async {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        ListHistoryWalletBloc.of(context)
            .add(InitGetListHistoryWalletEvent('BUY_USE_WALLET', page + 1, 10));
        page = page + 1;
      } else {}
    });
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  late int page = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ListHistoryWalletBloc, ListHistoryWalletState>(
      builder: (context, state) {
        if (state is UpdateGetListHistoryWalletState) {
          return ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: state.dataHistoryWallet.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  state.dataHistoryWallet[index].images![0],
                                  height: 122,
                                  width: 92,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              AppValue.hSpaceSmall,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WidgetText(
                                      title:
                                          state.dataHistoryWallet[index].name,
                                      style: AppStyle.DEFAULT_16_BOLD.copyWith(
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    WidgetText(
                                        title: state.dataHistoryWallet[index]
                                            .author!.name,
                                        style: AppStyle.DEFAULT_14),
                                    AppValue.vSpaceLarge,
                                    WidgetText(
                                        title:
                                            '${state.dataHistoryWallet[index].bcoin!.round()} Bcoin',
                                        style: AppStyle.DEFAULT_12.copyWith(
                                            color: HexColor('#EE4D2C'))),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                                width: AppValue.heights,
                                height: 1,
                                color: HexColor('#D8D9DB')),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: WidgetText(
                                  title:
                                      'Mã đơn hàng: ${state.dataHistoryWallet[index].order_code}',
                                  style: AppStyle.DEFAULT_14,
                                ),
                              ),

                              // Spacer(),
                              Expanded(
                                flex: 3,
                                child: WidgetText(
                                  title: AppValue.formatStringDate1(state
                                      .dataHistoryWallet[index].create_at
                                      .toString()),
                                  style: AppStyle.DEFAULT_14,
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 1,
                        width: AppValue.widths,
                        color: HexColor('#D8D9DB')),
                  ],
                );
              });
        } else {
          return Center(
            child: WidgetText(
              title: "Không có dữ liêu !!",
              style: AppStyle.DEFAULT_16,
            ),
          );
        }
      },
    ));
  }
}
