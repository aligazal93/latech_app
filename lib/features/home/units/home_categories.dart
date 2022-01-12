import 'package:flutter/material.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/categories/view.dart';

class MiniCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => MagicRouter.navigateTo(CategoriesView()),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: 45,
                decoration: BoxDecoration(
                    color: Color(0XFFE0ECF8),
                    borderRadius: BorderRadius.circular(150)),
                height: 45,
                child: Icon(
                  Icons.list,
                  color: Color(0XFF0001FC),
                ),
              ),
              Text(
                'Categories',
                style: TextStyle(
                    color: Color(0XFF0001FC), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                  // margin: EdgeInsets.only(top: 20, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0XFFE0ECF8),
                      borderRadius: BorderRadius.circular(150)),
                  // height: 45,
                  child: Icon(
                    Icons.star,
                    color: Color(0XFF0001FC),
                  )),
              SizedBox(height: 5,),
              Text(
                'Favourites',
                style: TextStyle(
                    color: Color(0XFF0001FC), fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
