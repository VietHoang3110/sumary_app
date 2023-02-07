
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_background.dart';
import 'package:sumary_app/src/models/model_generator/list_banner.dart';
import 'package:sumary_app/src/models/model_generator/list_book_bought.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_banner_event.dart';
part 'list_banner_state.dart';


class ListBannerBloc extends Bloc<ListBannerEvent, ListBannerState>{
  final UserRepository userRepository;

  ListBannerBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBannerState());

  @override
  Stream<ListBannerState> mapEventToState(ListBannerEvent event) async* {
    if (event is InitGetListBannerEvent) {
      yield* _getListBanner(event.page,event.pagaSize);
    }
  }

  Stream<ListBannerState> _getListBanner(int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      final response = await userRepository.getListBanner(page, pageSize);
      if(response.statusCode == BASE_URL.SUCCESS_200){
        yield UpdateGetListBannerState(response.data);
      }
      else
        yield ErrorGetListBannerState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBannerState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBannerBloc of(BuildContext context) => BlocProvider.of<ListBannerBloc>(context);
}