import '../constants.dart';

class CardModel {
  final CardType cardType;
  final GameCharacters gameCharacter;
  CardModel({
    required this.cardType,
    required this.gameCharacter,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardModel &&
        other.cardType == cardType &&
        other.gameCharacter == gameCharacter;
  }

  @override
  int get hashCode => cardType.hashCode ^ gameCharacter.hashCode;
}
