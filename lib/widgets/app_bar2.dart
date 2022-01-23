import 'package:flutter/material.dart';
import 'package:latech_app/widgets/app_bar.dart';

import '../constains.dart';

appBar2(String title) => AppBar(
  elevation: 0.0,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: kAccentColor),
  title: Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold,color: kAccentColor,fontSize: 18),
  ),
  // bottom: PreferredSize(
  //
  //   preferredSize: AppBar().preferredSize,
  //   child: Align(
  //      alignment: Alignment.bottomLeft,
  //       child: Text('Favorites' , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26), textAlign: TextAlign.start,)),
  //
  // ),
);