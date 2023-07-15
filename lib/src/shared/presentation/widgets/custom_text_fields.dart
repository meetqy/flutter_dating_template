import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields(
      {Key? key,
      required this.labeltext,
      this.onChanged,
      this.errortext,
      this.obscureText = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  final String labeltext;
  final String? errortext;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
      onChanged: onChanged,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
          errorText: errortext,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
