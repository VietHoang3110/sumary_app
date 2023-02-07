

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/widgets/loading_api.dart';

import '../../api_resfull/user_repository.dart';
import '../../src/base.dart';
import '../../src/models/model_generator/list_book_reading.dart';
import '../../src/src_index.dart';

part 'list_book_reading_event.dart';
part 'list_book_reading_state.dart';


class ListBookReadingBloc extends Bloc<ListBookReadingEvent, ListBookReadingState>{
  final UserRepository userRepository;

  ListBookReadingBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListBookReadingState());

  @override
  Stream<ListBookReadingState> mapEventToState(ListBookReadingEvent event) async* {
    if (event is InitGetListBookReadingEvent) {
      yield* _getListBookReading();
    }
  }

  Stream<ListBookReadingState> _getListBookReading() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingListBookReadingState();
      final response = await userRepository.getListBookReading();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
          yield UpdateGetListBookReadingState(response.data);
      }
      else
        yield ErrorGetListBookReadingState(response.message ?? "");
    } catch (e) {
      yield ErrorGetListBookReadingState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListBookReadingBloc of(BuildContext context) => BlocProvider.of<ListBookReadingBloc>(context);
}