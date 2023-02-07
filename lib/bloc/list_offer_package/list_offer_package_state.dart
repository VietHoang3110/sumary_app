part of 'list_offer_package_bloc.dart';


abstract class ListOfferPackageState extends Equatable {

  @override
  List<Object?> get props => [];

  ListOfferPackageState();
}
class InitGetListOfferPackageState extends ListOfferPackageState {}

class UpdateListOfferPackageState extends ListOfferPackageState{
  List<DataOfferPackage>? data;

  UpdateListOfferPackageState(this.data);
  @override
  List<Object> get props => [];
}

class LoadingGetListOfferPackageState extends ListOfferPackageState {
}


class ErrorGetListOfferPackageState extends ListOfferPackageState{
  final String msg;


  ErrorGetListOfferPackageState(this.msg);

  @override
  List<Object> get props => [msg];
}