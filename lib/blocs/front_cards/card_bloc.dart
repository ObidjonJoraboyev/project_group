import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_group/blocs/front_cards/card_event.dart';
import 'package:project_group/blocs/front_cards/card_state.dart';
import 'package:project_group/data/models/card_model.dart';

import '../../data/card_repo/cards_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.currenciesRepo}) : super(UserInitialState()) {
    on<GetUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      List<CardModel> users = await currenciesRepo.getUserInfo();
      if (users.isEmpty) {
        emit(UserErrorState(errorText: "Error list is empty."));
      } else {
        emit(UserSuccessState(cards: users));
      }
    });

    on<PostUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.addUserInfo(event.cardModel);
      List<CardModel> users = await currenciesRepo.getUserInfo();

      emit(UserSuccessState(cards: users));
    });

    on<DeleteUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.deleteUserInfo(uuId: event.uuId);
      List<CardModel> users = await currenciesRepo.getUserInfo();
      emit(UserSuccessState(cards: users));
    });
    on<UpdateUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await currenciesRepo.updateUserInfo(cardModel: event.userModel);
      List<CardModel> users = await currenciesRepo.getUserInfo();
      emit(UserSuccessState(cards: users));
    });
  }

  final UserRepository currenciesRepo;
}
