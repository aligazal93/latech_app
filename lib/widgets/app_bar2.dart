import 'package:flutter/material.dart';

import '../constains.dart';

appBar2(String title) => AppBar(
  elevation: 0.0,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: kAccentColor),
  title: Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold,color: kAccentColor,fontSize: 18),
  ),
);