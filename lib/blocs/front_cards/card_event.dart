import 'package:project_group/data/models/card_model.dart';

abstract class UserEvent {}

class GetUserInfoEvent extends UserEvent {}

class DeleteUserInfoEvent extends UserEvent {
  final String uuId;

  DeleteUserInfoEvent({required this.uuId});
}

class PostUserInfoEvent extends UserEvent {
  final CardModel cardModel;

  PostUserInfoEvent({required this.cardModel});
}

class UpdateUserInfoEvent extends UserEvent {
  final CardModel userModel;

  UpdateUserInfoEvent({required this.userModel});
}
