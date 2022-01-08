import 'package:flutter/material.dart';

import '../constains.dart';

appBar(String title) => AppBar(
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: kPrimaryColor,
  title: Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
);