import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class BottomNavigatePages extends StatelessWidget {

  final  Function(int)? onTap;
  final int index;

  BottomNavigatePages({Key? key, this.onTap, required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFEFF5FB),
      currentIndex: index,
      showSelectedLabels: false,
      selectedItemColor: kPrimaryColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:''),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.shopping_cart)),
        BottomNavigationBarItem(label: '',icon: Icon(Icons.person)),
      ],
      onTap: onTap,
    );
  }
}
