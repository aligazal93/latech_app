import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/cart/cubit/cubit.dart';
import 'package:latech_app/features/cart/cubit/states.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Shopping Cart'),
      body:BlocProvider(
        create: (context) => CartCubit()..getCart(),
        child: BlocBuilder<CartCubit,CartStates>(
          builder: (context, state) {
            if (state is CartLoadingState) return Scaffold(body: LoadingIndicator());
            final data = CartCubit.get(context).cartModel!.data!;
            final cartDetails = data.cartItems!;
            return Column(
              children: [
                Expanded(
                    flex: 5,
                    child: ListView.builder(
                      itemCount: cartDetails.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white10.withOpacity(0.8),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Image.network(
                              cartDetails[index].product!.image!,
                            )),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cartDetails[index].product!.name!,style: TextStyle(fontWeight: FontWeight.w700,color: kAccentColor,fontSize: 14,overflow: TextOverflow.ellipsis),),
                                  SizedBox(height: 10),
                                  Text('USD '+ cartDetails[index].product!.price.toString(),style: TextStyle(fontWeight: FontWeight.w700,color: kPrimaryColor,fontSize: 14),),

                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    borderRadius: BorderRadius.circular(10),
                                    focusColor: Colors.red,
                                    mouseCursor: MouseCursor.uncontrolled,
                                    splashColor: Colors.red,
                                    child: CircleAvatar(
                                      child: Icon(Icons.add,size: 18,),
                                      backgroundColor: Color(0xFFE0ECF8),
                                      radius: 15,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFE0ECF8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Text('X' + cartDetails[index].quantity.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: CircleAvatar(
                                      child: Icon(Icons.remove,size: 18,),
                                      backgroundColor: Color(0xFFE0ECF8),
                                      radius: 15,
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                        Text( data.total.toString() +' USD',style:  TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: kPrimaryColor),),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: MaterialButton(
                      padding: EdgeInsets.all(15),
                      onPressed: (){},
                      color: kPrimaryColor,
                      child: Text('Complete Order',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ) ,
    );
  }
}
