import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.image, this.title, this.price}) : super(key: key);
  final String? image;
  final String? title;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.network(image.toString(),))),
            SizedBox(height: 5),
            Text(title.toString(),style: TextStyle(fontSize:12,fontWeight: FontWeight.w700,color: kAccentColor),maxLines: 2,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Usd' , style: TextStyle(fontSize:10,fontWeight: FontWeight.w700,color: kAccentColor),),
                SizedBox(width: 5),
                Text(price.toString() , style: TextStyle(fontSize:11,fontWeight: FontWeight.w700,color: kAccentColor),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
