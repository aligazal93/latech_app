import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latech_app/constains.dart';
import 'package:latech_app/features/search/cubit/cubit.dart';
import 'package:latech_app/features/search/cubit/states.dart';
import 'package:latech_app/features/search/model.dart';
import 'package:latech_app/features/search/units/search_input.dart';
import 'package:latech_app/features/search/units/search_result.dart';
import 'package:latech_app/widgets/app_bar.dart';
import 'package:latech_app/widgets/app_bar2.dart';
import 'package:latech_app/widgets/input_text_field.dart';
import 'package:latech_app/widgets/loading_indicator.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2('Search'),
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit,SearchStates>(
          builder:(context, state) =>  state is SearchLoadingState ? LoadingIndicator() :
               Column(
                children: [
                  SearchInput(),
                  SearchResult(),
                ],
              ),
          ),
        ),
      );
  }
}
