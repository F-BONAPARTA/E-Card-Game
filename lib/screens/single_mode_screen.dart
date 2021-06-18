import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_cards/constants.dart';
import 'package:e_cards/controllers/singel_mode_controller.dart';
import 'package:e_cards/game_logic/singel_mode_logic.dart';
import 'package:e_cards/models/card_model.dart';
import 'package:e_cards/widgets/dialogs/back_browser_button.dart';
import 'package:e_cards/widgets/dialogs/end_game_dialog.dart';
import 'package:e_cards/widgets/dialogs/ensure_dialog.dart';
import 'package:e_cards/widgets/game_card_widget.dart';
import 'package:e_cards/widgets/wining_video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleModeScreen extends StatefulWidget {
  @override
  _SingleModeScreenState createState() => _SingleModeScreenState();
}

class _SingleModeScreenState extends State<SingleModeScreen> {
  CardModel? currentKaijiCard;
  CardModel? currentTonegawaCard;
  int count = 0;
  int roundNumber = 0;
  @override
  void initState() {
    super.initState();
    final c = Get.find<SingelModeController>();
    c.setTonegawaCards(false);
    c.setKaikiCards(true);
  }

  void _increaseRoundNumber() {
    final c = Get.find<SingelModeController>();
    setState(() {
      roundNumber++;
    });
    if (roundNumber == 4) {
      showEndGameDialog(
        text: (c.kaijiScore.value == c.tonegawaScore.value)
            ? 'there is no winner both are equals'
            : (c.kaijiScore.value > c.tonegawaScore.value)
                ? 'You Are The Winner'
                : 'You Lose The Game',
        context: context,
        cancelFun: () {
          setState(() {
            currentKaijiCard = null;
            currentTonegawaCard = null;
            count = 0;
            roundNumber = 0;
            c.tonegawaScore.value = 0;
            c.kaijiScore.value = 0;
            c.setTonegawaCards(false);
            c.setKaikiCards(true);
          });
          Get.back();
        },
        dialogType: DialogType.INFO,
        okFun: () {
          setState(() {
            currentKaijiCard = null;
            currentTonegawaCard = null;
            count = 0;
            roundNumber = 0;
            c.tonegawaScore.value = 0;
            c.kaijiScore.value = 0;
            c.setTonegawaCards(false);
            c.setKaikiCards(true);
          });
        },
      );
    } else {
      c.setKaikiCards(roundNumber.isEven);
      c.setTonegawaCards(roundNumber.isOdd);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final c = Get.find<SingelModeController>();

        showBackBrowserButtonDialog(
          context: context,
          okFun: () {
            setState(() {
              currentKaijiCard = null;
              currentTonegawaCard = null;
              count = 0;
              roundNumber = 0;
              c.tonegawaScore.value = 0;
              c.kaijiScore.value = 0;
              c.setTonegawaCards(false);
              c.setKaikiCards(true);
            });
            Get.back();
          },
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF013120),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTonegawaCards(),
            buildFightingArea(),
            buildKaijiCards(),
          ],
        ),
      ),
    );
  }

  Widget buildTonegawaCards() {
    return GetX<SingelModeController>(
      builder: (controller) {
        return SizedBox(
          height: Get.height * 0.2,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.toneGawaCards.length,
            itemBuilder: (context, index) => Container(
              //   height: Get.height * 0.07,
              //  width: Get.width * 0.2,
              child: GameCardImage(
                cardType: controller.toneGawaCards[index].cardType,
                isBackCard: true,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildKaijiCards() {
    return GetX<SingelModeController>(
      builder: (controller) {
        return SizedBox(
          height: Get.height * 0.2,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.kaijiGawaCards.length,
            itemBuilder: (context, index) => count.isOdd
                ? Container(
                    child: GameCardImage(
                      cardType: controller.kaijiGawaCards[index].cardType,
                      isBackCard: false,
                    ),
                  )
                : Draggable<CardModel>(
                    data: controller.kaijiGawaCards[index],
                    onDragEnd: (_) {},
                    feedback: Container(
                      height: 300,
                      width: 200,
                      child: GameCardImage(
                        cardType: controller.kaijiGawaCards[index].cardType,
                        isBackCard: false,
                      ),
                    ),
                    child: Container(
                      child: GameCardImage(
                        cardType: controller.kaijiGawaCards[index].cardType,
                        isBackCard: false,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget buildFightingArea() {
    return GetX<SingelModeController>(
      builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/tonegawa.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.tonegawaScore.value.toString(),
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            currentTonegawaCard != null
                ? Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                    child: GameCardImage(
                      cardType: currentTonegawaCard!.cardType,
                      isBackCard: true,
                    ),
                  )
                : Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  ),
            Column(
              children: [
                Text(
                  'VS',
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Round ${roundNumber + 1}/4',
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            DragTarget<CardModel>(
              builder: (context, candidateData, rejectedData) {
                return currentKaijiCard != null
                    ? Container(
                        height: 300,
                        width: 200,
                        child: GameCardImage(
                            isBackCard: count.isEven ? false : true,
                            cardType: currentKaijiCard!.cardType),
                      )
                    : Container(
                        height: 300,
                        width: 200,
                        color: Colors.red,
                      );
                // return Container(
                //   height: 300,
                //   width: 200,
                //   color: Colors.red,
                // );
              },
              onWillAccept: (_) => true,
              onAccept: (data) {
                setState(() {
                  currentKaijiCard = CardModel(
                      cardType: data.cardType,
                      gameCharacter: data.gameCharacter);
                });
                showEnsureDialog(
                  context: context,
                  okFun: () async {
                    controller.kaijiGawaCards.remove(data);
                    setState(() {
                      count++;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    setState(() {
                      currentTonegawaCard = CardModel(
                          cardType: controller.toneGawaCards[0].cardType,
                          gameCharacter:
                              controller.toneGawaCards[0].gameCharacter);
                      controller.toneGawaCards.removeAt(0);
                    });
                    Map _result = SingelModeLogic.calculateTheWinner(
                        currentKaijiCard!.cardType,
                        currentTonegawaCard!.cardType);
                    if (_result['character'] != null) {
                      GameCharacters _character = _result['character'];
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true, // user must tap button!
                        builder: (BuildContext context) =>
                            WiningVideoWidget(videoUrl: _result['url']),
                      );
                      if (_character == GameCharacters.KAIJI) {
                        controller.kaijiScore.value += _result['score'] as int;
                      } else {
                        controller.tonegawaScore.value +=
                            _result['score'] as int;
                      }
                      _increaseRoundNumber();
                    } else {
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true, // user must tap button!
                        builder: (BuildContext context) =>
                            WiningVideoWidget(videoUrl: _result['url']),
                      );
                    }
                    await Future.delayed(Duration(seconds: 2));

                    setState(() {
                      currentKaijiCard = null;
                      currentTonegawaCard = null;
                      count++;
                    });
                  },
                  cancelFun: () {
                    setState(() {
                      currentKaijiCard = null;
                    });
                  },
                );
              },
            ),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/kaiji.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  controller.kaijiScore.value.toString(),
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
