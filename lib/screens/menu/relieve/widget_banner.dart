import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../bloc/list_banner/list_banner_bloc.dart';
import '../../../src/src_index.dart';

class WidgetBanner extends StatefulWidget {
  const WidgetBanner({Key? key}) : super(key: key);

  @override
  State<WidgetBanner> createState() => _WidgetBannerState();
}

class _WidgetBannerState extends State<WidgetBanner> {

  SwiperController _controller = SwiperController();
  int currenPage = 0;

  @override
  void initState() {
    ListBannerBloc.of(context).add(InitGetListBannerEvent(0,0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBannerBloc, ListBannerState>(
      builder: (context, state) {
        if(state is UpdateGetListBannerState){
          return Container(
            width: AppValue.widths,
            height: AppValue.heights*0.3,
            decoration: const BoxDecoration(
              image:  DecorationImage(
                image: AssetImage("assets/images/img_home.png"),
                fit: BoxFit.cover,
              ),
            ),
            child:  ImageSlideshow(
              autoPlayInterval: 3000,
              indicatorRadius: 4,
              isLoop: true,
              indicatorColor: COLORS.PRIMARY_COLOR,
              children: List.generate(state.data.records.length,
                      (index) => GestureDetector(
                        onTap:()async{
                          if(await canLaunch(state.data.records[index].link.toString())){
                          await launch(state.data.records[index].link.toString());
                          }else {
                          throw 'Could not launch ${state.data.records[index].link.toString()}';
                          }
                        },
                        child: SizedBox(
                        height: AppValue.heights*0.2,
                        child: Image.network(state.data.records[index].imageUrl.toString(),fit: BoxFit.contain,)
                  ),
                      )
              ),
            ),
          );
        }else{
          return Container();
        }
      },
    );
  }
}

