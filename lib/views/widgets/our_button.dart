import 'package:Indi_seller/const/colors.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ourButton({title, color = purpleColor, onPress}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius : BorderRadius.circular(11)
      ),
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
      onPressed: onPress,
      child: boldText(
          text: title,
          size: 16.0
      ),
  );

}