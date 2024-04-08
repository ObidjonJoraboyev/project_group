import 'package:project_group/data/models/card_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserSuccessState extends UserState {
  final List<CardModel> cards;

  UserSuccessState({required this.cards});
}

class UserErrorState extends UserState {
  final String errorText;

  UserErrorState({required this.errorText});
}

class UserLoadingState extends UserState {}
