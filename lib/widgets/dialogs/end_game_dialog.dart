import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

showEndGameDialog({
  required BuildContext context,
  required VoidCallback okFun,
  required String text,
  required VoidCallback cancelFun,
  required DialogType dialogType,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.BOTTOMSLIDE,
    width: 500,
    desc: text,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancelOnPress: cancelFun,
    btnCancelText: 'Back',
    btnOkText: 'New Game',
    btnOkOnPress: okFun,
  )..show();
}
