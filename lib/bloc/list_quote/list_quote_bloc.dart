
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_quote.dart';
import 'package:sumary_app/widgets/loading_api.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/src_index.dart';

part 'list_quote_event.dart';
part 'list_quote_state.dart';


class ListQuoteBloc extends Bloc<ListQuoteEvent, ListQuoteState>{
  final UserRepository userRepository;

  ListQuoteBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListQuoteState());

  @override
  Stream<ListQuoteState> mapEventToState(ListQuoteEvent event) async* {
    if (event is InitGetListQuoteEvent) {
      yield* _getListQuote(event.id);
    }
  }
  Stream<ListQuoteState> _getListQuote(String id) async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingGetListQuoteState();
      final response = await userRepository.getListQuote(id);
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateListQuoteState(response.data);
      }
      else
        yield ErrorGetListQuoteState(response.message!);
    } catch (e) {
      yield ErrorGetListQuoteState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListQuoteBloc of(BuildContext context) => BlocProvider.of<ListQuoteBloc>(context);
}