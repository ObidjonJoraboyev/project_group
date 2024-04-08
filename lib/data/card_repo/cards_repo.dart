import 'package:project_group/data/models/card_model.dart';

import '../network/api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<CardModel>> getUserInfo() => apiProvider.getUserInfo();

  Future<String> addUserInfo(CardModel cardModel) =>
      apiProvider.postUserInfo(userModel: cardModel);

  Future<String> deleteUserInfo({required String uuId}) =>
      apiProvider.deleteUserInfo(uuid: uuId);

  Future<String> updateUserInfo({required CardModel cardModel}) =>
      apiProvider.updateUserInfo(userModel: cardModel);
}
