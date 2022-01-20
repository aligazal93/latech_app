import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/search/cubit/cubit.dart';
import 'package:latech_app/features/search/cubit/states.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:  (context) {
        final searchResult = SearchCubit.get(context).searchModel?.data?.data;
        if(searchResult == null || searchResult.isEmpty){
          return Center(child: Text('NoThing To Show'));
        }
        return  Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.network(
                              searchResult[index].image!,width: sizeFromWidth(1),height: sizeFromHeight(4),
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              Text(searchResult[index].name!),
                              SizedBox(height: 10),
                              Text(searchResult[index].price.toString()),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    padding:EdgeInsets.symmetric(horizontal: 10),
                  ),
                ],
              );
            },
            itemCount:searchResult.length,
          ),
        );
      },
    );

  }
}
