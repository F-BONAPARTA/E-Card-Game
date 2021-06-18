import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class GameCardImage extends StatelessWidget {
  final bool isBackCard;
  final CardType cardType;
  const GameCardImage({
    required this.isBackCard,
    required this.cardType,
  });
  String _getImageUrl() {
    switch (cardType) {
      case CardType.EMPEROR:
        return 'assets/images/emperpr.jpg';
      case CardType.CITIZEN:
        return 'assets/images/citizin.jpg';
      case CardType.SLAVE:
        return 'assets/images/slave.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isBackCard ? 'assets/images/back4.png' : _getImageUrl(),
      fit: BoxFit.cover,
    );
  }
}
