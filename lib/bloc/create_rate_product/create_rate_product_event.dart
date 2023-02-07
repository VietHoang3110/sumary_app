part of 'create_rate_product_bloc.dart';

abstract class CreateRateEvent extends Equatable {

  @override
  List<Object?> get props => [];

  CreateRateEvent();
}



class CreateRateSubmitted extends CreateRateEvent {
  CreateRateSubmitted({
    required this.voiceStar,
    required this.contentStar,
    required this.content,
    required this.id
  });

  final int voiceStar;
  final int contentStar;
  final String content;
  final String id;

  @override
  List<Object> get props => [voiceStar, contentStar, content, id];
}
