
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_background.dart';
import 'package:sumary_app/src/models/model_generator/list_book_bought.dart';
import 'package:sumary_app/src/models/model_generator/list_book_saved.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/src_index.dart';

part 'list_background_event.dart';
part 'list_background_state.dart';


class ListBackgroundBloc extends Bloc<ListBackgroundEvent, ListBackgroundState>{
  final UserRepository userRepository;

  ListBackgroundBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBackgroundState());

  @override
  Stream<ListBackgroundState> mapEventToState(ListBackgroundEvent event) async* {
    if (event is InitGetListBackgroundEvent) {
      yield* _getListBackground();
    }
  }

  Stream<ListBackgroundState> _getListBackground() async* {
    // LoadingApi().pushLoading();
    try {
      final response = await userRepository.getListBackground();
      if(response.statusCode == BASE_URL.SUCCESS_200){
          yield UpdateGetListBackgroundState(response.data);
      }
      else
        yield ErrorGetListBackgroundState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBackgroundState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBackgroundBloc of(BuildContext context) => BlocProvider.of<ListBackgroundBloc>(context);
}