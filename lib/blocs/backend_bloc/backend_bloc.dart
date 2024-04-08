import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_group/blocs/backend_bloc/transfer_event.dart';
import 'package:project_group/blocs/backend_bloc/transfer_state.dart';

import '../../data/card_repo/cards_repo.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc({required this.currenciesRepo}) : super(InitialTransferState()) {
    on<SendMoneyEvent>((event, emit) async {
      emit(LoadingTransferState());
      await currenciesRepo.updateUserInfo(cardModel: event.toCardModel);
      await currenciesRepo.updateUserInfo(cardModel: event.fromCardModel);
      emit(SuccessTransferState());
    });
  }

  final UserRepository currenciesRepo;
}
