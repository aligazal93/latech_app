import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({Key? key, this.upperText, this.hintText}) : super(key: key);

  final String? upperText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(upperText != null)
          Text(upperText!,style: TextStyle(color: kWhiteColor),),
        SizedBox(height: 10),
        TextField(
          decoration:InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: kWhiteColor,fontSize: 13)
          ),
        ),
        SizedBox(height: 20),

      ],
    );
  }
}
