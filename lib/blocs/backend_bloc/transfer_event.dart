import 'package:project_group/data/models/card_model.dart';

abstract class TransferEvent {}

class SendMoneyEvent extends TransferEvent {
  final CardModel toCardModel;
  final CardModel fromCardModel;

  SendMoneyEvent({required this.toCardModel, required this.fromCardModel});
}
