import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/favorites/cubit/cubit.dart';
import 'package:latech_app/features/favorites/cubit/states.dart';
import 'package:latech_app/features/product/cubit/cubit.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/loading_indicator.dart';
import 'package:latech_app/widgets/product_card.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: appBar2(''),
      body: BlocProvider(
        create: (context) => FavoritesCubit()..getFavorites(),
        child: BlocBuilder<FavoritesCubit , FavoriteStates>(
          builder: (context, state) {
            if(state is FavoriteLoadingState) return Scaffold(body: LoadingIndicator(),);
            final favoriteData = FavoritesCubit.get(context).favoriteModel!.data!.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Text('Favorites' , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                     return Dismissible(
                       onDismissed: (direction) => ProductCubit(favoriteData![index].product!.id).toggleFavorite(),
                       key: Key(favoriteData![index].product!.id.toString()),
                       child: Container(
                          height: sizeFromHeight(5),
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(favoriteData[index].product!.image.toString(),
                                ),
                              )),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(favoriteData[index].product!.name.toString() , style: TextStyle(height: 1.3,fontWeight: FontWeight.w700,fontSize: 10),),
                                      SizedBox(height: 10),
                                      Text(favoriteData[index].product!.price.toString(),style: TextStyle(fontWeight: FontWeight.w700,color: Colors.blue),),

                                    ],
                                  ),
                                ),
                              ),
                              // Expanded(child: IconButton(onPressed:(){
                              //
                              // }, icon:Icon(Icons.star),color: Colors.red,))

                            ],
                          ),
                        ),
                     );
                    },
                    itemCount: favoriteData!.length,

                  ),
                ),
              ],
            );
          } ,
        ),
      ),
    );
  }
}
