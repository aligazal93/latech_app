import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';


class AppButton extends StatelessWidget {

  final Function()? onPressed;
  final String title;
  final Color backgroundColor;

  const AppButton({Key? key, this.onPressed, required this.title, this.backgroundColor = kPrimaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      disabledColor: kGreyColor,
      padding: EdgeInsets.all(13),
      minWidth: double.infinity,
      child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor),),
    );
  }
}
