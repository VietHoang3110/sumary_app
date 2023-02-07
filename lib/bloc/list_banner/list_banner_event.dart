part of 'list_banner_bloc.dart';

abstract class ListBannerEvent extends Equatable {

  @override
  List<Object?> get props => [];

  ListBannerEvent();
}


class InitGetListBannerEvent extends ListBannerEvent {
  int page;
  int pagaSize;


  InitGetListBannerEvent(this.page, this.pagaSize);

  @override
  List<Object?> get props => [page, pagaSize];
}


