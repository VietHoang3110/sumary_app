
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_quote.dart';
import 'package:sumary_app/widgets/loading_api.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/src_index.dart';

part 'list_quote_view_event.dart';
part 'list_quote_view_state.dart';


class ListQuoteViewBloc extends Bloc<ListQuoteViewEvent, ListQuoteViewState>{
  final UserRepository userRepository;

  ListQuoteViewBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListQuoteViewState());

  @override
  Stream<ListQuoteViewState> mapEventToState(ListQuoteViewEvent event) async* {
    if (event is InitGetListQuoteViewEvent) {
      yield* _getListQuoteView(event.id);
    }
  }
  Stream<ListQuoteViewState> _getListQuoteView(String id) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingGetListQuoteViewState();
      final response = await userRepository.getListQuoteView(id);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateListQuoteViewState(response.data);
      }
      else
        yield ErrorGetListQuoteViewState(response.message!);
    } catch (e) {
      yield ErrorGetListQuoteViewState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListQuoteViewBloc of(BuildContext context) => BlocProvider.of<ListQuoteViewBloc>(context);
}