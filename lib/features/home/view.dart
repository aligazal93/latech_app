import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/features/home/cubit/cubit.dart';
import 'package:latech_app/features/home/cubit/states.dart';
import 'package:latech_app/features/home/units/home_categories.dart';
import 'package:latech_app/features/home/units/sales_section.dart';
import 'package:latech_app/features/home/units/slider_section.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';
import 'package:latech_app/widgets/product_card.dart';

import '../../constains.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar2('Home') ,
      body: RefreshIndicator(
        onRefresh: HomeCubit.get(context).getHomeData,
        backgroundColor: kPrimaryColor,
        color: Colors.white,
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) => state is HomeStateLoading ? LoadingIndicator() : ListView(
            children: [
              SliderSection(),
              MiniCategories(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'Sales',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: kAccentColor,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SalesSection(),
            ],
          ),
        ),
      )
    );
  }
}
