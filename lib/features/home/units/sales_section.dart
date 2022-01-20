import 'package:flutter/material.dart';
import 'package:latech_app/features/home/cubit/cubit.dart';
import 'package:latech_app/widgets/product_card.dart';
import 'package:latech_app/widgets/sales_item.dart';

class SalesSection extends StatelessWidget {
  const SalesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = HomeCubit.get(context).homeModel!.data!.products!;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5),
      itemBuilder: (context, index) => ProductCard(
        title: products[index].name,
        image: products[index].image,
        price: products[index].price,
        id: products[index].id,
        isFavorites: products[index].inFavorites!,
      ),
    );
  }
}
