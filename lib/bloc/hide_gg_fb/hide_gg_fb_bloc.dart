
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/hide_gg_fb.dart';
import '../../src/src_index.dart';

part 'hide_gg_fb_event.dart';
part 'hide_gg_fb_state.dart';


class HideGGFBBloc extends Bloc<HideGGFBEvent, HideGGFBState>{
  final UserRepository userRepository;

  HideGGFBBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetHideGGFBState());

  @override
  Stream<HideGGFBState> mapEventToState(HideGGFBEvent event) async* {
    if (event is InitGetHideGGFBEvent) {
      yield* _getHideGGFB();
    }
  }
  Stream<HideGGFBState> _getHideGGFB() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingHideGGFBState();
      final response = await userRepository.getHideGGFB();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetHideGGFBState(response.data);
      }
      else
        yield ErrorGetHideGGFBState(response.message ?? "");
    } catch (e) {
      yield ErrorGetHideGGFBState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static HideGGFBBloc of(BuildContext context) => BlocProvider.of<HideGGFBBloc>(context);
}