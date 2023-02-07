part of 'detail_product_bloc.dart';


abstract class DetailProductState extends Equatable {

  @override
  List<Object?> get props => [];

  DetailProductState();
}
class InitGetDetailProductState extends DetailProductState {}

class UpdateGetDetailProductState extends DetailProductState{

  DataDetailProduct data;
  List<DataFile> listFile;
  List<DataVoice> listVoice;

  UpdateGetDetailProductState(this.data,this.listFile,this.listVoice);

  @override
  List<Object> get props => [data,listFile,listVoice];

}

class LoadingDetailProductState extends DetailProductState {
}


class ErrorGetDetailProductState extends DetailProductState{
  final String msg;


  ErrorGetDetailProductState(this.msg);

  @override
  List<Object> get props => [msg];
}