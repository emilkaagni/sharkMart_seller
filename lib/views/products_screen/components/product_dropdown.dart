import 'package:Indi_seller/const/const.dart';
import 'package:Indi_seller/views/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget productDropdown(){
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose category", color: fontGrey),
      value: null,
      isExpanded: true,
      items: const[],
      onChanged: (value){},
    ),
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}