import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

showBackBrowserButtonDialog({
  required BuildContext context,
  required VoidCallback okFun,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.BOTTOMSLIDE,
    width: 500,
    desc: 'Are you Wanna  Exit ?',
    dismissOnTouchOutside: false,
    btnCancelOnPress: () {},
    btnCancelText: 'Nop',
    btnOkText: 'Yub',
    btnOkOnPress: okFun,
  )..show();
}
