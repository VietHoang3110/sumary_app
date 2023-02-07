

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/bloc/content_terms/content_terms_bloc.dart';

import '../../../src/src_index.dart';
import '../../../widgets/widgets.dart';

class TermScreen extends StatefulWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}


class _TermScreenState extends State<TermScreen> {

  @override
  void initState() {
    ContentTermsBloc.of(context).add(InitContentTermsEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.BACKGROUND,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: WidgetText(
          title: 'Điều khoản chính sách',
          style: AppStyle.DEFAULT_16.copyWith(
              fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
            onTap: () => AppNavigator.navigateBack(),
            child: Icon(Icons.arrow_back, color: Colors.black,)
        ),
      ),
      body: BlocBuilder<ContentTermsBloc, ContentTermsState>(
        builder: (context, state) {
          if(state is UpdateContentTermsState){
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: AppValue.widths,
                    child: Column(
                      children: [
                        Image.asset('assets/images/policy.png'),
                        AppValue.vSpaceSmall,
                        WidgetText(
                          title: state.dataTerms.content,
                          style: AppStyle.DEFAULT_16,
                          maxLine: 100,
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else {return Center(
            child: Text('Lỗi kết nối!!'),
          );}
        },
      ),
    );
  }
}

