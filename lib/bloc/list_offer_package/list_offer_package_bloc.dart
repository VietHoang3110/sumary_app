
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumary_app/src/models/model_generator/list_quote.dart';
import 'package:sumary_app/widgets/loading_api.dart';
import '../../api_resfull/user_repository.dart';
import '../../src/models/model_generator/offer_package.dart';
import '../../src/src_index.dart';

part 'list_offer_package_event.dart';
part 'list_offer_package_state.dart';


class ListOfferPackageBloc extends Bloc<ListOfferPackageEvent, ListOfferPackageState>{
  final UserRepository userRepository;

  ListOfferPackageBloc({required UserRepository userRepository}) : userRepository = userRepository, super(InitGetListOfferPackageState());

  @override
  Stream<ListOfferPackageState> mapEventToState(ListOfferPackageEvent event) async* {
    if (event is InitGetListOfferPackageEvent) {
      yield* _getOfferPackage();
    }
  }
  Stream<ListOfferPackageState> _getOfferPackage() async* {
    LoadingApi().pushLoading();
    try {
      yield LoadingGetListOfferPackageState();
      final response = await userRepository.getOfferPackage();
      if((response.statusCode == BASE_URL.SUCCESS)||(response.statusCode == BASE_URL.SUCCESS_200)){
        yield UpdateListOfferPackageState(response.data);
      }
      else
        yield ErrorGetListOfferPackageState(response.message!);
    } catch (e) {
      yield ErrorGetListOfferPackageState(MESSAGES.CONNECT_ERROR);
      throw e;
    }
    LoadingApi().popLoading();
  }


  static ListOfferPackageBloc of(BuildContext context) => BlocProvider.of<ListOfferPackageBloc>(context);
}