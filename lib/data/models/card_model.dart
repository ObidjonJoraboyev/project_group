class CardModel {
  final String? uuId;
  final String bankName;
  final String cardName;
  final double amount;
  final String cardNumber;
  final String color;
  final String expireDate;
  final String ownerName;
  final bool isMain;

  CardModel({
    required this.ownerName,
    required this.cardName,
    this.uuId,
    required this.bankName,
    required this.amount,
    required this.cardNumber,
    required this.color,
    required this.expireDate,
    required this.isMain,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      ownerName: json["owner"] as String? ?? "e",
      cardName: json["card_name"] as String? ?? "e",
      uuId: json["_uuid"] as String? ?? "e",
      bankName: json["bank_name"] as String? ?? "e",
      cardNumber: json["card_number"] as String? ?? "e",
      color: json["color"] as String? ?? "e",
      expireDate: json["expire_date"] as String? ?? "e",
      isMain: json["is_main"] as bool? ?? false,
      amount: (json["amount"] as num? ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "owner": ownerName,
      "is_main": isMain,
      "expire_date": expireDate,
      "color": color,
      "card_number": cardNumber,
      "amount": amount,
      "bank_name": bankName,
      "activity_address": cardName
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "_uuid": uuId,
      "owner": ownerName,
      "is_main": isMain,
      "expire_date": expireDate,
      "color": color,
      "card_number": cardNumber,
      "amount": amount,
      "bank_name": bankName,
      "card_name": cardName
    };
  }

  static CardModel initialValue = CardModel(
      ownerName: "",
      cardName: "",
      bankName: "",
      amount: 0,
      cardNumber: "",
      color: "",
      expireDate: "",
      isMain: false);

  CardModel copyWith({
    String? bankName,
    String? cardName,
    double? amount,
    String? cardNumber,
    String? color,
    String? expireDate,
    double? ieltsLevel,
    String? ownerName,
    bool? isMain,
    String? uuid,
  }) {
    return CardModel(
      cardName: cardName ?? this.cardName,
      ownerName: ownerName ?? this.ownerName,
      bankName: bankName ?? this.bankName,
      amount: amount ?? this.amount,
      color: color ?? this.color,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      isMain: isMain ?? this.isMain,
      uuId: uuid ?? uuId,
    );
  }
}
