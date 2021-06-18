import 'package:e_cards/constants.dart';
import 'package:e_cards/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SingelModeController extends GetxController {
  RxList<CardModel> toneGawaCards = <CardModel>[].obs;
  RxList<CardModel> kaijiGawaCards = <CardModel>[].obs;

  RxInt tonegawaScore = 0.obs;
  RxInt kaijiScore = 0.obs;
  void setTonegawaCards(bool isEmperor) {
    toneGawaCards.clear();
    List<CardModel> _dummyList = [];
    _tonegawaCards.forEach((element) {
      if (isEmperor) {
        if (element.cardType != CardType.SLAVE) {
          _dummyList.add(element);
        }
      } else {
        if (element.cardType != CardType.EMPEROR) {
          _dummyList.add(element);
        }
      }
    });
    _dummyList.shuffle();
    toneGawaCards.assignAll(_dummyList);
  }

  void setKaikiCards(bool isEmperor) {
    kaijiGawaCards.clear();
    List<CardModel> _dummyList = [];
    _kaijiCards.forEach((element) {
      if (isEmperor) {
        if (element.cardType != CardType.SLAVE) {
          _dummyList.add(element);
        }
      } else {
        if (element.cardType != CardType.EMPEROR) {
          _dummyList.add(element);
        }
      }
    });
    _dummyList.shuffle();
    kaijiGawaCards.assignAll(_dummyList);
  }
}

List<CardModel> _tonegawaCards = [
  CardModel(cardType: CardType.EMPEROR, gameCharacter: GameCharacters.TONEGAWA),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.TONEGAWA),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.TONEGAWA),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.TONEGAWA),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.TONEGAWA),
  CardModel(cardType: CardType.SLAVE, gameCharacter: GameCharacters.TONEGAWA),
];
List<CardModel> _kaijiCards = [
  CardModel(cardType: CardType.EMPEROR, gameCharacter: GameCharacters.KAIJI),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.KAIJI),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.KAIJI),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.KAIJI),
  CardModel(cardType: CardType.CITIZEN, gameCharacter: GameCharacters.KAIJI),
  CardModel(cardType: CardType.SLAVE, gameCharacter: GameCharacters.KAIJI),
];
