import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/categories/units/all_list.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/category_list.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Categories'),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CategoryTile(title: 'All'),
          CategoryTile(title: 'Accessories'),
          CategoryTile(title: 'Mobile Phones'),
          CategoryTile(title: 'Smart objects'),
          CategoryTile(title: 'Computers'),
          CategoryTile(title: 'LapTops'),
          CategoryTile(title: 'Speakers'),
        ],
      ),
    );
  }
}
