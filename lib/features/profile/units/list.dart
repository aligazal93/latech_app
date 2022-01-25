import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/account_info/view.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({Key? key, this.txt, this.function,}) : super(key: key);
  final String? txt;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:function,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        child: Text(txt.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
      ),
    );
  }
}
