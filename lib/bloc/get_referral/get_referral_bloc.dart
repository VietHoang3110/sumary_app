
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

part 'get_referral_event.dart';
part 'get_referral_state.dart';


class GetReferralBloc extends Bloc<GetReferralEvent, GetReferralState>{
  final UserRepository userRepository;

  GetReferralBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetReferralState());

  @override
  Stream<GetReferralState> mapEventToState(GetReferralEvent event) async* {
    if (event is InitGetReferralEvent) {
      yield* _getReferral();
    }
  }
  Stream<GetReferralState> _getReferral() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingGetReferralState();
      final response = await userRepository.getReferral();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetReferralState(response.data);
      }
      else
        yield ErrorGetReferralState(response.message ?? "");
    } catch (e) {
      yield ErrorGetReferralState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static GetReferralBloc of(BuildContext context) => BlocProvider.of<GetReferralBloc>(context);
}