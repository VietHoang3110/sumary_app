part of 'get_referral_bloc.dart';


abstract class GetReferralState extends Equatable {

  @override
  List<Object?> get props => [];

  GetReferralState();
}
class InitGetReferralState extends GetReferralState {}

class UpdateGetReferralState extends GetReferralState{
  String data;

  UpdateGetReferralState(this.data);
  @override
  List<Object> get props => [data];
}

class LoadingGetReferralState extends GetReferralState {
}


class ErrorGetReferralState extends GetReferralState{
  final String msg;


  ErrorGetReferralState(this.msg);

  @override
  List<Object> get props => [msg];
}