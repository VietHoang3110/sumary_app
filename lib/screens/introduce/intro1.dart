import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sumary_app/src/models/model_generator/list_category.dart';
import 'package:sumary_app/src/spacing.dart';
import 'package:sumary_app/src/src_index.dart';
import 'package:sumary_app/widgets/widgets.dart';

import '../../bloc/list_categories/list_categories_bloc.dart';
import '../../widgets/widget_button_category.dart';

class IntroSurvey extends StatefulWidget {
  const IntroSurvey({Key? key}) : super(key: key);

  @override
  State<IntroSurvey> createState() => _IntroSurveyState();
}

class _IntroSurveyState extends State<IntroSurvey> {
  @override
  void initState() {
    GetListCategoriesBloc.of(context).add(InitGetListCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.WHITE,
      body: Padding(
        padding: EdgeInsets.only(
            top: Spacing.viewPadding.top + 40,
            right: 24,
            left: 24,
            bottom: Spacing.viewPadding.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: AppValue.widths * 0.8,
              child: WidgetText(
                title: 'Bạn đang quan tâm tới chủ đề sách nào ?',
                style: AppStyle.DEFAULT_24
                    .copyWith(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
            AppValue.vSpaceTiny,
            WidgetText(
              title: 'Nhận đề xuất chủ đề sách phù hợp cho bạn',
              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400),
            ),
            AppValue.vSpaceMedium,
            Expanded(
              child: BlocBuilder<GetListCategoriesBloc, ListCategotiesState>(
                builder: (context, state) {
                  if (state is UpdateGetListCategotiesState) {
                    final listCategory1 = state.dataCategory[0];
                    final listCategory2 = state.dataCategory[1];
                    final listCategory3 = state.dataCategory[2];
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: List.generate(
                                listCategory1.length,
                                (index) => (listCategory1[index].parent == null)
                                    ? WidgetButtonCategoryIntro(
                                        image: 'assets/icons/open-book.png',
                                        title: listCategory1[index].name ?? "",
                                        onClick: () {},
                                      )
                                    : const SizedBox(
                                        width: 0,
                                      )),
                          ),
                          Wrap(
                            children: List.generate(
                                listCategory2.length,
                                (index) => (listCategory2[index].parent == null)
                                    ? WidgetButtonCategoryIntro(
                                        image: 'assets/icons/open-book.png',
                                        title: listCategory2[index].name ?? "",
                                        onClick: () {},
                                      )
                                    : const SizedBox(
                                        width: 0,
                                      )),
                          ),
                          Wrap(
                            children: List.generate(
                                listCategory3.length,
                                (index) => (listCategory3[index].parent == null)
                                    ? WidgetButtonCategoryIntro(
                                        image: 'assets/icons/open-book.png',
                                        title: listCategory3[index].name ?? "",
                                        onClick: () {},
                                      )
                                    : const SizedBox(
                                        width: 0,
                                      )),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            AppValue.vSpaceTiny,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildButtonIntro(),
                InkWell(
                  onTap: () => AppNavigator.navigateIntro(),
                  child: WidgetText(
                    title: 'Bỏ qua',
                    style: AppStyle.DEFAULT_16.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            AppValue.vSpaceMedium,
          ],
        ),
      ),
    );
  }

  _buildButtonIntro() {
    return WidgetButton(
      height: 48,
      onTap: () {
        AppNavigator.navigateIntro();
      },
      backgroundColor: HexColor('#FF9F00'),
      text: MESSAGES.NEXT,
    );
  }
}
