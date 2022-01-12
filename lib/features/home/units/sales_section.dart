import 'package:flutter/material.dart';
import 'package:latech_app/widgets/product_card.dart';
import 'package:latech_app/widgets/sales_item.dart';

class SalesSection extends StatelessWidget {
  const SalesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5),
      itemBuilder: (context, index) => ProductCard(
        title: 'Iphone 132 256 Gb',
        image: 'https://sc04.alicdn.com/kf/H75748bb2d6d741ed9e3fc4ecf74b5e86F/221994169/H75748bb2d6d741ed9e3fc4ecf74b5e86F.png',
        price: 500000,
      ),
    );
  }
}
