import 'package:e_cards/constants.dart';
import 'package:e_cards/game_logic/winner_video.dart';

class SingelModeLogic {
  static Map calculateTheWinner(CardType kaijiCard, CardType tonegawaCard) {
    switch (kaijiCard) {
      case CardType.EMPEROR:
        if (tonegawaCard == CardType.CITIZEN) {
          return {
            'character': GameCharacters.KAIJI,
            'score': 1,
            'url': KaijiWinningVideo.emperorVsCitizen(),
          };
        } else {
          return {
            'character': GameCharacters.TONEGAWA,
            'score': 5,
            'url': TonegawaWinnigVideo.slaveVsEmperor(),
          };
        }
      case CardType.CITIZEN:
        if (tonegawaCard == CardType.CITIZEN) {
          return {
            'score': 0,
            'url': KaijiEquivalentTonegawa.getEquivalentLink(),
          };
        } else if (tonegawaCard == CardType.EMPEROR) {
          return {
            'character': GameCharacters.TONEGAWA,
            'score': 1,
            'url': TonegawaWinnigVideo.emperorVsCitizen(),
          };
        } else {
          return {
            'character': GameCharacters.KAIJI,
            'score': 1,
            'url': KaijiWinningVideo.citizenVsSlave(),
          };
        }
      case CardType.SLAVE:
        if (tonegawaCard == CardType.CITIZEN) {
          return {
            'character': GameCharacters.TONEGAWA,
            'score': 1,
            'url': TonegawaWinnigVideo.citizenVsSlave(),
          };
        } else {
          return {
            'character': GameCharacters.KAIJI,
            'score': 5,
            'url': KaijiWinningVideo.slaveVsEmperor(),
          };
        }
    }
  }
}
