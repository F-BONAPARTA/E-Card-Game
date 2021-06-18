import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

showEnsureDialog(
    {required BuildContext context,
    required VoidCallback okFun,
    required VoidCallback cancelFun}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    animType: AnimType.BOTTOMSLIDE,
    width: 500,
    desc: 'Sure or Not ?',
    dismissOnTouchOutside: false,
    btnCancelOnPress: cancelFun,
    btnCancelText: 'Not',
    btnOkText: 'Sure',
    btnOkOnPress: okFun,
  )..show();
}
