import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';

double sizeFromHeight(double fraction) => (MediaQuery.of(MagicRouter.currentContext).size.height - AppBar().preferredSize.height) / fraction;

double sizeFromWidth(double fraction) => MediaQuery.of(MagicRouter.currentContext).size.width / fraction;


const Color kPrimaryColor = Color(0xFF0102FC);

const Color kAccentColor = Color(0xFF0A1034);

const Color kGreyColor = Color(0xFFA7A9BE);

const Color kWhiteColor = Color(0xFFFFFFFF);

const Color kYellowColor = Color(0xFFFBDF00);


ThemeData theme = ThemeData(
  fontFamily: 'mono',
  primaryColor: kPrimaryColor,
  accentColor: kAccentColor,
  backgroundColor: kWhiteColor,
);



