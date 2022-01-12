import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/category_details/view.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MagicRouter.navigateTo(detailsOfCategory());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(7),
        ),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        padding: EdgeInsets.all(20),
        width: sizeFromWidth(1),
        child: Text(title.toString(),style: TextStyle(fontWeight: FontWeight.w700,color: kAccentColor,fontSize: 20),),
      ),
    );
  }
}
