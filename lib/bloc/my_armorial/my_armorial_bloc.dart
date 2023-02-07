
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/get_armorial.dart';
import '../../src/models/model_generator/get_rank_member.dart';
import '../../src/src_index.dart';

part 'my_armorial_event.dart';
part 'my_armorial_state.dart';


class MyArmorialBloc extends Bloc<MyArmorialEvent, MyArmorialState>{
  final UserRepository userRepository;

  MyArmorialBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetMyArmorialState());

  @override
  Stream<MyArmorialState> mapEventToState(MyArmorialEvent event) async* {
    if (event is InitGetMyArmorialEvent) {
      yield* _getMyArmorial();
    }
  }
  Stream<MyArmorialState> _getMyArmorial() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingMyArmorialState();
      final response = await userRepository.getMyArmorial();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetMyArmorialState(response.data!);
      }
      else
        yield ErrorGetMyArmorialState(response.message ?? "");
    } catch (e) {
      yield ErrorGetMyArmorialState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static MyArmorialBloc of(BuildContext context) => BlocProvider.of<MyArmorialBloc>(context);
}