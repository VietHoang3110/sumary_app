
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_armorial_user.dart';
import 'package:sumary_app/src/models/model_generator/list_ask.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_armorial_event.dart';
part 'list_armorial_state.dart';


class ListArmorialBloc extends Bloc<ListArmorialEvent, ListArmorialState>{
  final UserRepository userRepository;

  ListArmorialBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListArmorialState());

  @override
  Stream<ListArmorialState> mapEventToState(ListArmorialEvent event) async* {
    if (event is InitGetListArmorialEvent) {
      yield* _getListArmorial(event.keyword,event.page,event.pageSize);
    }
  }
  Stream<ListArmorialState> _getListArmorial(String keyword, int page, int pageSize) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListArmorialState();
      final response = await userRepository.getListArmorial(keyword,page, pageSize);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateGetListArmorialState(response.data.records);
      }
      else
        yield ErrorGetListArmorialState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListArmorialState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListArmorialBloc of(BuildContext context) => BlocProvider.of<ListArmorialBloc>(context);
}