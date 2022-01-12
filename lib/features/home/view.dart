import 'package:flutter/material.dart';
import 'package:latech_app/features/home/units/home_categories.dart';
import 'package:latech_app/features/home/units/sales_section.dart';
import 'package:latech_app/features/home/units/slider_section.dart';
import 'package:latech_app/widgets/product_card.dart';

import '../../constains.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SliderSection(),
        MiniCategories(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text('Sales',style: TextStyle(fontWeight: FontWeight.w700,color: kAccentColor,fontSize: 26,),textAlign: TextAlign.center,),
        ),
        SalesSection(),


      ],
    );
  }
}
