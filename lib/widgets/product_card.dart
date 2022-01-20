import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/core/app_router/router.dart';
import 'package:latech_app/features/home/cubit/cubit.dart';
import 'package:latech_app/features/product/cubit/cubit.dart';
import 'package:latech_app/features/product/view.dart';


class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.image, this.title, this.price, this.id,required this.isFavorites}) : super(key: key);
  final String? image;
  final String? title;
  final double? price;
  final int? id;
  final bool isFavorites;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  late bool isFavourite;

  @override
  void initState() {
    isFavourite = widget.isFavorites;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        MagicRouter.navigateTo(ProductView(
          title: widget.title.toString(),
          id: widget.id,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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
            Expanded(child: Center(child: Image.network(widget.image.toString(),))),
            SizedBox(height: 5),
            Text(widget.title.toString(),style: TextStyle(height: 1.3,fontSize:12,fontWeight: FontWeight.w700,color: kAccentColor),maxLines: 2,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Usd' , style: TextStyle(fontSize:10,fontWeight: FontWeight.w700,color: kAccentColor),),
                SizedBox(width: 5),
                Text(widget.price.toString() , style: TextStyle(fontSize:11,fontWeight: FontWeight.w700,color: kAccentColor),),
                Spacer(),
                IconButton(
                    onPressed: () {
                      ProductCubit(widget.id).toggleFavorite();
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                    },
                    icon: Icon(Icons.star,size: 18,
                color: isFavourite ? Colors.green : Colors.grey,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
