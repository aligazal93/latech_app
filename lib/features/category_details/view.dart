import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/product_card.dart';

class detailsOfCategory extends StatelessWidget {
  const detailsOfCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Mobiles Phone'),
      body: Container(
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5),
          itemBuilder: (context, index) => ProductCard(
            image: 'https://www.citypng.com/public/uploads/preview/-21602651542ujkcgwlwka.png',
            title: 'Iphone 13 , 256 GB',
            price: 21000,
          ))
      ),
    );
  }
}
