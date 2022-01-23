import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/cart/view.dart';
import 'package:latech_app/features/home/cubit/cubit.dart';
import 'package:latech_app/features/home/view.dart';
import 'package:latech_app/features/login/view.dart';
import 'package:latech_app/features/home/units/sales_section.dart';
import 'package:latech_app/features/home/units/slider_section.dart';
import 'package:latech_app/features/search/view.dart';
import 'package:latech_app/widgets/app_bar.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/navigator_bottom.dart';
import 'package:latech_app/widgets/sales_item.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;


  final pages = [
    HomeView(),
    SearchView(),
    CartView(),
    Text('Profile'),
  ];

  void toggleTab(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        // appBar: appBar2('home'),
        backgroundColor: Color(0xFFFDFEFF),
        bottomNavigationBar: BottomNavigatePages(onTap: toggleTab, index: _currentIndex,),
        body: pages[_currentIndex],
      ),
    );
  }
}
