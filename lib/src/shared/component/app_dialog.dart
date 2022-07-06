import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/text_style_constants.dart';

Future<dynamic> showErrDialogApp({
  required BuildContext context,
  required String title,
  required String content,
  String? deleteActionText,
  required String defaultActionText,
  VoidCallback? onPressed,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(
        title,
        style: AppTextStyle.body1Bold,
      ),
      content: Text(
        content,
        style: AppTextStyle.caption1,
        textAlign: TextAlign.center,
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            defaultActionText,
            style: AppTextStyle.body1Medium.copyWith(color: textNormal),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        if (deleteActionText != null)
          CupertinoDialogAction(
            child: Text(
              deleteActionText,
              style: AppTextStyle.body1Medium.copyWith(color: textButtonDelete),
            ),
            onPressed: onPressed,
          ),
      ],
    ),
  );
}
