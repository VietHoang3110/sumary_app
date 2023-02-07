part of 'list_banner_bloc.dart';


abstract class ListBannerState extends Equatable {

  @override
  List<Object?> get props => [];

  ListBannerState();
}
class InitGetListBannerState extends ListBannerState {}

class UpdateGetListBannerState extends ListBannerState{

  ListBanner data;

  UpdateGetListBannerState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingListBannerState extends ListBannerState {
}


class ErrorGetListBannerState extends ListBannerState{
  final String msg;


  ErrorGetListBannerState(this.msg);

  @override
  List<Object> get props => [msg];
}