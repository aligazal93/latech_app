import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';

void showSnackBar(String message, {Color? color}) {
  ScaffoldMessenger.of(MagicRouter.currentContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center,),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
    ),
  );
}
