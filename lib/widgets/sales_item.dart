import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class SalesItem extends StatelessWidget {
  const SalesItem({Key? key, this.sale, this.image, this.title}) : super(key: key);
  final String? sale;
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Color(0xFFE0ECF8),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Text(sale.toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xFF0001FC)),),
          ),
          Image.network(image.toString(),
          width: sizeFromHeight(3),
            height: sizeFromWidth(4),
          ),
          SizedBox(height: 20),
          Center(child: Text(title.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),)
        ],
      ),
    );
  }
}
