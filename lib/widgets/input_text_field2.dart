import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class InputTextField2 extends StatelessWidget {
  const InputTextField2({Key? key, this.upperText, this.hintText, this.onSaved, this.validator, this.textInputType, this.obscureText = false, this.onSubmit}) : super(key: key);

  final String? upperText;
  final String? hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function(String)? onSubmit;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(upperText != null)
          Text(upperText!,style: TextStyle(color: Colors.red),),
        SizedBox(height: 0),
        TextFormField(
          obscureText: obscureText,
          style: TextStyle(color:kAccentColor,fontSize: 14),
          onSaved: onSaved,
          validator: validator,
          keyboardType:textInputType,
          textInputAction: onSubmit != null ? TextInputAction.search : null,
          decoration:InputDecoration(
              fillColor:kAccentColor,
              contentPadding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color:kAccentColor),
                borderRadius: BorderRadius.circular(7),
              ),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(7.0),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: kWhiteColor,fontSize: 13)
          ),
          onFieldSubmitted: onSubmit,
        ),
        SizedBox(height: 20),

      ],
    );
  }
}
