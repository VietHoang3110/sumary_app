part of 'detail_product_view_bloc.dart';


abstract class DetailProductViewState extends Equatable {

  @override
  List<Object?> get props => [];

  DetailProductViewState();
}
class InitGetDetailProductViewState extends DetailProductViewState {}

class UpdateDetailProductViewState extends DetailProductViewState{

  DataDetailProduct data;
  List<DataFile> listFile;
  List<DataVoice> listVoice;

  UpdateDetailProductViewState(this.data,this.listFile,this.listVoice);

  @override
  List<Object> get props => [data,listFile,listVoice];

}

class LoadingDetailProductViewState extends DetailProductViewState {
}


class ErrorGetDetailProductViewState extends DetailProductViewState{
  final String msg;


  ErrorGetDetailProductViewState(this.msg);

  @override
  List<Object> get props => [msg];
}