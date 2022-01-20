import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/category_details/cubit/cubit.dart';
import 'package:latech_app/features/category_details/cubit/states.dart';
import 'package:latech_app/features/category_details/model.dart';
import 'package:latech_app/widgets/app_bar.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';
import 'package:latech_app/widgets/product_card.dart';

class detailsOfCategory extends StatelessWidget {
  const detailsOfCategory({Key? key, this.id, this.title}) : super(key: key);
  final int? id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDetailsCubit(id)..getCategoriesDetailsData(),
      child: BlocBuilder<CategoriesDetailsCubit , CategoriesDetailsStates>(
        builder: (context, state) {
          if(state is CategoriesDetailsLoadingStates) return Scaffold(body: LoadingIndicator());
          final categoriesData = CategoriesDetailsCubit.get(context).categoriesDetailsModel!.data!.data!;
          return Scaffold(
            appBar: appBar2(title.toString()),
            body: Container(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: categoriesData.length,
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5),
                    itemBuilder: (context, index) => ProductCard(
                      image: categoriesData[index].image,
                      title: categoriesData[index].name,
                      price: categoriesData[index].price,
                      id: categoriesData[index].id,
                      isFavorites: categoriesData[index].inFavorites!,

                    ))
            ),
          );
        },
      ),
    );
  }
}
