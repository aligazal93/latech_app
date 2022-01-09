import 'package:flutter/material.dart';
import 'package:latech_app/constains.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({Key? key, this.upperText, this.hintText, this.onSaved, this.validator, this.textInputType, this.obscureText = false}) : super(key: key);

  final String? upperText;
  final String? hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(upperText != null)
          Text(upperText!,style: TextStyle(color: kWhiteColor),),
        SizedBox(height: 10),
        TextFormField(
          obscureText: obscureText,
          style: TextStyle(color:Colors.white,fontSize: 14),
          onSaved: onSaved,
          validator: validator,
          keyboardType:textInputType,
          decoration:InputDecoration(
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              border: OutlineInputBorder(
                 borderRadius: new BorderRadius.circular(7.0),
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
