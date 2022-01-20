import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/categories/cubit/cubit.dart';
import 'package:latech_app/features/categories/cubit/states.dart';
import 'package:latech_app/features/categories/units/all_list.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/category_list.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class CategoriesView extends StatelessWidget {
   CategoriesView({Key? key, this.title, this.id}) : super(key: key);
  final String? title;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Categories'),
      body: BlocProvider(
        create: (context) => CategoriesCubit()..getAllCategories(),
        child: BlocBuilder<CategoriesCubit, CategoriesStates>(
          builder: (context, state) {
            if (state is CategoriesStateLoading) return LoadingIndicator();
            final categories = CategoriesCubit.get(context).categoriesModel!.data!.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryTile(
                title: categories[index].name,
                id: categories[index].id,
              ),
              physics: BouncingScrollPhysics(),
            );
          },
        ),
      ),
    );
  }
}
