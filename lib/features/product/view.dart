import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/product/cubit/cubit.dart';
import 'package:latech_app/features/product/cubit/states.dart';
import 'package:latech_app/features/product/model.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key, this.title, this.id}) : super(key: key);
 final String? title;
 final int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(''),
      body: BlocProvider(
        create: (context) => ProductCubit(id)..getProductDetails(),
        child: BlocBuilder<ProductCubit , ProductStates>(
          builder: (context, state) {
            if (state is ProductLoadingState) return Scaffold(body: LoadingIndicator());
            final productDetails = ProductCubit.get(context).productDetailsModel!.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(productDetails!.name.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,height: 1.5),),
                ),
                Expanded(
                 child: ListView(
                    children: [

                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 0, left: 30),
                            padding: EdgeInsets.all(10),
                            width: 100,
                            color: Color(0xFFE0ECF8),
                            child: Center(
                                child: Text(
                                  productDetails.discount.toString()  + 'Off',
                                  style:
                                  TextStyle(color: kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CarouselSlider(
                          items: productDetails.images!.map((e) =>
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(e,
                                  fit: BoxFit.contain,
                                ),
                              ))
                              .toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Old Price : ', style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100,)),
                              SizedBox(width: 10),
                              Text(productDetails.oldPrice.toString(), style: TextStyle(fontWeight: FontWeight
                                  .w700, decoration: TextDecoration.lineThrough))
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total Price : ', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700,)),
                              SizedBox(width: 10),
                              Text(productDetails.price.toString(), style: TextStyle(fontWeight: FontWeight
                                  .w700, color: Colors.black))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description : ', style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),),
                            SizedBox(height: 10),
                            Text(productDetails.description.toString(), style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),),
                            SizedBox(height: 10),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.all(14),
                          onPressed: () {},
                          child: Text('Add To Cart',
                            style: TextStyle(color: Colors.white),),
                          color: kPrimaryColor,

                        ),
                      ),
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFE0ECF8),
                          radius: 24,
                          child: Icon(
                            Icons.star, size: 26, color: kPrimaryColor,),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
