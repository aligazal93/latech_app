import 'package:flutter/material.dart';
import 'package:latech_app/features/search/cubit/cubit.dart';
import 'package:latech_app/widgets/input_text_field.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = SearchCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFF1F53E4)),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InputTextField(
          hintText: 'What are you looking for ?',
          obscureText: false,
          validator: (v) {
            if(v!.isEmpty)
              return 'Please enter What You want Search';
            else
              return null;
          },
          onSubmit: (v) => cubit.getSearchData(v),

        ),
      ),
    );
  }
}
