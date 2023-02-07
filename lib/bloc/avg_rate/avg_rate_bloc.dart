
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/avg_rate.dart';
import '../../src/models/model_generator/hide_gg_fb.dart';
import '../../src/src_index.dart';

part 'avg_rate_event.dart';
part 'avg_rate_state.dart';


class AvgRateBloc extends Bloc<AvgRateEvent, AvgRateState>{
  final UserRepository userRepository;

  AvgRateBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitAvgRateState());

  @override
  Stream<AvgRateState> mapEventToState(AvgRateEvent event) async* {
    if (event is InitAvgRateEvent) {
      yield* _getAvgRate(event.id);
    }
  }
  Stream<AvgRateState> _getAvgRate(String id) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingAvgRateState();
      final response = await userRepository.getAvgRate(id);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateAvgRateState(response.data!);
      }
      else
        yield ErrorAvgRateState(response.message ?? "");
    } catch (e) {
      yield ErrorAvgRateState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static AvgRateBloc of(BuildContext context) => BlocProvider.of<AvgRateBloc>(context);
}