import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField({label, hint, controller}){
  return TextFormField(
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: label),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       color: white,
  //     )
  // ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: white,
        )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          )
      ),
      hintText: hint,
      hintStyle: const TextStyle(color: lightGrey)
    ),
  );
}